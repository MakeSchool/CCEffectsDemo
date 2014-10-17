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
    /*
     The glass effect needs an enviroment which it shall refract, usually this is a background image in your game. Additionally it needs a normal map that describes the surface of the glass object. You can read more about Normal Maps here: http://en.wikipedia.org/wiki/Normal_mapping. Basically normal maps are used to simulate 3D effects, such as shadows or refraction of light on a sprite that is actually flat. The normal map itself is an image.
     */
    CCSpriteFrame *normalMap = [CCSpriteFrame frameWithImageNamed:@"crystals/normalmaps/crystal-1-normal.png"];
    
    CCEffectGlass *glassEffect = [CCEffectGlass effectWithShininess:0.2f refraction:0.2f refractionEnvironment:_background reflectionEnvironment:_background normalMap:normalMap];
    _crystal.effect = glassEffect;
}

@end
