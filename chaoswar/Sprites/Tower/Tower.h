//
//  Tower.h
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Enemy.h"
#import "Bullet.h"
#import "GameController.h"

@interface Tower : CCSprite {
    BOOL isdelete; //是否已经被删除
    int range;    //射程，决定攻击敌人的视野
	Enemy *enemy;  //攻击的敌人
}

@property BOOL isdelete;
@property (nonatomic, assign) int range;
@property (nonatomic, assign) Enemy *enemy;

+ (id) tower;
- (BOOL) run;
- (void) onClick;
- (CGRect)rect;

- (Enemy*) searchClearEnemy;
- (BOOL) canAttactEnemy;

@end

@interface EmptyTower : Tower {
    
}

@end

@interface ArrowTower : Tower {
    
}

- (void) AttactEnemy;

@end

@interface ArrowTower1 : ArrowTower {
    
}

@end
