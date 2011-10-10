//
//  TDBuilder.h
//  chaoswar
//
//  Created by Mac on 11-10-9.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TDSprite.h"

@interface TDBuilder : TDSprite {
    // 最大魔法值：MP
    int maxMP;
    // 当前魔法值：MP
    int currentMP;
    // 攻击力：计算扣血值
    int attact;
    // 攻击模式：影响攻击效果 0 普通攻击 1 魔法攻击
    TAcctactType attactMode;
    // 攻击间隔：多少秒攻击一次
    float attacttime;
    // 攻击范围：像素（半径）
    int attactRange;
    
    CGPoint bottomPoint;
}

@property int maxMP;
@property int currentMP;
@property float attacttime;
@property int attactRange;
@property int attact;
@property TAcctactType attactMode;
@property CGPoint bottomPoint;

@end
