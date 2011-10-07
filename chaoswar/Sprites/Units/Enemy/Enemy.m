//
//  Enemy.m
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Enemy.h"
#import "GameController.h"

@implementation Enemy

@synthesize maxHP;
@synthesize currentHP;
@synthesize moveSpeed;
@synthesize attacttime;
@synthesize range;     
@synthesize attact;
@synthesize attactMode;
@synthesize defenceMode;
@synthesize nextWayPoint;
@synthesize way;

- (BOOL) run
{
    [self schedule:@selector(doMove:)];
    return YES;
}

- (void) doMove:(ccTime)dt {
    [self unschedule:@selector(doMove:)];
    CGPoint position;
    if (nextWayPoint >= -1 && nextWayPoint < self.way.count) {
        position = self.position;
    }
    WayPoint *wp = [self.way objectAtIndex:nextWayPoint];
    position = [wp getPoint];
    double curDistance = ccpDistance(self.position, position);
    ccTime speed = curDistance / self.moveSpeed;
    id actionMove = [CCMoveTo actionWithDuration:speed position:position];
	id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(afterMove:)];
	[self runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

-(void) afterMove:(id)sender {
    nextWayPoint++;
    [self schedule:@selector(doMove:)];
}

-(void) enemyLogic:(ccTime)dt {
//	WayPoint *waypoint = [self getCurrentWaypoint];
//	CGPoint waypointVector = ccpSub(waypoint.position, self.position);
//	CGFloat waypointAngle = ccpToAngle(waypointVector);
//	CGFloat cocosAngle = CC_RADIANS_TO_DEGREES(-1 * waypointAngle);
//	float rotateSpeed = 0.5 / M_PI; // 1/2 second to roate 180 degrees
//	float rotateDuration = fabs(waypointAngle * rotateSpeed);    
//	[self runAction:[CCSequence actions:
//					 [CCRotateTo actionWithDuration:rotateDuration angle:cocosAngle],
//					 nil]];		
}

@end
