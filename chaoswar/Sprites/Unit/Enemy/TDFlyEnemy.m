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

- (void) addAnimate:(int)level
{
    self.mvuAniName = [NSString stringWithFormat:@"fl%02dmvu", level];
    self.mvdAniName = [NSString stringWithFormat:@"fl%02dmvd", level];
    self.mvcAniName = [NSString stringWithFormat:@"fl%02dmvc", level];
    self.ddAniName = [NSString stringWithFormat:@"fl%02ddd", level];
    self.atAniName = [NSString stringWithFormat:@"fl%02dat", level];
}

- (void) dealloc
{
	[super dealloc];
}

- (void) showImformation {
    
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
        [enemy addAnimate:1];
    }
    return enemy;
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
        [enemy addAnimate:2];
    }
    return enemy;
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
        [enemy addAnimate:3];
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end
