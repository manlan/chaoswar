//
//  FootEnemy.m
//  chaoswar
//
//  Created by Mac on 11-10-4.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "TDFootEnemy.h"


@implementation TDFootEnemy

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
        frame = [cache spriteFrameByName:[NSString stringWithFormat:@"ft%02d%@%04d.png", level, kind, i]];
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
    self.atAni = [self getAnimation:level kind:@"at"];
    [self.mvuAni setName:[NSString stringWithFormat:@"ft%02dmvu", level]];
    [self.mvdAni setName:[NSString stringWithFormat:@"ft%02dmvd", level]];
    [self.mvlAni setName:[NSString stringWithFormat:@"ft%02dmvl", level]];
    [self.mvrAni setName:[NSString stringWithFormat:@"ft%02dmvr", level]];
    [self.ddAni setName:[NSString stringWithFormat:@"ft%02ddd", level]];
    [self.atAni setName:[NSString stringWithFormat:@"ft%02dat", level]];
    [self addAnimation:self.mvuAni];
    [self addAnimation:self.mvdAni];
    [self addAnimation:self.mvlAni];
    [self addAnimation:self.mvrAni];
    [self addAnimation:self.ddAni];
    [self addAnimation:self.atAni];
}

- (void) dealloc
{
	[super dealloc];
}

@end

@implementation TDFootEnemy1

