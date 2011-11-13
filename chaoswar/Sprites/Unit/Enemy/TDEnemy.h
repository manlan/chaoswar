#import <Foundation/Foundation.h>
#import "GamePubDef.h"
#import "WayPoint.h"
#import "TDUnit.h"
#import "TDMagicBullet.h"

@class TDFriendly;

@interface TDEnemy : TDUnit {

}

@property int nextWayPoint;

@property TEnemyStatus enemyStatus;

@property TEnemyMagicStatus enemyMagicStatus;

//路线集合
@property (nonatomic, assign) NSMutableArray *way;
//攻击的友军
@property (nonatomic, assign) TDFriendly *friendly;
//自身发射的子弹集合
@property (nonatomic, assign) NSMutableArray *shootBulletArray;
//塔攻击的子弹集合
@property (nonatomic, assign) NSMutableArray *towerBulletArray;
//友军发射的子弹集合
@property (nonatomic, assign) NSMutableArray *friendlyBulletArray;
//魔法发射的子弹集合
@property (nonatomic, assign) NSMutableArray *magicBulletArray;
//塔攻击的集合
@property (nonatomic, assign) NSMutableArray *towerArray;
//友军攻击的集合
@property (nonatomic, assign) NSMutableArray *friendlyArray;
//四个方向的移动动画
@property (nonatomic, assign) CCAnimation *mvuAni;
@property (nonatomic, assign) CCAnimation *mvdAni;
@property (nonatomic, assign) CCAnimation *mvlAni;
@property (nonatomic, assign) CCAnimation *mvrAni;
@property (nonatomic, assign) CCAnimation *atAni;

- (CGPoint) getPositionAfterTime:(ccTime)dt;

- (void) doMagicThunder;

- (void) doMagicStop;

- (void) doubleAttact:(TDFriendly*)s;

- (TDFriendly*) canAttactFriendly;

- (void) doRunning;

- (void) doWaiting;

- (void) doAttact;

- (void) doMagicStopStatus;

- (void) doMagicSpeedStatus;

- (void) doMagicLifeStatus;

@end
