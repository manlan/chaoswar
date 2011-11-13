#import "TDMagicBullet.h"
#import "TDUnit.h"
#import "GameController.h"
#import "TDEnemy.h"

@implementation TDFireBullet1

@synthesize attactRange = _attactRange;
@synthesize aniBoom = _aniBoom;
@synthesize aniEffect = _aniEffect;

+ (id) getSprite {
    TDFireBullet1 *bullet = [TDFireBullet1 spriteWithSpriteFrameName:@"firebu0001.png"];
    if (bullet) {
        bullet.moveTime = MC_FIRE_BULLET_MOVETIME;
        bullet.attact = MC_FIRE_BULLET_ATTACT;
        bullet.attactMode = MC_FIRE_BULLET_ATTACTMODE;
        bullet.attactRange = MC_FIRE_BULLET_RANGE;
    }
    return bullet;
}

-(id) init
{
	if( (self=[super init])) {
        CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        //
        NSMutableArray *animArrayBoom = [NSMutableArray array];
        CCSpriteFrame *frame = nil;
        int i = 1;
        do {
            frame = [cache spriteFrameByName:[NSString stringWithFormat:@"fireeb%04d.png", i]];
            i++;
            if (frame != nil) {
                [animArrayBoom addObject:frame];
            }
        } while (frame != nil);
        _aniBoom = [CCAnimation animationWithFrames:animArrayBoom delay:0.05f];
        [_aniBoom setName:@"fireeb"];
        [self addAnimation:_aniBoom];
        //
        NSMutableArray *animArrayEffect = [NSMutableArray array];
        frame = nil;
        i = 1;
        do {
            frame = [cache spriteFrameByName:[NSString stringWithFormat:@"fireef%04d.png", i]];
            i++;
            if (frame != nil) {
                [animArrayEffect addObject:frame];
            }
        } while (frame != nil);
        _aniEffect = [CCAnimation animationWithFrames:animArrayEffect delay:0.05f];
        [_aniEffect setName:@"fireef"];
        [self addAnimation:_aniEffect];
        //
        NSMutableArray *animArrayNormal = [NSMutableArray array];
        frame = nil;
        i = 1;
        do {
            frame = [cache spriteFrameByName:[NSString stringWithFormat:@"firebu%04d.png", i]];
            i++;
            if (frame != nil) {
                [animArrayNormal addObject:frame];
            }
        } while (frame != nil);
        CCAnimation *aniNormal = [CCAnimation animationWithFrames:animArrayNormal delay:0.05f];
        [aniNormal setName:@"firebu"];
        [self addAnimation:aniNormal];
        
        [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:aniNormal restoreOriginalFrame:NO]]];
	}
	return self;
}

- (BOOL) run
{
    if ([super run] == NO) return NO;
    [self move];
    return YES;
}

