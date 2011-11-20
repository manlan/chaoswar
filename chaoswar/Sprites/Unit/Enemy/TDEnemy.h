#import <Foundation/Foundation.h>
#import "GamePubDef.h"
#import "WayPoint.h"
#import "TDUnit.h"
#import "TDMagicBullet.h"

@class TDFriendly;

@interface TDEnemy : TDUnit {

}

@property int nextWayPoint;

//路线集合
@property (nonatomic, assign) NSMutableArray *way;
//攻击的友军
@property (nonatomic, readonly) TDFriendly *friendly;
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

+ (void) regFriendly:(TDFriendly*)f;

+ (void) unregFriendly:(TDFriendly*)f;

- (void) addFriendly:(TDFriendly*)f;

- (void) delFriendly:(TDFriendly*)f;

- (CGPoint) getPositionAfterTime:(ccTime)dt;

- (void) doMagicThunder;

- (void) doMagicStop;

- (void) doRunning;

- (void) doWaiting;

- (void) doAttact;

- (void) doubleAttact:(TDFriendly*)s;

- (TDFriendly*) canAttactFriendly;

- (void) doAttact:(ccTime)dt;

@end
