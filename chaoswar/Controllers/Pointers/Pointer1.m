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
    [self addTower:array tower:[EmptyTower getSprite] point:ccp(380, 220)];
    [self addTower:array tower:[EmptyTower getSprite] point:ccp(380, 56)];
    [self addTower:array tower:[EmptyTower getSprite] point:ccp(140, 220)];
    [self addTower:array tower:[EmptyTower getSprite] point:ccp(200, 140)];
}

-(void) initWave:(NSMutableArray*)array
{
    [array removeAllObjects];
    GameController *gc = [GameController getGameController];
    [self addWave:array enemy:[EnemyOne getSprite] SpawnRate:1 TotalEnemys:10 wy:[gc.wayManager getWay:1]];
}

-(void) initBullety:(NSMutableArray*)array
{
    [array removeAllObjects];
}

-(void) initWayPoint:(WayManager*)manager
{
    [manager removeAllWay];
    [manager addWayPoint:1 wayPoint:ccp(433, 0)];
    [manager addWayPoint:1 wayPoint:ccp(433, 33)];
    [manager addWayPoint:1 wayPoint:ccp(428, 271)];
    [manager addWayPoint:1 wayPoint:ccp(73, 270)];
    [manager addWayPoint:1 wayPoint:ccp(70, 123)];
    [manager addWayPoint:1 wayPoint:ccp(116, 79)];
    [manager addWayPoint:1 wayPoint:ccp(294, 75)];
    [manager addWayPoint:1 wayPoint:ccp(296, 10)];
    [manager addWayPoint:1 wayPoint:ccp(296, 0)];
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
