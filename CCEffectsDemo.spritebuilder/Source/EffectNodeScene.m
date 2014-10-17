//
//  EffectNodeScene.m
//  CCEffectsDemo
//
//  Created by Benjamin Encz on 25/09/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "EffectNodeScene.h"

@implementation EffectNodeScene

- (id)init {
    self = [super init];
    
    if (self) {
        CCButton *backButton = [CCButton buttonWithTitle:@"Back"];
        backButton.positionType = CCPositionTypeMake(20, 20, CCPositionReferenceCornerTopLeft);
        backButton.anchorPoint = ccp(0, 1);
        backButton.zOrder = 1;
        [backButton setBlock:^(id sender) {
            [[CCDirector sharedDirector] popScene];
        }];
        
        [self addChild:backButton];
    }
    
    return self;
}

- (void)didLoadFromCCB {
    CCEffectBlur *blurEffect = [CCEffectBlur effectWithBlurRadius:2.f];
    
    self.effect = blurEffect;
}

@end
