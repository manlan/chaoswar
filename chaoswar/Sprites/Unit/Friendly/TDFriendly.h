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
@property CGPoint searchPoint;

- (void) goToSearchPoint;

- (void) AttactEnemy:(TDEnemy*)e;

- (void) doAttactEnemy:(TDEnemy*)e;

- (BOOL) canAttactEnemy:(TDEnemy*)e;

- (void) doAttact:(ccTime)dt;

@end
