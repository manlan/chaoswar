#import "Pointer.h"
#import "GameController.h"
#import "TDBullet.h"
#import "TDTower.h"
#import "TDEnemy.h"
#import "TDFriendly.h"
#import "WayPoint.h"
#import "Wave.h"
#import "AnimateManager.h"
#import "NBSkillButton.h"
#import "GameBackgroundScene.h"
#import "GameImfomationScene.h"
#import "GameMagicScene.h"
#import "GameControllerScene.h"
#import "GameHintScene.h"

@implementation Pointer

@synthesize waveArray = _waveArray;
@synthesize tipsArray = _tipsArray;
@synthesize waveGold = _waveGold;
@synthesize waveMinusGold = _waveMinusGold;
@synthesize pointerNum = _pointerNum;

- (void) initController
{

}

- (void) initAnimate
{
    [animateManager initBoss01];
    [animateManager initBoss02];
    [animateManager initFly01];
    [animateManager initFly02];
    [animateManager initFly03];
    [animateManager initShooter01];
    [animateManager initMagic01];
    [animateManager initMagic02];
    [animateManager initFoot01];
    [animateManager initFoot02];
    [animateManager initFoot03];
    [animateManager initFoot04];
    [animateManager initFoot05];
    [animateManager initFoot06];
    [animateManager initFoot07];
    [animateManager initFoot08];
    [animateManager initFoot09];
    [animateManager initFoot10];
    [animateManager initFoot11];
    [animateManager initFoot12];
    [animateManager initFoot13];
    [animateManager initFoot14];
    [animateManager initFoot15];
    [animateManager initFoot16];
    [animateManager initDefenceTower01];
    [animateManager initDefenceTower02];
    [animateManager initDefenceTower03];
    [animateManager initTurretTower01];
    [animateManager initTurretTower02];
    [animateManager initTurretTower03];
    [animateManager initTurretBullet];
    [animateManager initMagicTower01];
    [animateManager initMagicTower02];
    [animateManager initMagicTower03];
    [animateManager initMagicFriendly01];
    [animateManager initForeverFriendly01];
    [animateManager initMagicFire];
    [animateManager initMagicThunder];
    [animateManager initMagicStone];
    [animateManager initAllEffect];
}

- (CCAnimation*) getAnimation:(NSString*)animationName
{
    return [animateManager getAnimation:animationName];
}

- (void) addTower:(NSMutableArray*)a t:(TDTower*)t p:(CGPoint)p s:(CGPoint)s
{
    GameController *gc = [GameController getGameController];
    t.searchPoint = s;
    t.anchorPoint = ccp(0.5, 0);
    [gc.gameBackground addChild:t z:100];
    t.position = p;
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

- (void) prepareEndPoint:(ccTime)dt
{
    [[CCScheduler sharedScheduler] scheduleSelector:@selector(endPointReady:) forTarget:self interval:dt paused:NO];
}

- (void) prepareEndGame:(ccTime)dt
{
    [[CCScheduler sharedScheduler] scheduleSelector:@selector(endGameReady:) forTarget:self interval:dt paused:NO];
}

- (void) nextWaveReady:(ccTime)dt
{
    [[CCScheduler sharedScheduler] unscheduleSelector:@selector(nextWaveReady:) forTarget:self];
    [self doAutoNextWave];
    GameController *gc = [GameController getGameController];
	gc.canNext = YES;
    [gc setGameStatus];
}

- (void) endPointReady:(ccTime)dt
{
    [[CCScheduler sharedScheduler] unscheduleSelector:@selector(endPointReady:) forTarget:self];
    [[CCScheduler sharedScheduler] scheduleSelector:@selector(doEndPointReady:) forTarget:self interval:1.5 paused:NO];
}

- (void) endGameReady:(ccTime)dt
{
    [[CCScheduler sharedScheduler] unscheduleSelector:@selector(endGameReady:) forTarget:self];
    [[CCScheduler sharedScheduler] scheduleSelector:@selector(doEndGameReady:) forTarget:self interval:1.5 paused:NO];
}

- (void) doEndPointReady:(ccTime)dt
{
    GameController *gc = [GameController getGameController];
    if ([gc.enemyArray count] == 0) {
        [[CCScheduler sharedScheduler] unscheduleSelector:@selector(doEndPointReady:) forTarget:self];
        //弹出过关界面
    }
}

- (void) doEndGameReady:(ccTime)dt
{
    GameController *gc = [GameController getGameController];
    if ([gc.enemyArray count] == 0) {
        [[CCScheduler sharedScheduler] unscheduleSelector:@selector(endGameReady:) forTarget:self];
        //弹出通关界面
    }
}

- (void) addWaveTip:(CGPoint)pos
{
    CCSprite *s = [CCSprite spriteWithFile:@"enemyPoint.png"];
    GameController *gc = [GameController getGameController];
    s.position = pos;
    s.scale = 0.5;
    [gc.gameBackground addChild:s z:2000];
    [_tipsArray addObject:s];
}

- (void) autoNextWave:(ccTime)dt mustGold:(int)mustGold addGold:(int)addGold
{
    _waveGold = mustGold + addGold * dt;
    _waveMinusGold = addGold;
    [[CCScheduler sharedScheduler] scheduleSelector:@selector(minusNextWave:) forTarget:self interval:1 paused:NO];
    GameController *gc = [GameController getGameController];
    [gc.gameMagic.btnGo doProgress:dt from:100 to:0 t:self s:@selector(doNextWave:)];
    [gc.gameMagic.btnGo setIsEnabled:YES];
}

- (void) minusNextWave:(ccTime)dt
{
    _waveGold = _waveGold - _waveMinusGold;
}

- (void) doNextWave:(ccTime)dt
{
    GameController *gc = [GameController getGameController];
    [gc.gameMagic.btnGo stopAllActions];
    [gc startNextWave];
    [gc setGameStatus];
    [[CCScheduler sharedScheduler] unscheduleSelector:@selector(minusNextWave:) forTarget:self];
    [[CCScheduler sharedScheduler] unscheduleSelector:@selector(doNextWave:) forTarget:self];
}

- (void) endThisPoint:(ccTime)dt
{

}

- (void) doAutoNextWave
{
    
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
    for (CCSprite *s in _tipsArray) {
        [s removeFromParentAndCleanup:YES];
    }
    [_tipsArray removeAllObjects];
    GameController *gc = [GameController getGameController];
    gc.currentGold = gc.currentGold + _waveGold;
    _waveGold = 0;
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
        _tipsArray = [[NSMutableArray alloc] init];
        _waveGold = 0;
        _pointerNum = 0;
        animateManager = [[AnimateManager alloc] init];
        GameController *gc = [GameController getGameController];
        animateManager.parentScene = gc.gameBackground;
	}
	return self;
}

- (void)dealloc {
    [self stopController];
    [_waveArray release];
    [_tipsArray release];
    [animateManager release];
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
    for (CCSprite *s in _tipsArray) {
        [s removeFromParentAndCleanup:YES];
    }
    [_tipsArray removeAllObjects];
}

@end
