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
    // 花费金额
    int costGold;
    // 得到金额
    int getGold;
    // 是否已经被删除
    BOOL isDelete;
    // 最大生命值：HP
    int maxHP;
    // 当前生命值：HP
    int currentHP;
    // 杀敌次数
    int killNum;
}

@property int costGold;
@property int getGold;
@property BOOL isDelete;
@property int maxHP;
@property int currentHP;
@property int killNum;

+ (id) getSprite;

- (BOOL) run;

- (void) initAnimate;

- (void) spriteTouchBegan:(UITouch *)touch operateType:(TOperateType)operateType;

- (void) spriteTouchMoved:(UITouch *)touch operateType:(TOperateType)operateType;

- (void) spriteTouchEnded:(UITouch *)touch operateType:(TOperateType)operateType;

@end
