//
//  Enemy.m
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "TDEnemy.h"
#import "GameController.h"

@implementation TDEnemy

@synthesize nextWayPoint;
@synthesize way;

- (BOOL) run
{
    if ([super run] == NO) return NO;
    [self schedule:@selector(doMove:)];
    return YES;
}

-(id) init
{
	if( (self=[super init])) {
        self.getGold = 100;
	}
	return self;
}

- (void) dealloc
{
	[super dealloc];
}

- (void) doMove:(ccTime)dt {
    [self unschedule:@selector(doMove:)];
    GameController *gc = [GameController getGameController];
    CGPoint position = self.position;
    if (nextWayPoint >= self.way.count) {
        self.isDelete = 1;
        [self stopAllActions];
        gc.currentHealth = gc.currentHealth - 1;
        [self removeFromParentAndCleanup:YES];
    }
    WayPoint *wp = [self.way objectAtIndex:nextWayPoint];
    position = wp.point;
    [self removeFromParentAndCleanup:NO];
    
    [gc.gameBackground addChild:self z:wp.z];
    //动画
    float x_plus = position.x - self.position.x;
    float y_plus = position.y - self.position.y;
    if (abs(x_plus) > abs(y_plus)) {
        //横走
        if (x_plus > 0) {
            [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:self.mvrAni restoreOriginalFrame:NO]]];
        } else {
            [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:self.mvlAni restoreOriginalFrame:NO]]];
        }
    } else {
        //竖走
        if (y_plus > 0) {
            [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:self.mvuAni restoreOriginalFrame:NO]]];
        } else {
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
    nextWayPoint++;
    [self schedule:@selector(doMove:)];
}

@end
