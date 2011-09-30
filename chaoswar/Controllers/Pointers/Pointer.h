//
//  Pointer.h
//  chaoswar
//
//  Created by Mac on 11-9-30.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WayPointManager.h"

@interface Pointer : NSObject {
    
}


-(void) initEnemy:(NSMutableArray*)array;

-(void) initTower:(NSMutableArray*)array;

-(void) initWave:(NSMutableArray*)array;

-(void) initBullety:(NSMutableArray*)array;

-(void) initWayPoint:(WayPointManager*)manager;

-(void) initMagic:(NSMutableArray*)array;

-(void) initFriendly:(NSMutableArray*)array;

@end
