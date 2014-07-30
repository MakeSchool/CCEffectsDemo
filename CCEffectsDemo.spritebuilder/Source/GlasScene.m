//
//  GlasScene.m
//  CCEffectsDemo
//
//  Created by Benjamin Encz on 30/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "GlasScene.h"

@implementation GlasScene {
    CCSprite *_crystal;
    CCSprite *_background;
}

- (void)didLoadFromCCB {
    
    CCSpriteFrame *normalMap = [CCSpriteFrame frameWithImageNamed:@"crystals/normalmaps/crystal-1-normal.png"];
    CCEffectGlass *glassEffect = [CCEffectGlass effectWithRefraction:0.1f refractionEnvironment:_background reflectionEnvironment:_background normalMap:normalMap];

    _crystal.effect = glassEffect;
}

@end
