//
//  EffectStackScene.m
//  CCEffectsDemo
//
//  Created by Benjamin Encz on 31/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "EffectStackScene.h"

@implementation EffectStackScene {
    CCSprite *_spaceship;
    CCEffectBrightness *_brightnessEffect;
    NSTimeInterval _totalTime;
}

- (void)didLoadFromCCB {
    
    // Effects like changing the contrast and the brightness are one liners.
    CCEffectContrast *contrastEffect = [CCEffectContrast effectWithContrast:0.2];
    _brightnessEffect = [CCEffectBrightness effectWithBrightness:sin(0)];
    
    // A CCEffectStack allows you to combine multiple CCEffects and apply them to a Sprite
    CCEffectStack *effectStack = [[CCEffectStack alloc] initWithEffects:@[contrastEffect, _brightnessEffect]];
    
    _spaceship.effect = effectStack;
}

- (void)update:(CCTime)delta {
    _totalTime += delta;
    
    // effects can be changed over time, which allows you to animate parameters of effects. In this case we are animating the brightness of a CCEffectBrightness we created earlier
    _brightnessEffect.brightness = sin(_totalTime);
}

@end
