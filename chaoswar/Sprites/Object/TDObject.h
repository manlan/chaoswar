//
//  TDObject.h
//  chaoswar
//
//  Created by Mac on 11-10-9.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TDSprite.h"

@interface TDObject : TDSprite {
    // 移动时间（秒）
	float moveTime;
    // 攻击力：计算扣血值
    int attact;
    // 攻击模式：影响攻击效果 0 普通攻击 1 魔法攻击
    TAcctactType attactMode;
}

@property float moveTime;
@property int attact;
@property TAcctactType attactMode;

@end
