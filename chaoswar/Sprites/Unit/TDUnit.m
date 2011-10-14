//
//  TDUnit.m
//  chaoswar
//
//  Created by Mac on 11-10-9.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TDUnit.h"
#import "GameController.h"

@implementation TDUnit

@synthesize maxMP;
@synthesize currentMP;
@synthesize moveSpeed;
@synthesize searchRange;
@synthesize attact;
@synthesize attactMode;
@synthesize attactRange;
@synthesize attacttime;
@synthesize defence;
@synthesize defenceMode;
@synthesize mvuAni;
@synthesize mvdAni;
@synthesize mvlAni;
@synthesize mvrAni;
@synthesize ddAni;

-(id) init
{
	if( (self=[super init])) {
        self.showBlood = YES;
	}
	return self;
}

- (void) beAttact:(TDSprite*)s an:(int)an at:(TAcctactType)at
{
    self.currentHP = self.currentHP - an;
    if (self.currentHP < 0) self.currentHP = 0;
    if (self.currentHP == 0) {
        s.killNum++;
        self.isDelete = 2;
        [self stopAllActions];        
        id actionDead = [CCAnimate actionWithAnimation:self.ddAni restoreOriginalFrame:NO];
        id actionDeadDone = [CCCallFuncN actionWithTarget:self selector:@selector(afterDead:)];
        [self runAction:[CCSequence actions:actionDead, actionDeadDone, nil]];
    }
        
}

-(void) afterDead:(id)sender {
    GameController *gc = [GameController getGameController];
    self.isDelete = 1;
    gc.currentGold = gc.currentGold + self.getGold;
    [self removeFromParentAndCleanup:YES];
}

@end
