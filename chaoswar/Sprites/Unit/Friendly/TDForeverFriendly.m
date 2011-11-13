//
//  TDForeverFriendly.m
//  chaoswar
//
//  Created by Mac on 11-10-27.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "TDForeverFriendly.h"
#import "GamePubDef.h"
#import "TDSprite.h"
#import "TDEnemy.h"

@implementation TDForeverFriendly

- (CCAnimation*) getAnimation:(int)level kind:(NSString*)kind
{
    CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
    NSMutableArray *animArray = [NSMutableArray array];
    CCSpriteFrame *frame = nil;
    int i = 1;
    do {
        frame = [cache spriteFrameByName:[NSString stringWithFormat:@"fcf%02d%@%04d.png", level, kind, i]];
        i++;
        if (frame != nil) {
            [animArray addObject:frame];
        }
    } while (frame != nil);
    return [CCAnimation animationWithFrames:animArray delay:0.05f];
}

@end

@implementation TDForeverFriendly1

+ (id) getSprite {
    TDForeverFriendly1 *friendly = [TDForeverFriendly1 spriteWithSpriteFrameName:@"fcf01mv0001.png"];
    if (friendly) {
        [friendly setScale:TDS_FFL1_SCALE];
        friendly.maxHP = TDS_FFL1_MAXHP;
        friendly.currentHP = TDS_FFL1_CURRENTHP;
        friendly.moveSpeed = TDS_FFL1_MOVESPEED;
        friendly.attacttime = TDS_FFL1_ATTACTTIME;
        friendly.attactRange = TDS_FFL1_ATTACTRANGE;     
        friendly.attact = TDS_FFL1_ATTACT;
        friendly.attactMode = TDS_FFL1_ATTACTMODE;
        friendly.defence = TDS_FFL1_DEFENCE;
        friendly.defenceMode = TDS_FFL1_DEFENCEMODE;
        friendly.searchRange = TDS_FFL1_SEARCHRANGE;
    }
    return friendly;
}

- (void) initAnimate
{
    [super initAnimate];
    int level = 1;
    self.movAni = [self getAnimation:level kind:@"mv"];
    self.ddAni = [self getAnimation:level kind:@"dd"];
    self.atAni = [self getAnimation:level kind:@"at"];
    [self.movAni setName:[NSString stringWithFormat:@"fcf%02dmv", level]];
    [self.ddAni setName:[NSString stringWithFormat:@"fcf%02ddd", level]];
    [self.atAni setName:[NSString stringWithFormat:@"fcf%02dat", level]];
    [self addAnimation:self.movAni];
    [self addAnimation:self.ddAni];
    [self addAnimation:self.atAni];
}

@end

