//
//  Wave.m
//  chaoswar
//
//  Created by Mac on 11-9-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Wave.h"
#import "GameController.h"
#import "Sprites.h"
#import "WayPoint.h"
#import "GameBackgroundScene.h"
#import "GameImfomationScene.h"
#import "GameMagicScene.h"
#import "GameControllerScene.h"
#import "GameHintScene.h"

@implementation Wave

@synthesize spawnRate;
@synthesize totalEnemy;
@synthesize enemyType;
@synthesize way;

- (id)initWithEnemy:(TEnemyType)enemy SpawnRate:(ccTime)spawnrate TotalEnemys:(int)totalenemys wy:(NSMutableArray*)wy
{
	//NSAssert(enemy!=nil, @"Invalid creep for wave.");
	if( (self = [self init]) )
	{
		enemyType = enemy;
		spawnRate = spawnrate;
		totalEnemy = totalenemys;
        way = wy;
	}
	return self;
}

- (void) start
{
    [[CCScheduler sharedScheduler] scheduleSelector:@selector(runEnemy:) forTarget:self interval:spawnRate paused:NO];
}


- (void) runEnemy:(ccTime)dt {
    if (totalEnemy <= 0) {
        [[CCScheduler sharedScheduler] unscheduleSelector:@selector(runEnemy:) forTarget:self]; 
        return;
    }
    GameController *gc = [GameController getGameController];
    Enemy *enemy;
    switch (self.enemyType) {
        case footEnemy1:
            enemy = [FootEnemy1 getSprite];
            break;
        case footEnemy2:
            enemy = [FootEnemy2 getSprite];
            break; 
        default:
            break;
    }
    
    enemy.nextWayPoint = 1;
    enemy.position = ccp(-1,  -1);
    enemy.way = self.way;
    WayPoint *wayPoint = [enemy.way objectAtIndex:0];
    if (wayPoint) {
        CGPoint position = [wayPoint getPoint];
        enemy.position = ccp(position.x, position.y);
    }
    [gc.gameBackground addChild:enemy z:5];
    [gc.enemyArray addObject:enemy];
    [enemy run];
    totalEnemy--;
}

-(id) init
{
	if( (self=[super init]) ) {
		
	}
	
	return self;
}

@end
