#import "TDShooterEnemy.h"
#import "GamePubDef.h"

@implementation TDShooterEnemy

@synthesize atAni = _atAni;

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
        frame = [cache spriteFrameByName:[NSString stringWithFormat:@"st%02d%@%04d.png", level, kind, i]];
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
    [self.mvuAni setName:[NSString stringWithFormat:@"st%02dmvu", level]];
    [self.mvdAni setName:[NSString stringWithFormat:@"st%02dmvd", level]];
    [self.mvlAni setName:[NSString stringWithFormat:@"st%02dmvl", level]];
    [self.mvrAni setName:[NSString stringWithFormat:@"st%02dmvr", level]];
    [self.ddAni setName:[NSString stringWithFormat:@"st%02ddd", level]];
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

@implementation TDShooterEnemy1

+ (id) getSprite {
    TDShooterEnemy1 *enemy = [TDShooterEnemy1 spriteWithSpriteFrameName:@"st01mvc0001.png"];
    if (enemy) {
        [enemy setScale:TDS_ST1_SCALE];
        enemy.maxHP = TDS_ST1_MAXHP;
        enemy.currentHP = TDS_ST1_CURRENTHP;
        enemy.moveSpeed = TDS_ST1_MOVESPEED;
        enemy.attacttime = TDS_ST1_ATTACTTIME;
        enemy.attactRange = TDS_ST1_ATTACTRANGE;     
        enemy.attact = TDS_ST1_ATTACT;
        enemy.attactMode = TDS_ST1_ATTACTMODE;
        enemy.defence = TDS_ST1_DEFENCE;
        enemy.defenceMode = TDS_ST1_DEFENCEMODE;
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
