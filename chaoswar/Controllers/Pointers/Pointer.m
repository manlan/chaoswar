//
//  Pointer.m
//  chaoswar
//
//  Created by Mac on 11-9-30.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Pointer.h"
#import "GameController.h"
#import "TDBullet.h"
#import "TDTower.h"
#import "TDEnemy.h"
#import "TDFriendly.h"
#import "WayPoint.h"
#import "Wave.h"
#import "GameBackgroundScene.h"
#import "GameImfomationScene.h"
#import "GameMagicScene.h"
#import "GameControllerScene.h"
#import "GameHintScene.h"

@implementation Pointer

@synthesize waveArray = _waveArray;

- (void) initController
{

}

- (void) initAnimate
{
	
}

- (void) addTower:(NSMutableArray*)a t:(TDTower*)t p:(CGPoint)p
{
    GameController *gc = [GameController getGameController];
    t.bottomPoint = p;
    t.position = ccp(p.x, p.y + t.contentSize.height / 2);
    [gc.gameBackground addChild:t z:TOWER_BUILDING_Z];
    [t run];
    [a addObject:t];
}

- (void) runWave:(float)b e:(TEnemyType)e s:(float)s t:(int)t wy:(NSMutableArray*)wy
{
    [_waveArray addObject:[Wave runWave:b e:e s:s t:t wy:wy]];
}

- (void) prepareNextWave:(ccTime)dt
{
    [[CCScheduler sharedScheduler] scheduleSelector:@selector(nextWaveReady:) forTarget:self interval:dt paused:NO];
}

- (void) nextWaveReady:(ccTime)dt
{
    [[CCScheduler sharedScheduler] unscheduleSelector:@selector(nextWaveReady:) forTarget:self];
    GameController *gc = [GameController getGameController];
	gc.canNext = YES;
    [gc setGameStatus];
}

- (void) initEnemy:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (void) initTower:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (BOOL) runWaves:(int)wave
{
    return YES;
}

- (void) initBullety:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (void) initWayPoint:(WayManager*)manager
{
    //
}

- (void) initFriendly:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (id) init
{
	if ((self = [super init])) {
        _waveArray = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)dealloc {
    for (int i = 0; i < [_waveArray count]; i++) {
        Wave *wave = (Wave*) [_waveArray objectAtIndex:i];
        [[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:wave];
    }
    [_waveArray removeAllObjects];
    [_waveArray release];
    [[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:self];
	[super dealloc];
}

@end
