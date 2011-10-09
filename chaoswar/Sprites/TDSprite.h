//
//  TDSprite.h
//  chaoswar
//
//  Created by Mac on 11-10-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GamePubDef.h"

@interface TDSprite : CCSprite <CCTargetedTouchDelegate>{
    //生命值：HP
    int maxHP;
    int currentHP;
    //魔法值：MP
    int maxMP;
    int currentMP;
    //移动速度：每秒多少像素（如果是子弹则代表移动到某坐标的时间）
	float moveSpeed;
    //攻击间隔：多少秒攻击一次
    float attacttime;
    //攻击范围：像素（半径）
    int range;
    //攻击力：计算扣血值
    int attact;
    //攻击模式：影响攻击效果 0 普通攻击 1 魔法攻击
    TAcctactType attactMode;
    //攻击力：计算扣血值
    int defence;
    //攻击模式：影响攻击效果 0 普通攻击 1 魔法攻击
    TDefenceType defenceMode;
    //是否已经被删除
    BOOL isDelete;
    int killNum;
    int goldNum;
}

@property int maxHP;
@property int currentHP;
@property int maxMP;
@property int currentMP;
@property float moveSpeed;
@property float attacttime;
@property int range;
@property int attact;
@property TAcctactType attactMode;
@property int defence;
@property TDefenceType defenceMode;
@property BOOL isDelete;
@property int killNum;
@property int goldNum;

+ (id) getSprite;

- (BOOL) run;

- (void) initAnimate;

- (void) spriteTouchBegan:(UITouch *)touch operateType:(TOperateType)operateType;

- (void) spriteTouchMoved:(UITouch *)touch operateType:(TOperateType)operateType;

- (void) spriteTouchEnded:(UITouch *)touch operateType:(TOperateType)operateType;

@end
