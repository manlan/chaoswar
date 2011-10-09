//
//  Pointer.h
//  chaoswar
//
//  Created by Mac on 11-9-30.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GamePubDef.h"
#import "Wave.h"

@class WayManager;
@class Bullet;
@class Tower;
@class Enemy;
@class Friendly;
@class WayPoint;

@interface Pointer : NSObject {
    
}

-(void) addTower:(NSMutableArray*)array tower:(Tower*)tower point:(CGPoint)point;

-(void) addWave:(NSMutableArray*)array enemy:(TEnemyType)enemy SpawnRate:(float)spawnrate TotalEnemys:(int)totalenemys wy:(NSMutableArray*)wy;

-(void) initAnimate;

-(void) initEnemy:(NSMutableArray*)array;

-(void) initTower:(NSMutableArray*)array;

-(void) initWave:(NSMutableArray*)array;

-(void) initBullety:(NSMutableArray*)array;

-(void) initWayPoint:(WayManager*)manager;

-(void) initMagic:(NSMutableArray*)array;

-(void) initFriendly:(NSMutableArray*)array;

@end
