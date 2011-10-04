//
//  ArrowTower.m
//  chaoswar
//
//  Created by Mac on 11-10-4.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ArrowTower.h"
#import "GameControllerScene.h"


@implementation ArrowTower

- (BOOL) run
{
    [self schedule:@selector(startSearch:)];
    return YES;
}

//搜索敌人
- (void) startSearch:(ccTime)dt {
    enemy = [self searchClearEnemy];
    if (enemy != nil && enemy.isDelete == NO) {
        [self unschedule:@selector(startSearch:)];
        [self schedule:@selector(attact:) interval:self.shoottime];
    }
}

//攻击敌人
- (void) attact:(ccTime)dt {
    if ([self canAttactEnemy] == YES) {
        [self AttactEnemy];
    } else {
        [self unschedule:@selector(attact:)];
        [self schedule:@selector(startSearch:)];
    }
}

- (void) AttactEnemy
{
    
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation ArrowTower1

+ (id) getSprite {
    ArrowTower1 *tower = [ArrowTower1 spriteWithFile:@"ArrowTower1.png"];
    if (tower) {
        tower.isDelete = NO;
        tower.range = 100;
        tower.shoottime = 1.5;
		tower.enemy = nil;
    }
    return tower;
}

- (void) spriteTouchBegan:(UITouch *)touch
{
    
}

- (void) AttactEnemy
{
    GameController *gc = [GameController getGameController];
    Bullet1 *b = [Bullet1 getSprite];
    b.enemy = self.enemy;
    b.position = self.position;
    [gc.gameBackground addChild:b z:12];
    [gc.bulletArray addObject:b];
    [b run];
}

- (void) dealloc
{  
    [super dealloc];
}

@end