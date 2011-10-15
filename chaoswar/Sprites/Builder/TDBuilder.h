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

}

//魔法最大值
@property int maxMP;
//当前魔法值
@property int currentMP;
//攻击间隔
@property float attacttime;
//攻击距离
@property int attactRange;
//攻击力
@property int attact;
//攻击模式
@property TAcctactType attactMode;
//底部坐标
@property CGPoint bottomPoint;

@end
