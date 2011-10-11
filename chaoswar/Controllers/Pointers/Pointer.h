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
@class TDBullet;
@class TDTower;
@class TDEnemy;
@class TDFriendly;
@class WayPoint;

@interface Pointer : NSObject {
    
}

-(void) addTower:(NSMutableArray*)a t:(TDTower*)t p:(CGPoint)p;

-(void) runWave:(float)b e:(TEnemyType)e s:(float)s t:(int)t wy:(NSMutableArray*)wy;

-(void) initController;

-(void) initAnimate;

-(void) initEnemy:(NSMutableArray*)array;

-(void) initTower:(NSMutableArray*)array;

-(BOOL) runWaves:(int)wave;

-(void) initBullety:(NSMutableArray*)array;

-(void) initWayPoint:(WayManager*)manager;

-(void) initMagic:(NSMutableArray*)array;

-(void) initFriendly:(NSMutableArray*)array;

@end
