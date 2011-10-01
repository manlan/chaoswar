//
//  Enemy.h
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "WayPoint.h"

@interface Enemy : CCSprite {
    //
    int maxHP;
    //
    int maxMP;
    //
    int currentHP;
    //
    int currentMP;
    //
	int moveSpeed;
    //
    int wayNum;
    //
	int wayPoint;
    //
    int attact;
    //
    int defence;
    int isdelete;
}
@property int isdelete;
@property (nonatomic, assign) int maxHP;
@property (nonatomic, assign) int maxMP;
@property (nonatomic, assign) int currentHP;
@property (nonatomic, assign) int currentMP;
@property (nonatomic, assign) int moveSpeed;
@property (nonatomic, assign) int wayNum;
@property (nonatomic, assign) int wayPoint;

+ (id) enemy;
- (BOOL) run;

- (Enemy*) initWithEnemy:(Enemy*) copyFrom; 
- (WayPoint*) getCurrentWaypoint;
- (WayPoint*) getNextWaypoint;

@end

@interface EnemyOne : Enemy {
    
}

@end

@interface EnemyTwo : Enemy {
    
}

@end
