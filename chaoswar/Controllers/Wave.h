//
//  Wave.h
//  chaoswar
//
//  Created by Mac on 11-9-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enemy.h"
#import "Pointer.h"

@interface Wave : NSObject {
    ccTime spawnRate;
	int totalEnemy;
	Enemy * enemyType;
    NSMutableArray *way;
}

@property (nonatomic) ccTime spawnRate;
@property (nonatomic) int totalEnemy;
@property (nonatomic, retain) Enemy * enemyType;
@property (nonatomic, assign) NSMutableArray *way;

- (id)initWithEnemy:(Enemy *)enemy SpawnRate:(ccTime)spawnrate TotalEnemys:(int)totalenemys wy:(NSMutableArray*)wy;

- (void) start;

@end
