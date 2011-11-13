#import "TDBossEnemy.h"
#import "GamePubDef.h"

@implementation TDBossEnemy

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
        frame = [cache spriteFrameByName:[NSString stringWithFormat:@"bs%02d%@%04d.png", level, kind, i]];
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
    [self.mvuAni setName:[NSString stringWithFormat:@"bs%02dmvu", level]];
    [self.mvdAni setName:[NSString stringWithFormat:@"bs%02dmvd", level]];
    [self.mvlAni setName:[NSString stringWithFormat:@"bs%02dmvl", level]];
    [self.mvrAni setName:[NSString stringWithFormat:@"bs%02dmvr", level]];
    [self.ddAni setName:[NSString stringWithFormat:@"bs%02ddd", level]];
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

@implementation TDBossEnemy1

+ (id) getSprite {
    TDBossEnemy1 *enemy = [TDBossEnemy1 spriteWithSpriteFrameName:@"bs01mvc0001.png"];
    if (enemy) {
        [enemy setScale:TDS_BS1_SCALE];
        enemy.maxHP = TDS_BS1_MAXHP;
        enemy.currentHP = TDS_BS1_CURRENTHP;
        enemy.moveSpeed = TDS_BS1_MOVESPEED;
        enemy.attacttime = TDS_BS1_ATTACTTIME;
        enemy.attactRange = TDS_BS1_ATTACTRANGE;     
        enemy.attact = TDS_BS1_ATTACT;
        enemy.attactMode = TDS_BS1_ATTACTMODE;
        enemy.defence = TDS_BS1_DEFENCE;
        enemy.defenceMode = TDS_BS1_DEFENCEMODE;
        enemy.getGold = TDS_BS1_GETGOLD;
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

@implementation TDBossEnemy2

+ (id) getSprite {
    TDBossEnemy2 *enemy = [TDBossEnemy2 spriteWithSpriteFrameName:@"bs02mvc0001.png"];
    if (enemy) {
        [enemy setScale:TDS_BS2_SCALE];
        enemy.maxHP = TDS_BS2_MAXHP;
        enemy.currentHP = TDS_BS2_CURRENTHP;
        enemy.moveSpeed = TDS_BS2_MOVESPEED;
        enemy.attacttime = TDS_BS2_ATTACTTIME;
        enemy.attactRange = TDS_BS2_ATTACTRANGE;     
        enemy.attact = TDS_BS2_ATTACT;
        enemy.attactMode = TDS_BS2_ATTACTMODE;
        enemy.defence = TDS_BS2_DEFENCE;
        enemy.defenceMode = TDS_BS2_DEFENCEMODE;
        enemy.getGold = TDS_BS2_GETGOLD;
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
