#import <Foundation/Foundation.h>
#import "GameTypeDef.h"
#import "TDBullet.h"

@interface TDFireBullet1 : TDMoveBullet {
    
}

@property int attactRange;
@property (nonatomic, assign) CCAnimation *aniBoom;
@property (nonatomic, assign) CCAnimation *aniEffect;

- (void) move;

- (void) attactEnemy;

- (void) searchClearEnemy;

- (void) attactAEnemy:(TDEnemy*)enemy;

@end

@interface TDThunderBullet1 : TDMagicBullet {
    
}

@end

@interface TDStoneBullet1 : TDMagicBullet {
    
}

@property ccTime faintTime;
@property (nonatomic, assign) CCAnimation *aniBoom;

- (void) move;

- (void) attactEnemy;

@end
