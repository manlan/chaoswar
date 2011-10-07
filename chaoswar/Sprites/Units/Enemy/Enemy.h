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
    //生命值：HP
    int maxHP;
    int currentHP;
    //移动速度：每秒多少像素
	float moveSpeed;
    //攻击间隔：多少秒攻击一次
    float attacttime;
    //攻击范围：像素（半径）
    int range;     
    //攻击力：计算扣血值
    int attact;
    //攻击模式：影响攻击效果 0 普通攻击 1 魔法攻击
    int attactMode;
    //防御模式：影响攻击效果 0 无护甲 1 重甲 2 魔法护甲
    int defenceMode;
    
    int nextWayPoint;
    //路线
    NSMutableArray *way;
}

@property (nonatomic, assign) int maxHP;
@property (nonatomic, assign) int currentHP;
@property (nonatomic, assign) float moveSpeed;
@property (nonatomic, assign) float attacttime;
@property (nonatomic, assign) int range;     
@property (nonatomic, assign) int attact;
@property (nonatomic, assign) int attactMode;
@property (nonatomic, assign) int defenceMode;
@property (nonatomic, assign) int nextWayPoint;
@property (nonatomic, assign) NSMutableArray *way;

@end
