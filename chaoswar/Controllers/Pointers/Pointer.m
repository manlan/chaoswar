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
    CGSize size = [[CCDirector sharedDirector] winSize];
    GameController *gc = [GameController getGameController];
    t.position = p;
    t.anchorPoint = ccp(0.5, 0);
    [gc.gameBackground addChild:t z:size.height - p.y + 100];
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

- (void) endThisPoint:(ccTime)dt
{

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
    [self stopController];
    [_waveArray release];
	[super dealloc];
}

- (BOOL) isWhite:(CGPoint)point
{
    return YES;
}

- (void) stopController
{
    [[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:self];
    for (int i = 0; i < [_waveArray count]; i++) {
        Wave *wave = (Wave*) [_waveArray objectAtIndex:i];
        [wave stopWave];
    }
    [_waveArray removeAllObjects];
}

@end
