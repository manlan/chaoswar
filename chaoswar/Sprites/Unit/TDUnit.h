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

}

// 最大魔法值：MP
@property int maxMP;
// 当前魔法值：MP
@property int currentMP;
// 移动速度：每秒多少像素（如果是子弹则代表移动到某坐标的时间）
@property float moveSpeed;
// 视野范围：像素（半径）
@property int searchRange;
// 攻击力：计算扣血值
@property int attact;
// 攻击模式：影响攻击效果 0 普通攻击 1 魔法攻击
@property TAcctactType attactMode;
// 攻击范围：像素（半径）
@property int attactRange;
// 攻击间隔：多少秒攻击一次
@property float attacttime;
// 攻击力：计算扣血值
@property int defence;
// 攻击模式：影响攻击效果 0 普通攻击 1 魔法攻击
@property TDefenceType defenceMode;
//四个方向的移动动画
@property (nonatomic, assign) CCAnimation *mvuAni;
@property (nonatomic, assign) CCAnimation *mvdAni;
@property (nonatomic, assign) CCAnimation *mvlAni;
@property (nonatomic, assign) CCAnimation *mvrAni;
//死亡动画
@property (nonatomic, assign) CCAnimation *ddAni;

- (void) beAttact:(TDSprite*)s an:(int)an at:(TAcctactType)at;

@end
