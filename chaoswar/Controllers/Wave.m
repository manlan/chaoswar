//
//  Wave.m
//  chaoswar
//
//  Created by Mac on 11-9-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Wave.h"
#import "GameController.h"
#import "SpritesImp.h"
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
    TDEnemy *enemy;
    switch (self.enemyType) {
        case ET_FOOT1:
            enemy = [TDFootEnemy1 getSprite];
            break;
        case ET_FOOT2:
            enemy = [TDFootEnemy2 getSprite];
            break;
        case ET_FOOT3:
            enemy = [TDFootEnemy3 getSprite];
            break; 
        case ET_FOOT4:
            enemy = [TDFootEnemy4 getSprite];
            break; 
        case ET_FOOT5:
            enemy = [TDFootEnemy5 getSprite];
            break; 
        case ET_FOOT6:
            enemy = [TDFootEnemy6 getSprite];
            break; 
        case ET_FOOT7:
            enemy = [TDFootEnemy7 getSprite];
            break; 
        case ET_FOOT8:
            enemy = [TDFootEnemy8 getSprite];
            break; 
        case ET_FOOT9:
            enemy = [TDFootEnemy9 getSprite];
            break; 
        case ET_FOOT10:
            enemy = [TDFootEnemy10 getSprite];
            break; 
        case ET_FOOT11:
            enemy = [TDFootEnemy11 getSprite];
            break; 
        case ET_FOOT12:
            enemy = [TDFootEnemy12 getSprite];
            break; 
        case ET_FOOT13:
            enemy = [TDFootEnemy13 getSprite];
            break; 
        case ET_FOOT14:
            enemy = [TDFootEnemy14 getSprite];
            break; 
        case ET_FOOT15:
            enemy = [TDFootEnemy15 getSprite];
            break; 
        case ET_FOOT16:
            enemy = [TDFootEnemy16 getSprite];
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
