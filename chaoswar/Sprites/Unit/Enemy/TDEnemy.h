#import <Foundation/Foundation.h>
#import "GamePubDef.h"
#import "WayPoint.h"
#import "TDUnit.h"

@class TDFriendly;

@interface TDEnemy : TDUnit {

}

@property int nextWayPoint;

@property TEnemyStatus enemyStatus;
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

- (CGPoint) getPositionAfterTime:(ccTime)dt;

- (void) doMagicThunder;

- (void) doMagicStop;

- (void) doubleAttact:(TDFriendly*)s;

@end
