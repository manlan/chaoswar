//
//  Enemy.h
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "TDSprite.h"
#import "WayPoint.h"

@interface Enemy : TDSprite {
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
    int attact;
    //
    int defence;
    
    NSMutableArray *way;
}

@property (nonatomic, assign) int maxHP;
@property (nonatomic, assign) int maxMP;
@property (nonatomic, assign) int currentHP;
@property (nonatomic, assign) int currentMP;
@property (nonatomic, assign) int moveSpeed;
@property (nonatomic, assign) NSMutableArray *way;

- (WayPoint*) getCurrentWaypoint;
- (WayPoint*) getNextWaypoint;

@end

@interface EnemyOne : Enemy {
    
}

@end

@interface EnemyTwo : Enemy {
    
}

@end
