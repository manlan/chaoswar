//
//  GameControllerScene.m
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "GameControllerScene.h"
#import "GameController.h"

@implementation GameControllerScene

@synthesize btnBuild1;
@synthesize btnBuild2;
@synthesize btnBuild3;
@synthesize btnBuild4;
@synthesize btnUpdate;
@synthesize btnSell;
@synthesize btnZone;

-(id) init
{
	if( (self=[super init])) {

	}
	return self;
}

- (void) setBuild1MenuStatus
{
    if (!btnBuild1) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL) {
        [btnBuild1 setIsEnabled:NO];
        return;
    }
    
    [btnBuild1 setIsEnabled:YES];
}

- (void) setBuild2MenuStatus
{
    if (!btnBuild2) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL) {
        [btnBuild2 setIsEnabled:NO];
        return;
    }
    
    [btnBuild2 setIsEnabled:YES];
}

- (void) setBuild3MenuStatus
{
    if (!btnBuild3) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL) {
        [btnBuild3 setIsEnabled:NO];
        return;
    }
    
    [btnBuild3 setIsEnabled:YES];
}

- (void) setBuild4MenuStatus
{
    if (!btnBuild4) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL) {
        [btnBuild4 setIsEnabled:NO];
        return;
    }
    
    [btnBuild4 setIsEnabled:YES];
}

- (void) setUpdateMenuStatus
{
    if (!btnUpdate) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL) {
        [btnUpdate setIsEnabled:NO];
        return;
    }
    
    [btnUpdate setIsEnabled:YES];
}

- (void) setSellMenuStatus
{
    if (!btnSell) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL) {
        [btnSell setIsEnabled:NO];
        return;
    }
    
    [btnSell setIsEnabled:YES];
}

- (void) setZoneMenuStatus
{
    if (!btnZone) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL && gc.operateType != OT_SETSEARCHPOINT) {
        [btnZone setIsEnabled:NO];
        return;
    }
    
    [btnZone setIsEnabled:YES];
}

- (void) clearSceneSrpite
{
    [self removeAllChildrenWithCleanup:YES];
    btnBuild1= nil;
    btnBuild2= nil;
    btnBuild3= nil;
    btnBuild4= nil;
    btnUpdate= nil;
    btnSell= nil;
    btnZone= nil;
}

@end
