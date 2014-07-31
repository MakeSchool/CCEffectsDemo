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
    // pixelation is very simple, you only need to choose a block size
    _spaceship.effect = [CCEffectPixellate effectWithBlockSize: 5];
}

@end
