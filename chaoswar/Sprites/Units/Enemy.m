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
@synthesize maxMP;
@synthesize currentHP;
@synthesize currentMP;
@synthesize moveSpeed;
@synthesize wayNum;
@synthesize wayPoint;
@synthesize isdelete;

- (id) copyWithZone:(NSZone *)zone {
	Enemy *copy = [[[self class] allocWithZone:zone] initWithEnemy:self];
	return copy;
}

- (Enemy*) initWithEnemy:(Enemy*) copyFrom;  {
    if ((self = [[self initWithFile:@"Enemy1.png"] autorelease])) {

	}
	[self retain];
	return self;
}

- (WayPoint*) getCurrentWaypoint{
	GameController *gc = [GameController getGameController];
	WayPoint *waypoint = (WayPoint*) [gc.waypointArray objectAtIndex:self.wayPoint];
	return waypoint;
}

- (WayPoint*) getNextWaypoint{
	GameController *gc = [GameController getGameController];
	WayPoint *waypoint = (WayPoint*) [gc.waypointArray objectAtIndex:(self.wayPoint + 1)];
	return waypoint;
}

-(void) enemyLogic:(ccTime)dt {
	WayPoint *waypoint = [self getCurrentWaypoint ];
	CGPoint waypointVector = ccpSub(waypoint.position, self.position);
	CGFloat waypointAngle = ccpToAngle(waypointVector);
	CGFloat cocosAngle = CC_RADIANS_TO_DEGREES(-1 * waypointAngle);
	float rotateSpeed = 0.5 / M_PI; // 1/2 second to roate 180 degrees
	float rotateDuration = fabs(waypointAngle * rotateSpeed);    
	[self runAction:[CCSequence actions:
					 [CCRotateTo actionWithDuration:rotateDuration angle:cocosAngle],
					 nil]];		
}

@end

@implementation EnemyOne

+ (id) enemy {
    EnemyOne *enemy = [EnemyOne alloc];
    if ((enemy = [[enemy initWithFile:@"Enemy1.png"] autorelease])) {
//        enemy.hp = 10;
//        enemy.moveDuration = 4;
//		enemy.curWaypoint = 0;
    }
    return enemy;
}

- (BOOL) run
{
    [self schedule:@selector(startMove:)];
    return YES;
}

- (void) startMove:(ccTime)dt {
    [self unschedule:@selector(startMove:)];
    [self schedule:@selector(move:)];
}

- (void) move:(ccTime)dt {
    //遇敌
    if (1 == 1) {
        [self unschedule:@selector(move:)];
        [self schedule:@selector(startAttact:)];
        return;
    }
    
    return;
}

- (void) startAttact:(ccTime)dt {
    [self unschedule:@selector(startAttact:)];
    [self schedule:@selector(attact:)];
}


- (void) attact:(ccTime)dt {
    //攻击敌人完毕
    if (1 == 1) {
        [self unschedule:@selector(attact:)];
        [self schedule:@selector(startMove:)];
        return;
    }
    
    return;
}

- (void) dealloc
{  
    [super dealloc];
}


@end

@implementation EnemyTwo

+ (id) enemy {
    EnemyOne *enemy = [EnemyOne alloc];
    if ((enemy = [[enemy initWithFile:@"Enemy2.png"] autorelease])) {
        //        enemy.hp = 10;
        //        enemy.moveDuration = 4;
        //		enemy.curWaypoint = 0;
    }
	[enemy schedule:@selector(enemyLogic:) interval:0.2];
    return enemy;
}

- (BOOL) run
{
    [self schedule:@selector(startMove:)];
    return YES;
}

- (void) startMove:(ccTime)dt {
    [self unschedule:@selector(startMove:)];
    [self schedule:@selector(move:)];
}

- (void) move:(ccTime)dt {
    //遇敌
    if (1 == 1) {
        [self unschedule:@selector(move:)];
        [self schedule:@selector(startAttact:)];
        return;
    }
    
    return;
}

- (void) startAttact:(ccTime)dt {
    [self unschedule:@selector(startAttact:)];
    [self schedule:@selector(attact:)];
}


- (void) attact:(ccTime)dt {
    //攻击敌人完毕
    if (1 == 1) {
        [self unschedule:@selector(attact:)];
        [self schedule:@selector(startMove:)];
        return;
    }
    
    return;
}

- (void) dealloc
{  
    [super dealloc];
}


@end