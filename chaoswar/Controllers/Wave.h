//
//  Wave.h
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Enemy.h"

@interface Wave : CCNode {
	float spawnRate;
	int totalEnemy;
	Enemy *enemyType;
}

@property (nonatomic) float spawnRate;
@property (nonatomic) int totalEnemy;
@property (nonatomic, retain) Enemy *enemyType;

- (id) initWithEnemy:(Enemy *)enemy SpawnRate:(float)spawnrate TotalEnemy:(int)totalenemy;

@end
