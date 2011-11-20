#import "TDDefBullet.h"
#import "TDUnit.h"
#import "GameController.h"
#import "TDEnemy.h"

@implementation TDArrowBullet1

+ (id) getSprite {
    TDArrowBullet1 *bullet = [TDArrowBullet1 spriteWithFile:@"atb.png"];
    if (bullet) {
        bullet.moveTime = TDS_ARROW_BULLET1_MOVETIME;
        bullet.attact = TDS_ARROW_BULLET1_ATTACT;
        bullet.attactMode = TDS_ARROW_BULLET1_ATTACTMODE;
    }
    return bullet;
}

@end

@implementation TDArrowBullet2

+ (id) getSprite {
    TDArrowBullet2 *bullet = [TDArrowBullet2 spriteWithFile:@"atb.png"];
    if (bullet) {
        bullet.moveTime = TDS_ARROW_BULLET2_MOVETIME;
        bullet.attact = TDS_ARROW_BULLET2_ATTACT;
        bullet.attactMode = TDS_ARROW_BULLET2_ATTACTMODE;
    }
    return bullet;
}

@end

@implementation TDArrowBullet3

+ (id) getSprite {
    TDArrowBullet3 *bullet = [TDArrowBullet3 spriteWithFile:@"atb.png"];
    if (bullet) {
        bullet.moveTime = TDS_ARROW_BULLET3_MOVETIME;
        bullet.attact = TDS_ARROW_BULLET3_ATTACT;
        bullet.attactMode = TDS_ARROW_BULLET3_ATTACTMODE;
    }
    return bullet;
}

@end

@implementation TDTurretBullet

@synthesize attactRange = _attactRange;
@synthesize aniBoomName = _aniBoomName;

-(id) init
{
	if( (self=[super init])) {
        _aniBoomName = @"ttat";
	}
	return self;
}

- (void) attactAEnemy:(TDEnemy*)enemy
{
    if (enemy && enemy.spriteStatus == TSS_NORMAL) {
        [enemy beAttact:self an:self.attact at:self.attactMode];
    }
}

- (void) searchClearEnemy {
	GameController *gc = [GameController getGameController];
	for (TDEnemy *e in gc.enemyArray) {
        if (e && e.spriteStatus == TSS_NORMAL) {
            double curDistance = ccpDistance(self.position, e.position);
            if (curDistance <= self.attactRange) {
                [self attactAEnemy:e];
            }
        }
	}
}

- (void) attact:(id)sender
{
    [self searchClearEnemy];
    id actionRepeat = [CCAnimate actionWithAnimation:[self getAnimate:self.aniBoomName] restoreOriginalFrame:NO];
	id actionRepeatDone = [CCCallFuncN actionWithTarget:self selector:@selector(afterRepeat:)];
	[self runAction:[CCSequence actions:actionRepeat, actionRepeatDone, nil]];
}

-(void) afterRepeat:(id)sender {
    [self removeFromParentAndCleanup:YES];
    self.spriteStatus = TSS_DEAD;
}

@end

@implementation TDTurretBullet1

+ (id) getSprite {
    TDTurretBullet1 *bullet = [TDTurretBullet1 spriteWithFile:@"ttb01.png"];
    if (bullet) {
        bullet.moveTime = TDS_TURRET_BULLET1_MOVETIME;
        bullet.attact = TDS_TURRET_BULLET1_ATTACT;
        bullet.attactMode = TDS_TURRET_BULLET1_ATTACTMODE;
        bullet.attactRange = TDS_TURRET_BULLET1_RANGE;
    }
    return bullet;
}

@end

@implementation TDTurretBullet2

+ (id) getSprite {
    TDTurretBullet2 *bullet = [TDTurretBullet2 spriteWithFile:@"ttb02.png"];
    if (bullet) {
        bullet.moveTime = TDS_TURRET_BULLET2_MOVETIME;
        bullet.attact = TDS_TURRET_BULLET2_ATTACT;
        bullet.attactMode = TDS_TURRET_BULLET2_ATTACTMODE;
        bullet.attactRange = TDS_TURRET_BULLET2_RANGE;
    }
    return bullet;
}

@end

@implementation TDTurretBullet3

+ (id) getSprite {
    TDTurretBullet3 *bullet = [TDTurretBullet3 spriteWithFile:@"ttb03.png"];
    if (bullet) {
        bullet.moveTime = TDS_TURRET_BULLET3_MOVETIME;
        bullet.attact = TDS_TURRET_BULLET3_ATTACT;
        bullet.attactMode = TDS_TURRET_BULLET3_ATTACTMODE;
        bullet.attactRange = TDS_TURRET_BULLET3_RANGE;
    }
    return bullet;
}

@end

@implementation TDMagicBullet1

+ (id) getSprite {
    TDMagicBullet1 *bullet = [TDMagicBullet1 spriteWithFile:@"mtb.png"];
    if (bullet) {
        bullet.moveTime = TDS_MAGIC_BULLET1_MOVETIME;
        bullet.attact = TDS_MAGIC_BULLET1_ATTACT;
        bullet.attactMode = TDS_MAGIC_BULLET1_ATTACTMODE;
    }
    return bullet;
}

@end

@implementation TDMagicBullet2

+ (id) getSprite {
    TDMagicBullet2 *bullet = [TDMagicBullet2 spriteWithFile:@"mtb.png"];
    if (bullet) {
        bullet.moveTime = TDS_MAGIC_BULLET2_MOVETIME;
        bullet.attact = TDS_MAGIC_BULLET2_ATTACT;
        bullet.attactMode = TDS_MAGIC_BULLET2_ATTACTMODE;
    }
    return bullet;
}

@end

@implementation TDMagicBullet3

+ (id) getSprite {
    TDMagicBullet3 *bullet = [TDMagicBullet3 spriteWithFile:@"mtb.png"];
    if (bullet) {
        bullet.moveTime = TDS_MAGIC_BULLET3_MOVETIME;
        bullet.attact = TDS_MAGIC_BULLET3_ATTACT;
        bullet.attactMode = TDS_MAGIC_BULLET3_ATTACTMODE;
    }
    return bullet;
}

@end
