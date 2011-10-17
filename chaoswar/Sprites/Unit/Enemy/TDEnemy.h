#import <Foundation/Foundation.h>
#import "GamePubDef.h"
#import "WayPoint.h"
#import "TDUnit.h"

@class TDFriendly;

@interface TDEnemy : TDUnit {

}

@property int nextWayPoint;
//路线集合
@property (nonatomic, retain) NSMutableArray *way;
//自身发射的子弹集合
@property (nonatomic, retain) TDFriendly *friendly;
//自身发射的子弹集合
@property (nonatomic, retain) NSMutableArray *selfBulletArray;
//塔攻击的子弹集合
@property (nonatomic, retain) NSMutableArray *towerBulletArray;
//友军发射的子弹集合
@property (nonatomic, retain) NSMutableArray *friendlyBulletArray;
//魔法发射的子弹集合
@property (nonatomic, retain) NSMutableArray *magicBulletArray;
//塔攻击的集合
@property (nonatomic, retain) NSMutableArray *towerArray;
//友军攻击的集合
@property (nonatomic, retain) NSMutableArray *friendlyArray;

- (CGPoint) getPositionAfterTime:(ccTime)dt;

@end
