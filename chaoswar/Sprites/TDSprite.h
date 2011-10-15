//
//  TDSprite.h
//  chaoswar
//
//  Created by Mac on 11-10-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GamePubDef.h"

@class GameController;

@interface TDSprite : CCSprite <CCTargetedTouchDelegate>{

}

// 花费金额
@property int costGold;
// 得到金额
@property int getGold;
// 是否已经被删除
@property TSpriteStatus spriteStatus;
// 最大生命值：HP
@property int maxHP;
// 当前生命值：HP
@property (readwrite) int currentHP;
// 杀敌次数
@property int killNum;
// 是否已经被删除
@property BOOL showBlood;
// 是否已经被删除
@property BOOL canClick;
// 血条
@property (nonatomic, readonly) CCSprite *bloodShowSprite;
// 血条
@property (nonatomic, readonly) CCSprite *bloodBackSprite;
// 选中框
@property (nonatomic, readonly) CCSprite *arrowSprite;


// 获取当前精灵的实例
+ (id) getSprite;

// 运行精灵
- (BOOL) run;

// 初始化动画（声音等）
- (void) initAnimate;

// 选中时
- (void) doSelect;

// 离开时
- (void) doUnSelect;

// 触摸开始 TOperateType 为当前操作类型
- (void) spriteTouchBegan:(UITouch *)touch operateType:(TOperateType)operateType;

// 触摸移动
- (void) spriteTouchMoved:(UITouch *)touch operateType:(TOperateType)operateType;

// 触摸结束
- (void) spriteTouchEnded:(UITouch *)touch operateType:(TOperateType)operateType;

// 添加一个操作按钮
- (CCMenuItemImage*) addButton:(NSString*)normal selected:(NSString*)selected disabled:(NSString*)disabled sel:(SEL)sel pos:(CGPoint)pos;

@end
