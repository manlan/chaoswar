//
//  Pointer1.m
//  chaoswar
//
//  Created by Mac on 11-9-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Pointer1.h"
#import "WayPointManager.h"

@implementation Pointer1

-(void) initEnemy:(NSMutableArray*)array
{
    [array removeAllObjects];
}

-(void) initTower:(NSMutableArray*)array
{
    [array removeAllObjects];
    [self addTower:array tower:[EmptyTower tower] point:ccp(380, 220)];
    [self addTower:array tower:[EmptyTower tower] point:ccp(380, 56)];
    [self addTower:array tower:[EmptyTower tower] point:ccp(140, 220)];
    [self addTower:array tower:[EmptyTower tower] point:ccp(200, 140)];
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
    [manager removeAllWayPoint];
    //[manager addWayPoint:0 wayPoint:nil];
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