- (void) move {
    id actionMove = [CCMoveTo actionWithDuration:self.moveTime position:self.firePoint];
	id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(attact:)];
	[self runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

- (void) attact:(id)sender
{
    [self attactEnemy];
}

- (void) attactEnemy
{
    [self stopAllActions];
    id actionBoom = [CCAnimate actionWithAnimation:_aniBoom restoreOriginalFrame:NO];
	id actionAttact = [CCCallFuncN actionWithTarget:self selector:@selector(afterRepeat:)];
    id actionEffect = [CCAnimate actionWithAnimation:_aniEffect restoreOriginalFrame:NO];
    id actionDead = [CCCallFuncN actionWithTarget:self selector:@selector(selfDead:)];
    
	[self runAction:[CCSequence actions:actionAttact, actionBoom, actionEffect, actionDead, nil]];
}

-(void) afterRepeat:(id)sender {    
    [self searchClearEnemy];
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

-(void) selfDead:(id)sender {    
    self.spriteStatus = TSS_DEAD;
}

- (void) attactAEnemy:(TDEnemy*)enemy
{
    if (enemy && enemy.spriteStatus == TSS_NORMAL) {
        [enemy beAttact:self an:self.attact at:self.attactMode];
    }
}

@end

@implementation TDThunderBullet1

+ (id) getSprite {
    TDThunderBullet1 *bullet = [TDThunderBullet1 spriteWithSpriteFrameName:@"thunderbu0001.png"];
    if (bullet) {
        bullet.moveTime = MC_THUNDER_BULLET_MOVETIME;
        bullet.attact = MC_THUNDER_BULLET_ATTACT;
        bullet.attactMode = MC_THUNDER_BULLET_ATTACTMODE;
    }
    return bullet;
}

- (BOOL) run
{
    if ([super run] == NO) return NO;
    if (!self.enemy) {
        self.spriteStatus = TSS_DEAD;
        return NO;
    }
    self.anchorPoint = ccp(0.5, 0);
    self.position = ccp(self.enemy.position.x, self.enemy.position.y + self.enemy.textureRect.size.height);
    CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
    NSMutableArray *animArray = [NSMutableArray array];
    [animArray removeAllObjects];
    CCSpriteFrame *frame = nil;
    int i = 1;
    do {
        frame = [cache spriteFrameByName:[NSString stringWithFormat:@"thunderbu%04d.png", i]];
        i++;
        if (frame != nil) {
            [animArray addObject:frame];
        }
    } while (frame != nil);
    CCAnimation *aniNormal = [CCAnimation animationWithFrames:animArray delay:0.05f];
    [aniNormal setName:@"thunderbu"];
    [self addAnimation:aniNormal];
    
    id actionRepeat = [CCAnimate actionWithAnimation:aniNormal restoreOriginalFrame:NO];
	id actionRepeatDone = [CCCallFuncN actionWithTarget:self selector:@selector(attact:)];
	[self runAction:[CCSequence actions:actionRepeat, actionRepeatDone, nil]];
    return YES;
}

- (void) attact:(id)sender
{
    if (self.enemy && self.enemy.spriteStatus == TSS_NORMAL) {
        [self.enemy beAttact:self an:self.attact at:self.attactMode];
    }
    self.spriteStatus = TSS_DEAD;
}

@end

@implementation TDStoneBullet1

@synthesize faintTime = _faintTime;
@synthesize aniBoom = _aniBoom;

+ (id) getSprite {
    TDStoneBullet1 *bullet = [TDStoneBullet1 spriteWithSpriteFrameName:@"stonebu0001.png"];
    if (bullet) {
        bullet.moveTime = MC_STONE_BULLET_MOVETIME;
        bullet.attact = MC_STONE_BULLET_ATTACT;
        bullet.attactMode = MC_STONE_BULLET_ATTACTMODE;
        bullet.faintTime = MC_STONE_BULLET_FAINTTIME;
    }
    return bullet;
}

-(id) init
{
	if( (self=[super init])) {
        CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        NSMutableArray *animArray = [NSMutableArray array];
        //
        [animArray removeAllObjects];
        CCSpriteFrame *frame = nil;
        int i = 1;
        do {
            frame = [cache spriteFrameByName:[NSString stringWithFormat:@"stoneeb%04d.png", i]];
            i++;
            if (frame != nil) {
                [animArray addObject:frame];
            }
        } while (frame != nil);
        _aniBoom = [CCAnimation animationWithFrames:animArray delay:0.05f];
        [_aniBoom setName:@"stoneeb"];
        [self addAnimation:_aniBoom];
        //
        [animArray removeAllObjects];
        frame = nil;
        i = 1;
        do {
            frame = [cache spriteFrameByName:[NSString stringWithFormat:@"stonebu%04d.png", i]];
            i++;
            if (frame != nil) {
                [animArray addObject:frame];
            }
        } while (frame != nil);
        CCAnimation *aniNormal = [CCAnimation animationWithFrames:animArray delay:0.05f];
        [aniNormal setName:@"stonebu"];
        [self addAnimation:aniNormal];
        
        [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.1 animation:aniNormal restoreOriginalFrame:NO]]];
	}
	return self;
}

- (BOOL) run
{
    if ([super run] == NO) return NO;
    [self move];
    return YES;
}

- (void) move {
    if (!self.enemy) {
        self.spriteStatus = TSS_DEAD;
        return;
    }
    CGPoint p = [self.enemy getPositionAfterTime:self.moveTime];
    self.position = ccp(p.x, p.y + 100);
    id actionMove = [CCMoveTo actionWithDuration:self.moveTime position:p];
	id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(attact:)];
	[self runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

- (void) attact:(id)sender
{
    [self attactEnemy];
}

- (void) attactEnemy
{
    id actionBoom = [CCAnimate actionWithAnimation:_aniBoom restoreOriginalFrame:NO];
	id actionAttact = [CCCallFuncN actionWithTarget:self selector:@selector(afterRepeat:)];
    id actionDead = [CCCallFuncN actionWithTarget:self selector:@selector(selfDead:)];
	[self runAction:[CCSequence actions:actionAttact, actionBoom, actionDead, nil]];
}

-(void) afterRepeat:(id)sender {    
    if (self.enemy && self.enemy.spriteStatus == TSS_NORMAL) {
        [self.enemy beAttact:self an:self.attact at:self.attactMode];
        if (self.enemy) {
            //self.enemy.enemyStatus = ES_WAITING;
        }
    }
}

-(void) selfDead:(id)sender {    
    self.spriteStatus = TSS_DEAD;
}

@end