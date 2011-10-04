//
//  Pointer1.m
//  chaoswar
//
//  Created by Mac on 11-9-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Pointer1.h"

@implementation Pointer1

-(void) initEnemy:(NSMutableArray*)array
{
    [array removeAllObjects];
}

-(void) initTower:(NSMutableArray*)array
{
    [array removeAllObjects];
    [self addTower:array tower:[EmptyTower1 getSprite] point:ccp(320, 160)];
    [self addTower:array tower:[EmptyTower1 getSprite] point:ccp(240, 160)];
    [self addTower:array tower:[EmptyTower1 getSprite] point:ccp(140, 166)];
}

-(void) initWave:(NSMutableArray*)array
{
    [array removeAllObjects];
    GameController *gc = [GameController getGameController];
    [self addWave:array enemy:footEnemy1 SpawnRate:1 TotalEnemys:10 wy:[gc.wayManager getWay:1]];
    [self addWave:array enemy:footEnemy2 SpawnRate:1.2 TotalEnemys:5 wy:[gc.wayManager getWay:1]];
}

-(void) initBullety:(NSMutableArray*)array
{
    [array removeAllObjects];
}

-(void) initWayPoint:(WayManager*)manager
{
    [manager removeAllWay];
    [manager addWayPoint:1 wayPoint:ccp(228, -5)];
    [manager addWayPoint:1 wayPoint:ccp(228, 0)];
    [manager addWayPoint:1 wayPoint:ccp(228, 90)];
    [manager addWayPoint:1 wayPoint:ccp(383, 90)];
    [manager addWayPoint:1 wayPoint:ccp(383, 220)];
    [manager addWayPoint:1 wayPoint:ccp(128, 220)];
    [manager addWayPoint:1 wayPoint:ccp(128, 320)];
    [manager addWayPoint:1 wayPoint:ccp(128, 325)];
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
