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
    //攻击范围：像素（半径）
    int range;
    //攻击间隔：多少秒攻击一次
    float attacttime;
    //攻击的敌人
	Enemy *enemy;
    //背景名称
    NSString *bgName;
    //背景精灵
    CCSprite *bgSprite;
    
    Tower *nextTower;
}

@property (nonatomic, assign) int range;
@property (nonatomic, assign) float attacttime;
@property (nonatomic, assign) Enemy *enemy;
@property (nonatomic, assign) NSString *bgName;
@property (nonatomic, assign) CCSprite *bgSprite; 
@property (nonatomic, assign) Tower *nextTower;

- (Enemy*) searchClearEnemy;
- (BOOL) canAttactEnemy;
- (void) buildTower:(Tower*)tower buildBG:(NSString*)buildBG;
- (void) updateTower:(Tower*)tower;

@end

@interface EmptyTower : Tower {
    
}

@end

@interface EmptyTower1 : EmptyTower {
    
}

@end

@interface EmptyTower2 : EmptyTower {
    
}

@end
