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

@synthesize btnBuild1 = _btnBuild1;
@synthesize btnBuild2 = _btnBuild2;
@synthesize btnBuild3 = _btnBuild3;
@synthesize btnBuild4 = _btnBuild4;
@synthesize btnUpdate = _btnUpdate;
@synthesize btnSell = _btnSell;
@synthesize btnZone = _btnZone;

-(id) init
{
	if( (self=[super init])) {

	}
	return self;
}

- (void) setBuild1MenuStatus
{
    if (!_btnBuild1) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL) {
        [_btnBuild1 setIsEnabled:NO];
        return;
    }
    
    [_btnBuild1 setIsEnabled:YES];
}

- (void) setBuild2MenuStatus
{
    if (!_btnBuild2) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL) {
        [_btnBuild2 setIsEnabled:NO];
        return;
    }
    
    [_btnBuild2 setIsEnabled:YES];
}

- (void) setBuild3MenuStatus
{
    if (!_btnBuild3) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL) {
        [_btnBuild3 setIsEnabled:NO];
        return;
    }
    
    [_btnBuild3 setIsEnabled:YES];
}

- (void) setBuild4MenuStatus
{
    if (!_btnBuild4) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL) {
        [_btnBuild4 setIsEnabled:NO];
        return;
    }
    
    [_btnBuild4 setIsEnabled:YES];
}

- (void) setUpdateMenuStatus
{
    if (!_btnUpdate) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL) {
        [_btnUpdate setIsEnabled:NO];
        return;
    }
    
    [_btnUpdate setIsEnabled:YES];
}

- (void) setSellMenuStatus
{
    if (!_btnSell) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL) {
        [_btnSell setIsEnabled:NO];
        return;
    }
    
    [_btnSell setIsEnabled:YES];
}

- (void) setZoneMenuStatus
{
    if (!_btnZone) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL && gc.operateType != OT_SETSEARCHPOINT) {
        [_btnZone setIsEnabled:NO];
        return;
    }
    
    [_btnZone setIsEnabled:YES];
}

- (void) clearSceneSrpite
{
    [self removeAllChildrenWithCleanup:YES];
    _btnBuild1= nil;
    _btnBuild2= nil;
    _btnBuild3= nil;
    _btnBuild4= nil;
    _btnUpdate= nil;
    _btnSell= nil;
    _btnZone= nil;
}

@end
