//
//  Tower.m
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Tower.h"


@implementation Tower

@synthesize range;
@synthesize isdelete;
@synthesize enemy;

+ (id) tower
{
    return nil;
}

- (BOOL) run
{
    return YES;
}

-(void) onClick
{
    NSLog(@"click EmptyTower showMenu");
}

- (CGRect)rect
{
    CGSize s = [self.texture contentSize];
    CGRect r = CGRectMake(-s.width / 2, -s.height / 2, s.width, s.height);
    return r;
}

- (Enemy*) searchClearEnemy {
	Enemy *nextEnemy = nil;
	double maxDistant = 99999;
	GameController *gc = [GameController getGameController];
	for (Enemy *e in gc.enemyArray) {	
		double curDistance = ccpDistance(self.position, e.position);
		if (curDistance < maxDistant) {
			nextEnemy = e;
			maxDistant = curDistance;
		}
	}
	
	if (maxDistant < self.range)
		return nextEnemy;
	return nil;
}

- (BOOL) canAttactEnemy
{
    if (enemy == nil) {
        return NO;
    }
    
    if (enemy.isdelete == YES) {
        return NO;
    }
    
    double distance = ccpDistance(self.position, self.enemy.position);
    
    if (distance <= self.range) {
        return YES;
    }
	return NO;
}

@end

@implementation EmptyTower

+ (id) tower {
    EmptyTower *tower = [EmptyTower spriteWithFile:@"emptyTower.png"];
    if (tower) {
        tower.isdelete = NO;
        tower.range = 0;
		tower.enemy = nil;
    }
    return tower;
}

-(void) onClick
{
    NSLog(@"click EmptyTower showMenu");
}

- (BOOL) run
{
    return YES;
}

- (void) dealloc
{  
    [super dealloc];
}

@end


@implementation ArrowTower

- (BOOL) run
{
    [self schedule:@selector(startSearch:)];
    return YES;
}

-(void) onClick
{
    NSLog(@"click EmptyTower showMenu");
}

//搜索敌人
- (void) startSearch:(ccTime)dt {
    enemy = [self searchClearEnemy];
    if (enemy != nil && enemy.isdelete == NO) {
        [self unschedule:@selector(startSearch:)];
        [self schedule:@selector(attact:)];
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

+ (id) tower {
    ArrowTower1 *tower =  [ArrowTower1 spriteWithFile:@"ArrowTower1.png"];
    if (tower) {
        tower.isdelete = NO;
        tower.range = 100;
		tower.enemy = nil;
    }
    return tower;
    
}

-(void) showMenu:(id) sender 
{
    NSLog(@"click ArrowTower1 showMenu");
}

- (void) AttactEnemy
{
    
}

- (void) dealloc
{  
    [super dealloc];
}

@end
