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

// 获取当前精灵的实例
+ (id) getSprite;

// 运行精灵
- (BOOL) run;

// 初始化动画（声音等）
- (void) initAnimate;

// 触摸开始 TOperateType 为当前操作类型
- (void) spriteTouchBegan:(UITouch *)touch operateType:(TOperateType)operateType;

// 触摸移动
- (void) spriteTouchMoved:(UITouch *)touch operateType:(TOperateType)operateType;

// 触摸结束
- (void) spriteTouchEnded:(UITouch *)touch operateType:(TOperateType)operateType;

// 添加一个操作按钮
- (void) addButton:(NSString*)normal selected:(NSString*)selected disabled:(NSString*)disabled sel:(SEL)sel pos:(CGPoint)pos;

// 离开时的操作
- (void) onSpriteExit;

@end
