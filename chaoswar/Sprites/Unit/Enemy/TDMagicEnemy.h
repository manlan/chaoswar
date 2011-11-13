#import <Foundation/Foundation.h>
#import "GamePubDef.h"
#import "TDEnemy.h"
#import "TDSprite.h"
#import "WayPoint.h"

@interface TDMagicEnemy : TDEnemy {
    TDEnemy *magicEnemy;
}

@property (nonatomic, assign) CCAnimation *mcAni;
@property int magicRange;

- (void) doMagic;

@end

@interface TDMagicEnemy1 : TDMagicEnemy {
    
}

@end

@interface TDMagicEnemy2 : TDMagicEnemy {
    
}

@end
