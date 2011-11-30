#import "TDMagicEnemy.h"
#import "GameController.h"
#import "GamePubDef.h"

@implementation TDMagicEnemy

@synthesize magicRange = _magicRange;

-(id) init
{
    self = [super init];
	if(self) {
        _magicRange = 100;
	}
	return self;
}


- (BOOL) run
{
    if ([super run] == NO) return NO;
    [self doMagic];
    return YES;
}

- (void) doMagic
{
    [self schedule:@selector(startMagic:) interval:5];
}

- (void) startMagic:(ccTime)dt {
    [self unschedule:@selector(startMagic:)];
    [self schedule:@selector(doingMagic:)];
}

- (TDEnemy*) searchMagicEnemy {
    double maxDistant = self.magicRange;
	GameController *gc = [GameController getGameController];
	for (TDEnemy *e in gc.enemyArray) {
        if (e && e.spriteStatus == TSS_NORMAL && e != self) {
            double curDistance = ccpDistance(self.position, e.position);
            if (curDistance <= maxDistant) {
                return e;
            }
        }
	}
	return nil;
}

- (void) doingMagic:(ccTime)dt {
    magicEnemy = [self searchMagicEnemy];
    if (magicEnemy) {
        [self unscheduleAllSelectors];
        [self stopAllActions];
        id actionAttact = [CCAnimate actionWithAnimation:[self getAnimate:self.mcAniName] restoreOriginalFrame:NO];
        id actionAttactDone = [CCCallFuncN actionWithTarget:self selector:@selector(afterMagic:)];
        [self runAction:[CCSequence actions:actionAttact, actionAttactDone, nil]];
    }
}

-(void) afterMagic:(id)sender {
    [self run];
    magicEnemy = nil;
    [self schedule:@selector(startMagic:) interval:5];
}

- (void) addAnimate:(int)level
{
    self.mvuAniName = [NSString stringWithFormat:@"mc%02dmvu", level];
    self.mvdAniName = [NSString stringWithFormat:@"mc%02dmvd", level];
    self.mvcAniName = [NSString stringWithFormat:@"mc%02dmvc", level];
    self.ddAniName = [NSString stringWithFormat:@"mc%02ddd", level];
    self.atAniName = [NSString stringWithFormat:@"mc%02dat", level];
    self.mcAniName = [NSString stringWithFormat:@"mc%02dmagic", level];
    self.smallPic = [NSString stringWithFormat:@"smmc%02d.png", level];
}

@end

@implementation TDMagicEnemy1

+ (id) getSprite {
    TDMagicEnemy1 *enemy = [TDMagicEnemy1 spriteWithSpriteFrameName:@"mc01mvc0001.png"];
    if (enemy) {
        [enemy setScale:TDS_MC1_SCALE];
        enemy.maxHP = TDS_MC1_MAXHP;
        enemy.currentHP = TDS_MC1_CURRENTHP;
        enemy.moveSpeed = TDS_MC1_MOVESPEED;
        enemy.attacttime = TDS_MC1_ATTACTTIME;
        enemy.attactRange = TDS_MC1_ATTACTRANGE;     
        enemy.attact = TDS_MC1_ATTACT;
        enemy.attactMode = TDS_MC1_ATTACTMODE;
        enemy.defence = TDS_MC1_DEFENCE;
        enemy.defenceMode = TDS_MC1_DEFENCEMODE;
        enemy.getGold = TDS_MC1_GETGOLD;
        [enemy addAnimate:1];
    }
    return enemy;
}

-(void) afterMagic:(id)sender {
    [magicEnemy doMagicLifeStatus];
    [super afterMagic:sender];
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDMagicEnemy2

+ (id) getSprite {
    TDMagicEnemy2 *enemy = [TDMagicEnemy2 spriteWithSpriteFrameName:@"mc02mvc0001.png"];
    if (enemy) {
        [enemy setScale:TDS_MC2_SCALE];
        enemy.maxHP = TDS_MC2_MAXHP;
        enemy.currentHP = TDS_MC2_CURRENTHP;
        enemy.moveSpeed = TDS_MC2_MOVESPEED;
        enemy.attacttime = TDS_MC2_ATTACTTIME;
        enemy.attactRange = TDS_MC2_ATTACTRANGE;     
        enemy.attact = TDS_MC2_ATTACT;
        enemy.attactMode = TDS_MC2_ATTACTMODE;
        enemy.defence = TDS_MC2_DEFENCE;
        enemy.defenceMode = TDS_MC2_DEFENCEMODE;
        enemy.getGold = TDS_MC2_GETGOLD;
        [enemy addAnimate:2];
    }
    return enemy;
}

-(void) afterMagic:(id)sender {
    [magicEnemy doMagicSpeedStatus];
    [super afterMagic:sender];
}

- (void) dealloc
{  
    [super dealloc];
}

@end
