//
//  CCEffectContrast.m
//  cocos2d-ios
//
//  Created by Thayer J Andrews on 5/7/14.
//
//

#import "CCEffectContrast.h"
#import "CCEffect_Private.h"
#import "CCRenderer.h"
#import "CCTexture.h"

static float conditionContrast(float contrast);


@interface CCEffectContrast ()

@property (nonatomic) NSNumber *conditionedContrast;

@end


@implementation CCEffectContrast

-(id)init
{
    return [self initWithContrast:0.0f];
}

-(id)initWithContrast:(float)contrast
{
    CCEffectUniform* uniformContrast = [CCEffectUniform uniform:@"float" name:@"u_contrast" value:[NSNumber numberWithFloat:1.0f]];
    
    if((self = [super initWithFragmentUniforms:@[uniformContrast] vertexUniforms:nil varying:nil]))
    {
        _contrast = contrast;
        _conditionedContrast = [NSNumber numberWithFloat:conditionContrast(contrast)];

        self.debugName = @"CCEffectContrast";
    }
    return self;
}

+(id)effectWithContrast:(float)contrast
{
    return [[self alloc] initWithContrast:contrast];
}

-(void)buildFragmentFunctions
{
    self.fragmentFunctions = [[NSMutableArray alloc] init];

    CCEffectFunctionInput *input = [[CCEffectFunctionInput alloc] initWithType:@"vec4" name:@"inputValue" snippet:@"texture2D(cc_PreviousPassTexture, cc_FragTexCoord1)"];

    NSString* effectBody = CC_GLSL(
                                   return vec4(((inputValue.rgb - vec3(0.5)) * vec3(u_contrast) + vec3(0.5)), inputValue.a);
                                   );
    
    CCEffectFunction* fragmentFunction = [[CCEffectFunction alloc] initWithName:@"contrastEffect" body:effectBody inputs:@[input] returnType:@"vec4"];
    [self.fragmentFunctions addObject:fragmentFunction];
}

-(void)buildRenderPasses
{
    __weak CCEffectContrast *weakSelf = self;
    
    CCEffectRenderPass *pass0 = [[CCEffectRenderPass alloc] init];
    pass0.debugLabel = @"CCEffectContrast pass 0";
    pass0.shader = self.shader;
    pass0.beginBlocks = @[[^(CCEffectRenderPass *pass, CCTexture *previousPassTexture){
        
        pass.shaderUniforms[CCShaderUniformMainTexture] = previousPassTexture;
        pass.shaderUniforms[CCShaderUniformPreviousPassTexture] = previousPassTexture;
        pass.shaderUniforms[weakSelf.uniformTranslationTable[@"u_contrast"]] = weakSelf.conditionedContrast;
    } copy]];
    
    self.renderPasses = @[pass0];
}

-(void)setContrast:(float)contrast
{
    _contrast = contrast;
    _conditionedContrast = [NSNumber numberWithFloat:conditionContrast(contrast)];
}

@end

float conditionContrast(float contrast)
{
    NSCAssert((contrast >= -1.0) && (contrast <= 1.0), @"Supplied contrast out of range [-1..1].");

    // Yes, this value is somewhat magical. It was arrived at experimentally by comparing
    // our results at min and max contrast (-1 and 1 respectively) with the results from
    // various image editing applications at their own min and max contrast values.
    static const float kContrastBase = 4.0f;
    
    float clampedExp = clampf(contrast, -1.0f, 1.0f);
    return powf(kContrastBase, clampedExp);
}
