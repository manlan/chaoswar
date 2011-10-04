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

@interface Bullet : TDSprite {
    float flytime; //攻击速度
	Enemy *enemy;  //攻击的敌人
}

@property (nonatomic, assign) float flytime;
@property (nonatomic, assign) Enemy *enemy;

@end


@interface Bullet1 : Bullet {

}

@end
