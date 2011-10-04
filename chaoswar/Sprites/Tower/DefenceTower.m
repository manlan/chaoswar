//
//  DefenceTower.m
//  chaoswar
//
//  Created by Mac on 11-10-4.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DefenceTower.h"
#import "GameControllerScene.h"

@implementation DefenceTower

- (BOOL) run
{
    return YES;
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation DefenceTower1

+ (id) getSprite {
    DefenceTower *tower = [DefenceTower spriteWithFile:@"ArrowTower1.png"];
    if (tower) {
        tower.isDelete = NO;
        tower.range = 100;
        tower.attacttime = 0.5;
		tower.enemy = nil;
    }
    return tower;
}

- (void) spriteTouchBegan:(UITouch *)touch
{
    
}

- (void) dealloc
{  
    [super dealloc];
}

@end