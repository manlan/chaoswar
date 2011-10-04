//
//  Bullet.h
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "TDSprite.h"

@class GameController;
@class Enemy;
@class Friendly;

@interface Bullet : TDSprite {
    //移动速度：需要移动多少秒
    float flytime;
    //攻击力：计算扣血值
    int attact;
    //攻击模式：影响攻击效果 0 普通攻击 1 魔法攻击
    int attactMode;
}

@property (nonatomic, assign) float flytime;
@property (nonatomic, assign) int attact;
@property (nonatomic, assign) int attactMode;

@end

@interface DefBullet : Bullet {
    //攻击的敌人
	Enemy *enemy;
}

@property (nonatomic, assign) Enemy *enemy;

- (void) move;

@end

@interface EneBullet : Bullet {
    //攻击的敌人
	Friendly *friendly;
}

@property (nonatomic, assign) Friendly *friendly;

- (void) move;

@end
