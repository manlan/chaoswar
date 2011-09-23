//
//  Wave.m
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Wave.h"


@implementation Wave

@synthesize spawnRate;
@synthesize totalEnemy;
@synthesize enemyType;

-(id) init
{
	if( (self=[super init]) ) {
		
	}
	
	return self;
}

- (id) initWithEnemy:(Enemy *)enemy SpawnRate:(float)spawnrate TotalEnemy:(int)totalenemy;
{
	NSAssert(enemy!=nil, @"Invalid creep for wave.");
	if( (self = [self init]) )
	{
		enemyType = enemy;
		spawnRate = spawnrate;
		totalEnemy = totalenemy;
	}
	return self;
}


@end
