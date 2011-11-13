#import "TDFlyEnemy.h"
#import "GamePubDef.h"

@implementation TDFlyEnemy

-(id) init
{
	if( (self=[super init])) {
        self.spritePlace = SP_AIR;
	}
	return self;
}

- (CCAnimation*) getAnimation:(int)level kind:(NSString*)kind
{
    CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
    NSMutableArray *animArray = [NSMutableArray array];
    CCSpriteFrame *frame = nil;
    int i = 1;
    do {
        frame = [cache spriteFrameByName:[NSString stringWithFormat:@"fl%02d%@%04d.png", level, kind, i]];
        i++;
        if (frame != nil) {
            [animArray addObject:frame];
        }
    } while (frame != nil);
    return [CCAnimation animationWithFrames:animArray delay:0.05f];
}

- (void) addAnimate:(int)level
{
    self.mvuAni = [self getAnimation:level kind:@"mvu"];
    self.mvdAni = [self getAnimation:level kind:@"mvd"];
    self.mvlAni = [self getAnimation:level kind:@"mvc"];
    self.mvrAni = [self getAnimation:level kind:@"mvc"];
    self.ddAni = [self getAnimation:level kind:@"dd"];
    [self.mvuAni setName:[NSString stringWithFormat:@"fl%02dmvu", level]];
    [self.mvdAni setName:[NSString stringWithFormat:@"fl%02dmvd", level]];
    [self.mvlAni setName:[NSString stringWithFormat:@"fl%02dmvl", level]];
    [self.mvrAni setName:[NSString stringWithFormat:@"fl%02dmvr", level]];
    [self.ddAni setName:[NSString stringWithFormat:@"fl%02ddd", level]];
    [self addAnimation:self.mvuAni];
    [self addAnimation:self.mvdAni];
    [self addAnimation:self.mvlAni];
    [self addAnimation:self.mvrAni];
    [self addAnimation:self.ddAni];
}

- (void) dealloc
{
	[super dealloc];
}

- (void) doRunning
{
    self.enemyStatus = ES_NORMAL;
    [self schedule:@selector(doMove:)];
}

- (void) doWaiting
{
    self.enemyStatus = ES_NORMAL;
    [self schedule:@selector(doMove:)];
}

- (void) doAttact
{
    self.enemyStatus = ES_NORMAL;
    [self schedule:@selector(doMove:)];
}

@end

@implementation TDFlyEnemy1

+ (id) getSprite {
    TDFlyEnemy1 *enemy = [TDFlyEnemy1 spriteWithSpriteFrameName:@"fl01mvc0001.png"];
    if (enemy) {
        [enemy setScale:TDS_FL1_SCALE];
        enemy.maxHP = TDS_FL1_MAXHP;
        enemy.currentHP = TDS_FL1_CURRENTHP;
        enemy.moveSpeed = TDS_FL1_MOVESPEED;
        enemy.attacttime = TDS_FL1_ATTACTTIME;
        enemy.attactRange = TDS_FL1_ATTACTRANGE;     
        enemy.attact = TDS_FL1_ATTACT;
        enemy.attactMode = TDS_FL1_ATTACTMODE;
        enemy.defence = TDS_FL1_DEFENCE;
        enemy.defenceMode = TDS_FL1_DEFENCEMODE;
        enemy.getGold = TDS_FL1_GETGOLD;
    }
    return enemy;
}

- (void) initAnimate
{
    [self addAnimate:1]; 
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFlyEnemy2

+ (id) getSprite {
    TDFlyEnemy2 *enemy = [TDFlyEnemy2 spriteWithSpriteFrameName:@"fl02mvc0001.png"];
    if (enemy) {
        [enemy setScale:TDS_FL2_SCALE];
        enemy.maxHP = TDS_FL2_MAXHP;
        enemy.currentHP = TDS_FL2_CURRENTHP;
        enemy.moveSpeed = TDS_FL2_MOVESPEED;
        enemy.attacttime = TDS_FL2_ATTACTTIME;
        enemy.attactRange = TDS_FL2_ATTACTRANGE;     
        enemy.attact = TDS_FL2_ATTACT;
        enemy.attactMode = TDS_FL2_ATTACTMODE;
        enemy.defence = TDS_FL2_DEFENCE;
        enemy.defenceMode = TDS_FL2_DEFENCEMODE;
        enemy.getGold = TDS_FL2_GETGOLD;
    }
    return enemy;
}

- (void) initAnimate
{
    [self addAnimate:2]; 
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFlyEnemy3

+ (id) getSprite {
    TDFlyEnemy3 *enemy = [TDFlyEnemy3 spriteWithSpriteFrameName:@"fl03mvc0001.png"];
    if (enemy) {
        [enemy setScale:TDS_FL3_SCALE];
        enemy.maxHP = TDS_FL3_MAXHP;
        enemy.currentHP = TDS_FL3_CURRENTHP;
        enemy.moveSpeed = TDS_FL3_MOVESPEED;
        enemy.attacttime = TDS_FL3_ATTACTTIME;
        enemy.attactRange = TDS_FL3_ATTACTRANGE;     
        enemy.attact = TDS_FL3_ATTACT;
        enemy.attactMode = TDS_FL3_ATTACTMODE;
        enemy.defence = TDS_FL3_DEFENCE;
        enemy.defenceMode = TDS_FL3_DEFENCEMODE;
        enemy.getGold = TDS_FL3_GETGOLD;
    }
    return enemy;
}

- (void) initAnimate
{
    [self addAnimate:3]; 
}

- (void) dealloc
{  
    [super dealloc];
}

@end
