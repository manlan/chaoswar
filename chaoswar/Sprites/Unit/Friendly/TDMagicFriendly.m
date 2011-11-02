//
//  TDMagicFriendly.m
//  chaoswar
//
//  Created by Mac on 11-10-27.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "TDMagicFriendly.h"
#import "GamePubDef.h"
#import "TDSprite.h"
#import "TDEnemy.h"

@implementation TDMagicFriendly

@synthesize deadTime = _deadTime;

- (BOOL) run
{
    if ([super run] == NO) return NO;
    [self schedule:@selector(autoDead:) interval:_deadTime];
    return YES;
}

//自动死亡
- (void) autoDead:(ccTime)dt {
    [self unschedule:@selector(autoDead:)];
    [self removeFromParentAndCleanup:YES];
    self.spriteStatus = TSS_DEADING;
}

@end

@implementation TDMagicFriendly1

+ (id) getSprite {
    TDMagicFriendly1 *friendly = [TDMagicFriendly1 spriteWithSpriteFrameName:@"ft15mvc0001.png"];
    if (friendly) {
        [friendly setScale:TDS_MFL1_SCALE];
        friendly.maxHP = TDS_MFL1_MAXHP;
        friendly.currentHP = TDS_MFL1_CURRENTHP;
        friendly.moveSpeed = TDS_MFL1_MOVESPEED;
        friendly.attacttime = TDS_MFL1_ATTACTTIME;
        friendly.attactRange = TDS_MFL1_ATTACTRANGE;     
        friendly.attact = TDS_MFL1_ATTACT;
        friendly.attactMode = TDS_MFL1_ATTACTMODE;
        friendly.defence = TDS_MFL1_DEFENCE;
        friendly.defenceMode = TDS_MFL1_DEFENCEMODE;
        friendly.searchRange = TDS_MFL1_SEARCHRANGE;
        friendly.deadTime = TDS_MFL1_DEADTIME;
    }
    return friendly;
}

@end

@implementation TDMagicFriendly2

+ (id) getSprite {
    TDMagicFriendly2 *friendly = [TDMagicFriendly2 spriteWithSpriteFrameName:@"ft15mvc0001.png"];
    if (friendly) {
        [friendly setScale:TDS_MFL2_SCALE];
        friendly.maxHP = TDS_MFL2_MAXHP;
        friendly.currentHP = TDS_MFL2_CURRENTHP;
        friendly.moveSpeed = TDS_MFL2_MOVESPEED;
        friendly.attacttime = TDS_MFL2_ATTACTTIME;
        friendly.attactRange = TDS_MFL2_ATTACTRANGE;     
        friendly.attact = TDS_MFL2_ATTACT;
        friendly.attactMode = TDS_MFL2_ATTACTMODE;
        friendly.defence = TDS_MFL2_DEFENCE;
        friendly.defenceMode = TDS_MFL2_DEFENCEMODE;
        friendly.searchRange = TDS_MFL2_SEARCHRANGE;
        friendly.deadTime = TDS_MFL2_DEADTIME;
    }
    return friendly;
}

@end

