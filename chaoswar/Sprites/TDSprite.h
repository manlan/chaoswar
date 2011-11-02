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
@property (nonatomic, assign) CCSprite *bloodShowSprite;
// 血条
@property (nonatomic, assign) CCSprite *bloodBackSprite;
// 选中框
@property (nonatomic, assign) CCSprite *arrowSprite;
// 魔法效果
@property (nonatomic, assign) CCSprite *effectSprite;

// 获取当前精灵的实例
+ (id) getSprite;

// 运行精灵
- (BOOL) run;

// 停止精灵
- (BOOL) stop;

// 初始化动画（声音等）
- (void) initAnimate;

// 选中时
- (void) doSelect;

// 离开时
- (void) doUnSelect;

// 正常状态
- (void) statusToNormal;

// 正在死亡
- (void) statusToDeading;

// 已经死亡
- (void) statusToDead;

// 正在死亡 或 已经死亡 时需要做的事，主要释放关联关系的
- (void) clearSpriteData;

// 触摸开始 TOperateType 为当前操作类型
- (void) spriteTouchBegan:(UITouch *)touch operateType:(TOperateType)operateType;

// 触摸移动
- (void) spriteTouchMoved:(UITouch *)touch operateType:(TOperateType)operateType;

// 触摸结束
- (void) spriteTouchEnded:(UITouch *)touch operateType:(TOperateType)operateType;

// 添加一个操作按钮
- (CCMenuItemImage*) addButton:(NSString*)normal selected:(NSString*)selected disabled:(NSString*)disabled sel:(SEL)sel pos:(CGPoint)pos;

@end
