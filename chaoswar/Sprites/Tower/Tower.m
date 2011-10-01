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
@synthesize enemy;
@synthesize bullet;
@synthesize spriteRange;
@synthesize bullets;
@synthesize isdelete;

- (Enemy*) getClosestEnemy {
	Enemy *nextEnemy = nil;
	double maxDistant = 99999;
	GameController *gc = [GameController getGameController];
	
	for (CCSprite *enemy in gc.enemyArray) {	
		Enemy *creep = (Enemy*) enemy;
		double curDistance = ccpDistance(self.position, creep.position);
		if (curDistance < maxDistant) {
			nextEnemy = creep;
			maxDistant = curDistance;
		}
	}
	
	if (maxDistant < self.range)
		return nextEnemy;
	return nil;
}

@end

@implementation EmptyTower

+ (id) tower {
    EmptyTower *tower = [EmptyTower itemFromNormalImage:@"emptyTower.png" selectedImage:@"emptyTower.png" disabledImage:@"emptyTower.png" target:nil selector:@selector(showMenu:)];
    if (tower) {
        tower.isdelete = 0;
        tower.range = 200;
		tower.enemy = nil;
    }
    return tower;
    
}

-(void) showMenu:(id) sender 
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

//搜索敌人
- (void) startSearch:(ccTime)dt {
    enemy = [self getClosestEnemy];
    if (enemy) {
        [self unschedule:@selector(startSearch:)];
        [self schedule:@selector(attact:)];
    }
}

//攻击敌人
- (void) attact:(ccTime)dt {
    
    [self unschedule:@selector(attact:)];
    [self schedule:@selector(startSearch:)];
}

- (void) dealloc
{  
    [super dealloc];
}

@end


@implementation ArrowTower1

+ (id) tower {
    ArrowTower1 *tower = [ArrowTower1 itemFromNormalImage:@"ArrowTower1.png" selectedImage:@"ArrowTower1.png" disabledImage:@"ArrowTower1.png" target:nil selector:@selector(showMenu:)];
    if (tower) {
        tower.isdelete = 0;
        tower.range = 200;
		tower.enemy = nil;
    }
    return tower;
    
}

-(void) showMenu:(id) sender 
{
    NSLog(@"click ArrowTower1 showMenu");
}

- (void) dealloc
{  
    [super dealloc];
}

@end
