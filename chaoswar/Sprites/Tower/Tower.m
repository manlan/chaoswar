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

@implementation MachineGunTower


+ (id) tower {
    MachineGunTower *tower = [[[MachineGunTower alloc] initWithFile:@"bullet.png"] autorelease];
    if (tower) {
        tower.isdelete = 0;
        tower.range = 200;
		tower.enemy = nil;
    }
    return tower;
    
}

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
