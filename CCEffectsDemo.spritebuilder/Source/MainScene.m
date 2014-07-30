//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"

@implementation MainScene {
    CCSprite *_spaceship;
}

- (void)didLoadFromCCB {
    // GOOD:
    //    _spaceship.effect = [CCEffectPixellate effectWithBlockSize: 5];
    
    // Needs background image with window or something similar
    //    _spaceship.effect = [CCEffectBloom effectWithPixelBlurRadius:2 intensity:0.8f luminanceThreshold:0.2f];
}

@end
