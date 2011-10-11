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

@synthesize btnBuild1Menu;
@synthesize btnBuild2Menu;
@synthesize btnBuild3Menu;
@synthesize btnBuild4Menu;
@synthesize btnUpdateMenu;
@synthesize btnSellMenu;
@synthesize btnZoneMenu;

-(id) init
{
	if( (self=[super init])) {

	}
	return self;
}

- (void) setBuild1MenuStatus
{
    if (!btnBuild1Menu) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL) {
        [btnBuild1Menu setIsTouchEnabled:NO];
        return;
    }
    
    [btnBuild1Menu setIsTouchEnabled:YES];
}

- (void) setBuild2MenuStatus
{
    if (!btnBuild2Menu) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL) {
        [btnBuild2Menu setIsTouchEnabled:NO];
        return;
    }
    
    [btnBuild2Menu setIsTouchEnabled:YES];
}

- (void) setBuild3MenuStatus
{
    if (!btnBuild3Menu) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL) {
        [btnBuild3Menu setIsTouchEnabled:NO];
        return;
    }
    
    [btnBuild3Menu setIsTouchEnabled:YES];
}

- (void) setBuild4MenuStatus
{
    if (!btnBuild4Menu) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL) {
        [btnBuild4Menu setIsTouchEnabled:NO];
        return;
    }
    
    [btnBuild4Menu setIsTouchEnabled:YES];
}

- (void) setUpdateMenuStatus
{
    if (!btnUpdateMenu) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL) {
        [btnUpdateMenu setIsTouchEnabled:NO];
        return;
    }
    
    [btnUpdateMenu setIsTouchEnabled:YES];
}

- (void) setSellMenuStatus
{
    if (!btnSellMenu) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL) {
        [btnSellMenu setIsTouchEnabled:NO];
        return;
    }
    
    [btnSellMenu setIsTouchEnabled:YES];
}

- (void) setZoneMenuStatus
{
    if (!btnZoneMenu) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL && gc.operateType != OT_SETSEARCHPOINT) {
        [btnZoneMenu setIsTouchEnabled:NO];
        return;
    }
    
    [btnZoneMenu setIsTouchEnabled:YES];
}

- (void) clearSceneSrpite
{
    [self removeAllChildrenWithCleanup:YES];
    btnBuild1Menu = nil;
    btnBuild2Menu = nil;
    btnBuild3Menu = nil;
    btnBuild4Menu = nil;
    btnUpdateMenu = nil;
    btnSellMenu = nil;
    btnZoneMenu = nil;
}

@end
