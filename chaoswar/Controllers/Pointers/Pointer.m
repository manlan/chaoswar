//
//  Pointer.m
//  chaoswar
//
//  Created by Mac on 11-9-30.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Pointer.h"


@implementation Pointer

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
