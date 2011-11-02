#import "TDUnit.h"
#import "GameController.h"

@implementation TDUnit

@synthesize maxMP = _maxMP;
@synthesize currentMP = _currentMP;
@synthesize moveSpeed = _moveSpeed;
@synthesize searchRange = _searchRange;
@synthesize attact = _attact;
@synthesize attactMode = _attactMode;
@synthesize attactRange = _attactRange;
@synthesize attacttime = _attacttime;
@synthesize defence = _defence;
@synthesize defenceMode = _defenceMode;
@synthesize mvuAni = _mvuAni;
@synthesize mvdAni = _mvdAni;
@synthesize mvlAni = _mvlAni;
@synthesize mvrAni = _mvrAni;
@synthesize ddAni = _ddAni;

-(id) init
{
	if( (self=[super init])) {
        self.showBlood = YES;
	}
	return self;
}

- (void) beAttact:(TDSprite*)s an:(int)an at:(TAcctactType)at
{
    self.currentHP = self.currentHP - an;
    if (self.currentHP < 0) self.currentHP = 0;
    if (self.currentHP == 0) {
        s.killNum++;
        [self stopAllActions];        
        id actionDead = [CCAnimate actionWithAnimation:self.ddAni restoreOriginalFrame:NO];
        id actionDeadDone = [CCCallFuncN actionWithTarget:self selector:@selector(afterDead:)];
        [self runAction:[CCSequence actions:actionDead, actionDeadDone, nil]];
        self.spriteStatus = TSS_DEADING;
    }
}

-(void) afterDead:(id)sender {
    GameController *gc = [GameController getGameController];
    self.spriteStatus = TSS_DEAD;
    gc.currentGold = gc.currentGold + self.getGold;
    [self removeFromParentAndCleanup:YES];
}

@end