+ (id) getSprite {
    TDFootEnemy1 *enemy = [TDFootEnemy1 spriteWithSpriteFrameName:@"ft01mvc0001.png"];
    if (enemy) {
        [enemy setScale:0.65];
        enemy.maxHP = 100;
        enemy.currentHP = enemy.maxHP;
        enemy.moveSpeed = 20;
        enemy.attacttime = 1.2;
        enemy.attactRange = 0;     
        enemy.attact = 8;
        enemy.attactMode = 0;
        enemy.defenceMode = 0;
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

@implementation TDFootEnemy2

+ (id) getSprite {
    TDFootEnemy2 *enemy = [TDFootEnemy2 spriteWithSpriteFrameName:@"ft02mvc0001.png"];
    if (enemy) {
        [enemy setScale:0.65];
        enemy.maxHP = 60;
        enemy.currentHP = enemy.maxHP;
        enemy.moveSpeed = 40;
        enemy.attacttime = 1.2;
        enemy.attactRange = 0;     
        enemy.attact = 8;
        enemy.attactMode = 0;
        enemy.defenceMode = 0;
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

@implementation TDFootEnemy3

+ (id) getSprite {
    TDFootEnemy3 *enemy = [TDFootEnemy3 spriteWithSpriteFrameName:@"ft03mvc0001.png"];
    if (enemy) {
        [enemy setScale:0.65];
        enemy.maxHP = 60;
        enemy.currentHP = enemy.maxHP;
        enemy.moveSpeed = 40;
        enemy.attacttime = 1.2;
        enemy.attactRange = 0;     
        enemy.attact = 8;
        enemy.attactMode = 0;
        enemy.defenceMode = 0;
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

@implementation TDFootEnemy4

+ (id) getSprite {
    TDFootEnemy4 *enemy = [TDFootEnemy4 spriteWithSpriteFrameName:@"ft04mvc0001.png"];
    if (enemy) {
        [enemy setScale:0.65];
        enemy.maxHP = 60;
        enemy.currentHP = enemy.maxHP;
        enemy.moveSpeed = 40;
        enemy.attacttime = 1.2;
        enemy.attactRange = 0;     
        enemy.attact = 8;
        enemy.attactMode = 0;
        enemy.defenceMode = 0;
    }
    return enemy;
}

- (void) initAnimate
{
    [self addAnimate:4]; 
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy5

+ (id) getSprite {
    TDFootEnemy5 *enemy = [TDFootEnemy5 spriteWithSpriteFrameName:@"ft05mvc0001.png"];
    if (enemy) {
        [enemy setScale:0.65];
        enemy.maxHP = 60;
        enemy.currentHP = enemy.maxHP;
        enemy.moveSpeed = 40;
        enemy.attacttime = 1.2;
        enemy.attactRange = 0;     
        enemy.attact = 8;
        enemy.attactMode = 0;
        enemy.defenceMode = 0;
    }
    return enemy;
}

- (void) initAnimate
{
    [self addAnimate:5]; 
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy6

+ (id) getSprite {
    TDFootEnemy6 *enemy = [TDFootEnemy6 spriteWithSpriteFrameName:@"ft06mvc0001.png"];
    if (enemy) {
        [enemy setScale:0.65];
        enemy.maxHP = 60;
        enemy.currentHP = enemy.maxHP;
        enemy.moveSpeed = 40;
        enemy.attacttime = 1.2;
        enemy.attactRange = 0;     
        enemy.attact = 8;
        enemy.attactMode = 0;
        enemy.defenceMode = 0;
    }
    return enemy;
}

- (void) initAnimate
{
    [self addAnimate:6]; 
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy7

+ (id) getSprite {
    TDFootEnemy7 *enemy = [TDFootEnemy7 spriteWithSpriteFrameName:@"ft07mvc0001.png"];
    if (enemy) {
        [enemy setScale:0.65];
        enemy.maxHP = 60;
        enemy.currentHP = enemy.maxHP;
        enemy.moveSpeed = 40;
        enemy.attacttime = 1.2;
        enemy.attactRange = 0;     
        enemy.attact = 8;
        enemy.attactMode = 0;
        enemy.defenceMode = 0;
    }
    return enemy;
}

- (void) initAnimate
{
    [self addAnimate:7]; 
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy8

+ (id) getSprite {
    TDFootEnemy8 *enemy = [TDFootEnemy8 spriteWithSpriteFrameName:@"ft08mvc0001.png"];
    if (enemy) {
        [enemy setScale:0.65];
        enemy.maxHP = 60;
        enemy.currentHP = enemy.maxHP;
        enemy.moveSpeed = 40;
        enemy.attacttime = 1.2;
        enemy.attactRange = 0;     
        enemy.attact = 8;
        enemy.attactMode = 0;
        enemy.defenceMode = 0;
    }
    return enemy;
}

- (void) initAnimate
{
    [self addAnimate:8]; 
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy9

+ (id) getSprite {
    TDFootEnemy9 *enemy = [TDFootEnemy9 spriteWithSpriteFrameName:@"ft09mvc0001.png"];
    if (enemy) {
        [enemy setScale:0.65];
        enemy.maxHP = 60;
        enemy.currentHP = enemy.maxHP;
        enemy.moveSpeed = 40;
        enemy.attacttime = 1.2;
        enemy.attactRange = 0;     
        enemy.attact = 8;
        enemy.attactMode = 0;
        enemy.defenceMode = 0;
    }
    return enemy;
}

- (void) initAnimate
{
    [self addAnimate:9]; 
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy10

+ (id) getSprite {
    TDFootEnemy10 *enemy = [TDFootEnemy10 spriteWithSpriteFrameName:@"ft10mvc0001.png"];
    if (enemy) {
        [enemy setScale:0.65];
        enemy.maxHP = 60;
        enemy.currentHP = enemy.maxHP;
        enemy.moveSpeed = 40;
        enemy.attacttime = 1.2;
        enemy.attactRange = 0;     
        enemy.attact = 8;
        enemy.attactMode = 0;
        enemy.defenceMode = 0;
    }
    return enemy;
}

- (void) initAnimate
{
    [self addAnimate:10]; 
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy11

+ (id) getSprite {
    TDFootEnemy11 *enemy = [TDFootEnemy11 spriteWithSpriteFrameName:@"ft11mvc0001.png"];
    if (enemy) {
        [enemy setScale:0.65];
        enemy.maxHP = 60;
        enemy.currentHP = enemy.maxHP;
        enemy.moveSpeed = 40;
        enemy.attacttime = 1.2;
        enemy.attactRange = 0;     
        enemy.attact = 8;
        enemy.attactMode = 0;
        enemy.defenceMode = 0;
    }
    return enemy;
}

- (void) initAnimate
{
    [self addAnimate:11]; 
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy12

+ (id) getSprite {
    TDFootEnemy12 *enemy = [TDFootEnemy12 spriteWithSpriteFrameName:@"ft12mvc0001.png"];
    if (enemy) {
        [enemy setScale:0.65];
        enemy.maxHP = 60;
        enemy.currentHP = enemy.maxHP;
        enemy.moveSpeed = 40;
        enemy.attacttime = 1.2;
        enemy.attactRange = 0;     
        enemy.attact = 8;
        enemy.attactMode = 0;
        enemy.defenceMode = 0;
    }
    return enemy;
}

- (void) initAnimate
{
    [self addAnimate:12]; 
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy13

+ (id) getSprite {
    TDFootEnemy13 *enemy = [TDFootEnemy13 spriteWithSpriteFrameName:@"ft13mvc0001.png"];
    if (enemy) {
        [enemy setScale:0.65];
        enemy.maxHP = 60;
        enemy.currentHP = enemy.maxHP;
        enemy.moveSpeed = 40;
        enemy.attacttime = 1.2;
        enemy.attactRange = 0;     
        enemy.attact = 8;
        enemy.attactMode = 0;
        enemy.defenceMode = 0;
    }
    return enemy;
}

- (void) initAnimate
{
    [self addAnimate:13]; 
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy14

+ (id) getSprite {
    TDFootEnemy14 *enemy = [TDFootEnemy14 spriteWithSpriteFrameName:@"ft14mvc0001.png"];
    if (enemy) {
        [enemy setScale:0.8];
        enemy.maxHP = 60;
        enemy.currentHP = enemy.maxHP;
        enemy.currentHP = 51;
        enemy.moveSpeed = 40;
        enemy.attacttime = 1.2;
        enemy.attactRange = 0;     
        enemy.attact = 8;
        enemy.attactMode = 0;
        enemy.defenceMode = 0;
    }
    return enemy;
}

- (void) initAnimate
{
    [self addAnimate:14]; 
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy15

+ (id) getSprite {
    TDFootEnemy15 *enemy = [TDFootEnemy15 spriteWithSpriteFrameName:@"ft15mvc0001.png"];
    if (enemy) {
        [enemy setScale:0.65];
        enemy.maxHP = 60;
        enemy.currentHP = enemy.maxHP;
        enemy.moveSpeed = 40;
        enemy.attacttime = 1.2;
        enemy.attactRange = 0;     
        enemy.attact = 8;
        enemy.attactMode = 0;
        enemy.defenceMode = 0;
    }
    return enemy;
}

- (void) initAnimate
{
    [self addAnimate:15]; 
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy16

+ (id) getSprite {
    TDFootEnemy16 *enemy = [TDFootEnemy16 spriteWithSpriteFrameName:@"ft16mvc0001.png"];
    if (enemy) {
        [enemy setScale:0.65];
        enemy.maxHP = 60;
        enemy.currentHP = enemy.maxHP;
        enemy.moveSpeed = 40;
        enemy.attacttime = 1.2;
        enemy.attactRange = 0;     
        enemy.attact = 8;
        enemy.attactMode = 0;
        enemy.defenceMode = 0;
    }
    return enemy;
}

- (void) initAnimate
{
    [self addAnimate:16]; 
}

- (void) dealloc
{  
    [super dealloc];
}

@end
