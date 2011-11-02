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

@end

@implementation TDForeverFriendly1

+ (id) getSprite {
    TDForeverFriendly1 *friendly = [TDForeverFriendly1 spriteWithSpriteFrameName:@"dtf01mv0001.png"];
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

@end

@implementation TDForeverFriendly2

+ (id) getSprite {
    TDForeverFriendly2 *friendly = [TDForeverFriendly2 spriteWithSpriteFrameName:@"dtf01mv0001.png"];
    if (friendly) {
        [friendly setScale:TDS_FFL2_SCALE];
        friendly.maxHP = TDS_FFL2_MAXHP;
        friendly.currentHP = TDS_FFL2_CURRENTHP;
        friendly.moveSpeed = TDS_FFL2_MOVESPEED;
        friendly.attacttime = TDS_FFL2_ATTACTTIME;
        friendly.attactRange = TDS_FFL2_ATTACTRANGE;     
        friendly.attact = TDS_FFL2_ATTACT;
        friendly.attactMode = TDS_FFL2_ATTACTMODE;
        friendly.defence = TDS_FFL2_DEFENCE;
        friendly.defenceMode = TDS_FFL2_DEFENCEMODE;
        friendly.searchRange = TDS_FFL2_SEARCHRANGE;
    }
    return friendly;
}

@end

