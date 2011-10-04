//
//  Tower.h
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "TDSprite.h"
#import "Enemy.h"
#import "Bullet.h"
#import "GameController.h"

@interface Tower : TDSprite {
    int range;     //射程，决定攻击敌人的视野
    float shoottime; //攻击速度
	Enemy *enemy;  //攻击的敌人
}

@property (nonatomic, assign) int range;
@property (nonatomic, assign) float shoottime;
@property (nonatomic, assign) Enemy *enemy;

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
