//
//  Pointer.m
//  chaoswar
//
//  Created by Mac on 11-9-30.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Pointer.h"
#import "GameController.h"
#import "WayPointManager.h"
#import "Bullet.h"
#import "Tower.h"
#import "Enemy.h"
#import "Friendly.h"
#import "WayPointManager.h"
#import "WayPoint.h"
#import "Wave.h"
#import "GameBackgroundScene.h"
#import "GameImfomationScene.h"
#import "GameMagicScene.h"
#import "GameControllerScene.h"
#import "GameHintScene.h"

@implementation Pointer

-(void) addTower:(NSMutableArray*)array tower:(Tower*)tower point:(CGPoint)point
{
    GameController *gc = [GameController getGameController];
    tower.position = point;
    [gc.gameBackground addChild:tower z:5];
    [array addObject:tower];
    
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

-(void) initWayPoint:(WayPointManager*)manager
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
