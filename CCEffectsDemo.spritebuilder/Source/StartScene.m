//
//  StartScene.m
//  CCEffectsDemo
//
//  Created by Benjamin Encz on 30/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "StartScene.h"

@implementation StartScene

- (void)pixelateDemo {
    CCScene *pixelDemo = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector] pushScene:pixelDemo];
}

- (void)glassDemo {
    CCScene *glasScene = [CCBReader loadAsScene:@"GlasScene"];
    [[CCDirector sharedDirector] pushScene:glasScene];
}

@end
