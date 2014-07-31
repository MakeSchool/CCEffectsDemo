//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "PixelateScene.h"

@implementation PixelateScene {
    CCSprite *_spaceship;
}

- (void)didLoadFromCCB {
    // GOOD:
    //    _spaceship.effect = [CCEffectPixellate effectWithBlockSize: 5];
    
    _spaceship.effect = [CCEffectGaussianBlur effectWithPixelBlurRadius:3];
    
    
    // more contrast
    CCEffectContrast *contrastEffect = [CCEffectContrast effectWithContrast:0.2];
    // more brightness
    CCEffectBrightness *brightnessEffect = [CCEffectBrightness effectWithBrightness:-1];
    _spaceship.effect = [[CCEffectStack alloc] initWithEffects:@[contrastEffect, brightnessEffect]];
    
//    _spaceship.effect = [[CCEffectStack alloc] initWithEffects:@[[CCEffectGaussianBlur effectWithPixelBlurRadius:3], [CCEffectPixellate effectWithBlockSize: 5]]];
    
    // Needs background image with window or something similar
    //    _spaceship.effect = [CCEffectBloom effectWithPixelBlurRadius:2 intensity:0.8f luminanceThreshold:0.2f];
}

@end
