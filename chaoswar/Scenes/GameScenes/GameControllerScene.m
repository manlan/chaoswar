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
    
    if (gc.currentGold < _build1Gold) {
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
    
    if (gc.currentGold < _build2Gold) {
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
    
    if (gc.currentGold < _build3Gold) {
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
    
    if (gc.currentGold < _build4Gold) {
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
    
    if (gc.currentGold < _updateGold) {
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

-(int)build1Gold
{
    return _build1Gold;
}

-(void)setBuild1Gold:(int)bg
{
    _build1Gold = bg;
    [[GameController getGameController] setGameStatus];
}

-(int)build2Gold
{
    return _build2Gold;
}

-(void)setBuild2Gold:(int)bg
{
    _build2Gold = bg;
    [[GameController getGameController] setGameStatus];
}

-(int)build3Gold
{
    return _build3Gold;
}

-(void)setBuild3Gold:(int)bg
{
    _build3Gold = bg;
    [[GameController getGameController] setGameStatus];
}

-(int)build4Gold
{
    return _build4Gold;
}

-(void)setBuild4Gold:(int)bg
{
    _build4Gold = bg;
    [[GameController getGameController] setGameStatus];
}

-(int)updateGold
{
    return _build1Gold;
}

-(void)setUpdateGold:(int)ug
{
    _updateGold = ug;
    [[GameController getGameController] setGameStatus];
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
