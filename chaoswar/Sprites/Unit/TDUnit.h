//
//  TDUnit.h
//  chaoswar
//
//  Created by Mac on 11-10-9.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TDSprite.h"

@interface TDUnit : TDSprite {
    // 最大魔法值：MP
    int maxMP;
    // 当前魔法值：MP
    int currentMP;
    // 移动速度：每秒多少像素（如果是子弹则代表移动到某坐标的时间）
	float moveSpeed;
    // 视野范围：像素（半径）
    int searchRange;
    // 攻击力：计算扣血值
    int attact;
    // 攻击模式：影响攻击效果 0 普通攻击 1 魔法攻击
    TAcctactType attactMode;
    // 攻击范围：像素（半径）
    int attactRange;
    // 攻击间隔：多少秒攻击一次
    float attacttime;
    // 攻击力：计算扣血值
    int defence;
    // 攻击模式：影响攻击效果 0 普通攻击 1 魔法攻击
    TDefenceType defenceMode;
    //四个方向的移动动画
    CCAnimation *mvuAni;
    CCAnimation *mvdAni;
    CCAnimation *mvlAni;
    CCAnimation *mvrAni;
    //死亡动画
    CCAnimation *ddAni;
}

@property int maxMP;
@property int currentMP;
@property float moveSpeed;
@property int searchRange;
@property int attact;
@property TAcctactType attactMode;
@property int attactRange;
@property float attacttime;
@property int defence;
@property TDefenceType defenceMode;
@property (nonatomic, assign) CCAnimation *mvuAni;
@property (nonatomic, assign) CCAnimation *mvdAni;
@property (nonatomic, assign) CCAnimation *mvlAni;
@property (nonatomic, assign) CCAnimation *mvrAni;
@property (nonatomic, assign) CCAnimation *ddAni;

- (void) beAttact:(TDSprite*)s an:(int)an at:(TAcctactType)at;

@end
