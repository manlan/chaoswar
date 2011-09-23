//
//  Wave.m
//  chaoswar
//
//  Created by Mac on 11-9-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Wave.h"


@implementation Wave

@synthesize spawnRate;
@synthesize totalEnemy;
@synthesize enemyType;


- (id)initWithEnemy:(Enemy *)enemy SpawnRate:(float)spawnrate TotalEnemys:(int)totalenemys
{
	NSAssert(enemy!=nil, @"Invalid creep for wave.");
    
	if( (self = [self init]) )
	{
		enemyType = enemy;
		spawnRate = spawnrate;
		totalEnemy = totalenemys;
	}
	return self;
}

-(id) init
{
	if( (self=[super init]) ) {
		
	}
	
	return self;
}

@end
