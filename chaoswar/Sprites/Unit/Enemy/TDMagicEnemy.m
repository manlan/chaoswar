#import "TDMagicEnemy.h"
#import "GamePubDef.h"

@implementation TDMagicEnemy

@synthesize atAni = _atAni;
@synthesize mcAni = _mcAni;

-(id) init
{
	if( (self=[super init])) {
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
        frame = [cache spriteFrameByName:[NSString stringWithFormat:@"mc%02d%@%04d.png", level, kind, i]];
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
    [self.mvuAni setName:[NSString stringWithFormat:@"mc%02dmvu", level]];
    [self.mvdAni setName:[NSString stringWithFormat:@"mc%02dmvd", level]];
    [self.mvlAni setName:[NSString stringWithFormat:@"mc%02dmvl", level]];
    [self.mvrAni setName:[NSString stringWithFormat:@"mc%02dmvr", level]];
    [self.ddAni setName:[NSString stringWithFormat:@"mc%02ddd", level]];
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
