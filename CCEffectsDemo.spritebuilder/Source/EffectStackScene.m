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
    NSTimeInterval totalTime;
}

- (void)didLoadFromCCB {
    // GOOD:
    //    _spaceship.effect = [CCEffectPixellate effectWithBlockSize: 5];
    
    _spaceship.effect = [CCEffectGaussianBlur effectWithPixelBlurRadius:3];
    
    
    // more contrast
    CCEffectContrast *contrastEffect = [CCEffectContrast effectWithContrast:0.2];
    // more brightness
    _brightnessEffect = [CCEffectBrightness effectWithBrightness:sin(0)];
    _spaceship.effect = [[CCEffectStack alloc] initWithEffects:@[contrastEffect, _brightnessEffect]];
}

- (void)update:(CCTime)delta {
    totalTime += delta;
    
    _brightnessEffect.brightness = sin(totalTime);
}

@end
