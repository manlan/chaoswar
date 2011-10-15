//
//  Enemy.m
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TDEnemy.h"
#import "GameController.h"
#import "TDFriendly.h"
#import "TDBullet.h"
#import "TDTower.h"

@implementation TDEnemy

@synthesize nextWayPoint = _nextWayPoint;
@synthesize way = _way;
@synthesize friendly = _friendly;
@synthesize selfBulletArray = _selfBulletArray;
@synthesize towerBulletArray = _towerBulletArray;
@synthesize friendlyBulletArray = _friendlyBulletArray;
@synthesize magicBulletArray = _magicBulletArray;
@synthesize towerArray = _towerArray;
@synthesize friendlyArray = _friendlyArray;

- (BOOL) run
{
    if ([super run] == NO) return NO;
    [self schedule:@selector(doMove:)];
    return YES;
}

-(id) init
{
	if( (self=[super init])) {
        _selfBulletArray = [[NSMutableArray alloc] init];
        _towerBulletArray = [[NSMutableArray alloc] init];
        _friendlyBulletArray = [[NSMutableArray alloc] init];
        _magicBulletArray = [[NSMutableArray alloc] init];
        _towerArray = [[NSMutableArray alloc] init];
        _friendlyArray = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void) dealloc
{
    //===============need mod=================
    [_selfBulletArray removeAllObjects];
    [_towerBulletArray removeAllObjects];
    [_friendlyBulletArray removeAllObjects];
    [_magicBulletArray removeAllObjects];
    [_towerArray removeAllObjects];
    [_friendlyArray removeAllObjects];
    //===============need mod=================
    [_selfBulletArray removeAllObjects];
    [_towerBulletArray removeAllObjects];
    [_friendlyBulletArray removeAllObjects];
    [_magicBulletArray removeAllObjects];
    [_towerArray removeAllObjects];
    [_friendlyArray removeAllObjects];
    [_way release];
    [_friendly release];
    [_selfBulletArray release];
    [_towerBulletArray release];
    [_friendlyBulletArray release];
    [_magicBulletArray release];
    [_towerArray release];
    [_friendlyArray release];
	[super dealloc];
}

- (void) doMove:(ccTime)dt {
    [self unschedule:@selector(doMove:)];
    [self setFlipX:NO];
    GameController *gc = [GameController getGameController];
    CGPoint position = self.position;
    if (_nextWayPoint >= self.way.count) {
        self.spriteStatus = TSS_DEAD;
        [self stopAllActions];
        gc.currentHealth = gc.currentHealth - 1;
        [self removeFromParentAndCleanup:YES];
    }
    WayPoint *wp = [self.way objectAtIndex:_nextWayPoint];
    position = wp.point;
    [self removeFromParentAndCleanup:NO];
    
    [gc.gameBackground addChild:self z:wp.z];
    //动画
    float x_plus = position.x - self.position.x;
    float y_plus = position.y - self.position.y;
    if (abs(x_plus) > abs(y_plus)) {
        //横走
        if (x_plus > 0) {
            //右
            [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:self.mvrAni restoreOriginalFrame:NO]]];
        } else {
             //左
            [self setFlipX:YES];
            [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:self.mvlAni restoreOriginalFrame:NO]]];
        }
    } else {
        //竖走
        if (y_plus > 0) {
            //上
            [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:self.mvuAni restoreOriginalFrame:NO]]];
        } else {
            //下
            [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:self.mvdAni restoreOriginalFrame:NO]]];
        }
    }
    //移动
    double curDistance = ccpDistance(self.position, position);
    ccTime speed = curDistance / self.moveSpeed;
    id actionMove = [CCMoveTo actionWithDuration:speed position:position];
	id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(afterMove:)];
	[self runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

- (CGPoint) getPositionAfterTime:(ccTime)dt
{
    return ccp(0, 0);
}

-(void) afterMove:(id)sender {
    _nextWayPoint++;
    [self schedule:@selector(doMove:)];
}

@end
