#import <Foundation/Foundation.h>
#import "GamePubDef.h"
#import "TDSprite.h"
#import "TDEnemy.h"

@interface TDFriendly : TDUnit {

}

@property (nonatomic, assign) TDEnemy *enemy;
@property (nonatomic, assign) NSMutableArray *shootBulletArray;
@property (nonatomic, assign) NSMutableArray *enemyBulletArray;
@property (nonatomic, assign) NSMutableArray *attactEnemyArray;
@property (nonatomic, retain) NSString *mvAniName;
@property (nonatomic, retain) NSString *firstFrameName;
@property CGPoint searchPoint;

- (void) doGoHomeLogic;

- (void) doMoveToEnemy;

- (BOOL) canAttactEnemy:(TDEnemy*)e;

- (void) AttactEnemy:(TDEnemy*)e;


- (void) doAttact:(ccTime)dt;

@end
