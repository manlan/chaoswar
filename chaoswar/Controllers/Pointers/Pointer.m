//
//  Pointer.m
//  chaoswar
//
//  Created by Mac on 11-9-30.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Pointer.h"
#import "GameController.h"
#import "TDBullet.h"
#import "TDTower.h"
#import "TDEnemy.h"
#import "TDFriendly.h"
#import "WayPoint.h"
#import "Wave.h"
#import "GameBackgroundScene.h"
#import "GameImfomationScene.h"
#import "GameMagicScene.h"
#import "GameControllerScene.h"
#import "GameHintScene.h"

@implementation Pointer

-(void) initAnimate
{
	
}

-(void) addTower:(NSMutableArray*)array tower:(TDTower*)tower point:(CGPoint)point
{
    GameController *gc = [GameController getGameController];
    tower.position = point;
	tower.anchorPoint = ccp(0, 1);
    [gc.gameBackground addChild:tower z:5];
    [array addObject:tower];
    
}

-(void) addWave:(NSMutableArray*)array enemy:(TEnemyType)enemy SpawnRate:(float)spawnrate TotalEnemys:(int)totalenemys wy:(NSMutableArray*)wy
{
    Wave *wave = [[Wave alloc] initWithEnemy:enemy SpawnRate:spawnrate TotalEnemys:totalenemys wy:wy];
    [array addObject:wave];
}

-(void) initEnemy:(NSMutableArray*)array
{
    [array removeAllObjects];
}

-(void) initTower:(NSMutableArray*)array
{
    [array removeAllObjects];
}

-(void) initWave:(NSMutableArray*)array
{
    [array removeAllObjects];
}

-(void) initBullety:(NSMutableArray*)array
{
    [array removeAllObjects];
}

-(void) initWayPoint:(WayManager*)manager
{
    //
}

-(void) initMagic:(NSMutableArray*)array
{
    [array removeAllObjects];
}

-(void) initFriendly:(NSMutableArray*)array
{
    [array removeAllObjects];
}

@end
