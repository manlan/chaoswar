//
//  Pointer.h
//  chaoswar
//
//  Created by Mac on 11-9-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Pointer <NSObject>

-(void) initEnemy:(NSMutableArray*)array;

-(void) initTower:(NSMutableArray*)array;

-(void) initWave:(NSMutableArray*)array;

-(void) initBullety:(NSMutableArray*)array;

-(void) initWayPoint:(NSMutableArray*)array;

-(void) initMagic:(NSMutableArray*)array;

-(void) initFriendly:(NSMutableArray*)array;

@end