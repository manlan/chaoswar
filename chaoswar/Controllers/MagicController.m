//
//  MagicController.m
//  chaoswar
//
//  Created by Swimming on 11-11-13.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MagicController.h"
#import "GameController.h"

@implementation MagicC

@synthesize startTime = _startTime;

- (id)init 
{
    self = [super init];
    if (self) {
        _startTime = 0;
    }
    return self;
}

- (void) run
{
    [[CCScheduler sharedScheduler] scheduleSelector:@selector(startMagic:) forTarget:self interval:_startTime paused:NO];
}

- (void) startMagic:(ccTime)dt
{

}

@end

@implementation FireController

@synthesize position = _position;

+ (FireController*) getFireController:(float)st pos:(CGPoint)pos
{
    FireController *fc = [[[FireController alloc] init] autorelease];
    fc.startTime = st;
    fc.position = pos;
    return fc;
}

- (void) startMagic:(ccTime)dt
{
    [[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:self];
    GameController *gc = [GameController getGameController];
    CGPoint posFrom = ccpAdd(_position, ccp(0, 100));
	TDFireBullet1 *b = [TDFireBullet1 getSprite];
    b.firePoint = _position;
    b.position = posFrom;
    [gc.gameBackground addChild:b z:5000];
    [gc.bulletArray addObject:b];
    [b run];
}

@end

@implementation FriendlyController

@synthesize position = _position;

+ (FriendlyController*) getFriendlyController:(float)st pos:(CGPoint)pos
{
    FriendlyController *fc = [[[FriendlyController alloc] init] autorelease];
    fc.startTime = st;
    fc.position = pos;
    return fc;
}

- (void) startMagic:(ccTime)dt
{
    [[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:self];
    GameController *gc = [GameController getGameController];
	TDMagicFriendly1 *b = [TDMagicFriendly1 getSprite];
    b.anchorPoint = ccp(0.5, 0);
    [gc.gameBackground addChild:b z:60];
    [gc.frientlyArray addObject:b];
    b.position = _position;
    b.searchPoint = b.position;
    [b run];
}

@end

@implementation ThunderController

@synthesize enemy = _enemy;

- (void) startMagic:(ccTime)dt
{
    
}

@end

@implementation StoneController

@synthesize enemy = _enemy;

- (void) startMagic:(ccTime)dt
{
    
}

@end

@implementation MagicController

@synthesize unit = _unit;

- (id)init 
{
    self = [super init];
    if (self) {
        stopController = [[StopController alloc] init];
        speedController = [[SpeedController alloc] init];
        lifeController = [[LifeController alloc] init];
    }
    return self;
}

- (void)dealloc {
    [stopController release];
    [speedController release];
    [lifeController release];
    [super dealloc];
}

- (void) doMagicStopStatus {
    if (_unit) {
        [stopController doMagic:_unit];
    }
}

- (void) doMagicSpeedStatus {
    if (_unit) {
        [speedController doMagic:_unit];
    }
}

- (void) doMagicLifeStatus {
    if (_unit) {
        [lifeController doMagic:_unit];
    }
}

@end

@implementation StopController

- (id)init {
    self = [super init];
    if (self) {
        magicSprite = [[CCSprite node] retain];
    }
    return self;
}

- (void)dealloc {
    [[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:self];
    [magicSprite removeFromParentAndCleanup:YES];
    [magicSprite release];
    [super dealloc];
}

- (void) doMagic:(TDUnit*)u {
    unit = u;
    GameController *gc = [GameController getGameController];
    [[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:self];
    [magicSprite removeFromParentAndCleanup:YES];
    unit.canSchedule = NO;
    [unit stopAllActions];
    id actionStop = [CCAnimate actionWithDuration:8 animation:[gc getAnimation:@"mcef03"] restoreOriginalFrame:NO];
	id actionAfterStop = [CCCallFuncN actionWithTarget:self selector:@selector(afterMagicStopStatus:)];
    magicSprite.position = ccp(unit.contentSize.width / 2, unit.contentSize.height + 2);
    [magicSprite setVisible:YES];
    [unit addChild:magicSprite z:5];
	[magicSprite runAction:[CCSequence actions:actionStop, actionAfterStop, nil]];
    [unit doUnitLogic];
}

- (void) afterMagicStopStatus:(id)sender {
    unit.canSchedule = YES;
    [[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:self];
    [magicSprite stopAllActions];
    [magicSprite removeFromParentAndCleanup:YES];
    [unit doUnitLogic];
}

@end

@implementation SpeedController

- (id)init {
    self = [super init];
    if (self) {
        magicSprite = [[CCSprite node] retain];
    }
    return self;
}

- (void)dealloc {
    [[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:self];
    [magicSprite removeFromParentAndCleanup:YES];
    [magicSprite release];
    [super dealloc];
}

- (void) doMagic:(TDUnit*)u {
    unit = u;
    GameController *gc = [GameController getGameController];
    [[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:self];
    [magicSprite removeFromParentAndCleanup:YES];
    unit.speedUPNum = 1.5;
    [unit stopAllActions];
    id actionSpeedEffect = [CCAnimate actionWithAnimation:[gc getAnimation:@"mcef01"] restoreOriginalFrame:NO];
	id actionAfterSpeed = [CCHide action];
    [[CCScheduler sharedScheduler] scheduleSelector:@selector(afterMagicSpeedStatus:) forTarget:self interval:5 paused:NO];
    magicSprite.position = ccp(unit.contentSize.width / 2, unit.contentSize.height + 2);
    [magicSprite setVisible:YES];
    [unit addChild:magicSprite z:5];
	[magicSprite runAction:[CCSequence actions:actionSpeedEffect, actionAfterSpeed, nil]];
    [unit doUnitLogic];
}

- (void) afterMagicSpeedStatus:(ccTime)dt {
    unit.speedUPNum = 1;
    [[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:self];
    [magicSprite stopAllActions];
    [magicSprite removeAllChildrenWithCleanup:YES];
    [unit doUnitLogic];
}

@end

@implementation LifeController

- (id)init {
    self = [super init];
    if (self) {
        magicSprite = [[CCSprite node] retain];
    }
    return self;
}

- (void)dealloc {
    [[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:self];
    [magicSprite removeFromParentAndCleanup:YES];
    [magicSprite release];
    [super dealloc];
}

- (void) doMagic:(TDUnit*)u {
    unit = u;
    GameController *gc = [GameController getGameController];
    [[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:self];
    [magicSprite removeFromParentAndCleanup:YES];
    unit.currentHP = unit.currentHP + 20;
    if (unit.currentHP > unit.maxHP) {
        unit.currentHP = unit.maxHP;
    }
    [unit stopAllActions];
    id actionLifeEffect = [CCAnimate actionWithAnimation:[gc getAnimation:@"mcef02"] restoreOriginalFrame:NO];
	id actionAfterSpeed = [CCHide action];
    [[CCScheduler sharedScheduler] scheduleSelector:@selector(afterMagicSpeedStatus:) forTarget:self interval:2 paused:NO];
    magicSprite.position = ccp(unit.contentSize.width / 2, 0);
    [magicSprite setVisible:YES];
    [unit addChild:magicSprite z:5];
	[magicSprite runAction:[CCSequence actions:actionLifeEffect, actionAfterSpeed, nil]];
    [unit doUnitLogic];
}

- (void) afterMagicLifeStatus:(id)sender {
    [[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:self];
    [magicSprite stopAllActions];
    [magicSprite removeAllChildrenWithCleanup:YES];
    [unit doUnitLogic];
}

@end
