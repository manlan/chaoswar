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

}

@property ccTime beginRate;
@property ccTime spawnRate;
@property int totalEnemy;
@property TEnemyType enemyType;
@property (nonatomic, assign) NSMutableArray *way;

+ (id)runWave:(float)b e:(TEnemyType)e s:(float)s t:(int)t wy:(NSMutableArray*)wy;

- (void) start;

@end
