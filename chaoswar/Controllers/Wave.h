//
//  Wave.h
//  chaoswar
//
//  Created by Mac on 11-9-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameTypeDef.h"
#import "TDEnemy.h"

@class Pointer;

@interface Wave : NSObject {
    ccTime beginRate;
    ccTime spawnRate;
	int totalEnemy;
	TEnemyType enemyType;
    NSMutableArray *way;
}

@property (nonatomic) ccTime beginRate;
@property (nonatomic) ccTime spawnRate;
@property (nonatomic) int totalEnemy;
@property (nonatomic, assign) TEnemyType enemyType;
@property (nonatomic, assign) NSMutableArray *way;

+ (void)runWave:(float)b e:(TEnemyType)e s:(float)s t:(int)t wy:(NSMutableArray*)wy;

- (void) start;

@end
