//
//  Pointer.h
//  chaoswar
//
//  Created by Mac on 11-9-30.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class WayPointManager;
@class Bullet;
@class Tower;
@class Enemy;
@class Friendly;
@class WayPointManager;
@class WayPoint;
@class Wave;

@interface Pointer : NSObject {
    
}

-(void) addTower:(NSMutableArray*)array tower:(Tower*)tower point:(CGPoint)point;

-(void) initEnemy:(NSMutableArray*)array;

-(void) initTower:(NSMutableArray*)array;

-(void) initWave:(NSMutableArray*)array;

-(void) initBullety:(NSMutableArray*)array;

-(void) initWayPoint:(WayPointManager*)manager;

-(void) initMagic:(NSMutableArray*)array;

-(void) initFriendly:(NSMutableArray*)array;

@end
