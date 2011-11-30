#import "Pointer.h"
#import "SimpleAudioEngine.h"
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
#import "SelectSence.h"
#import "SceneManager.h"
#import "DataController.h"

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
    CGSize size = [[CCDirector sharedDirector] winSize];
    t.searchPoint = s;
    t.anchorPoint = ccp(0.5, 0);
    t.position = p;
    [gc.gameBackground addChild:t z:size.height - t.position.y + 100];
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
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"winBg.wav" loop:NO];
        [[CCScheduler sharedScheduler] unscheduleSelector:@selector(doEndPointReady:) forTarget:self];
        [[CCDirector sharedDirector] pause];
        GameController *gc = [GameController getGameController];
        [gc.gameHint removeAllChildrenWithCleanup:YES];
        //背景
        CCSprite *winBg = [CCSprite spriteWithFile:@"winBg.png"];
        winBg.position = ccp(240 , 175);
        [gc.gameHint addChild:winBg z:100];
        
        //按钮
        CCMenuItemImage *btnWin = [CCMenuItemImage itemFromNormalImage:@"btnWin.png" selectedImage:@"btnWin.png" disabledImage:@"btnWin.png"  target:self selector:@selector(winAndEnd:)];
        CCMenu *btnWinMenu = [CCMenu menuWithItems:btnWin, nil];
        btnWinMenu.position = ccp(240 , 110);
        [gc.gameHint addChild:btnWinMenu z:101];
        
        //评价
        int score = 0;
        if (gc.currentHealth < 10) {
            score = 1;
        } else if (gc.currentHealth < 18) {
            score = 2;
        } else {
            score = 3;
        }
        
        //        CCSprite *xing;
        //        int y = 200;
        //        for (int i= 1; i <= score; i++) {
        //            xing = [CCSprite spriteWithFile:@"bigStar.png"];
        //            xing.position = ccp(y , 155);
        //            [gc.gameHint addChild:xing z:101];
        //            y= y+40;
        //        }
		
		int y = 200;
        
        for (int i= 1; i <= score; i++) {
            CCSpriteBatchNode *spritebatchBigStar;
            CCSprite *spriteBigStar;
            CCAnimation *animationBigStar;
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"bigStarSheet.plist"];
            spritebatchBigStar = [CCSpriteBatchNode batchNodeWithFile:@"bigStarSheet.png"];
            [gc.gameHint addChild:spritebatchBigStar z:101];
            
            NSMutableArray *animFramesBigStar = [NSMutableArray array];
            for(int i = 1; i < 6; i++) {
                CCSpriteFrame *frameBigStar = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"bigStar%04d.png",i]];
                if (i==1) {
                    spriteBigStar = [[CCSprite alloc] initWithSpriteFrame:frameBigStar];
                }
                [animFramesBigStar addObject:frameBigStar];
            }
            animationBigStar = [CCAnimation animationWithFrames:animFramesBigStar delay:0.05f];
            [spritebatchBigStar addChild:spriteBigStar];
            [spriteBigStar release];
            spriteBigStar.position = ccp(y , 155);
            [spriteBigStar runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:1.5 animation:animationBigStar restoreOriginalFrame:NO] ]];
            
            y= y+40;
        }
		
        [gc setGameStatus];
    }
}

-(void) winAndEnd:(id) sender 
{
    [[CCDirector sharedDirector] resume];
    GameController *gc = [GameController getGameController];
    [gc stopGame];
    //更新得分和开通下关关卡
    int score = 0;
    if (gc.currentHealth < 10) {
        score = 1;
    } else if (gc.currentHealth < 18) {
        score = 2;
    } else {
        score = 3;
    }
    
    [DataController setSelect:gc.ptNum s:score];
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"mainBg.mp3"];
	[[CCDirector sharedDirector] replaceScene: [SceneManager TransFade:0.56f scene:[SelectSence scene]]];
}

- (void) doEndGameReady:(ccTime)dt
{
    GameController *gc = [GameController getGameController];
    if ([gc.enemyArray count] == 0) {
        [[CCScheduler sharedScheduler] unscheduleSelector:@selector(endGameReady:) forTarget:self];
        [[CCDirector sharedDirector] pause];
        GameController *gc = [GameController getGameController];
        //背景
        CCSprite *winBg = [CCSprite spriteWithFile:@"winBg.png"];
        winBg.position = ccp(240 , 175);
        [gc.gameHint addChild:winBg z:100];
        
        //菜单
        CCMenuItemImage *btnWin = [CCMenuItemImage itemFromNormalImage:@"btnWin.png" selectedImage:@"btnWin.png" disabledImage:@"btnWin.png"  target:self selector:@selector(winAndGameEnd:)];
        CCMenu *btnWinMenu = [CCMenu menuWithItems:btnWin, nil];
        btnWinMenu.position = ccp(240 , 110);
        [gc.gameHint addChild:btnWinMenu z:101];
        
        [gc setGameStatus];
    }
}

-(void) winAndGameEnd:(id) sender 
{
    [[CCDirector sharedDirector] resume];
    GameController *gc = [GameController getGameController];
    [gc stopGame];
    //更新得分和开通下关关卡
    int score = 0;
    if (gc.currentHealth < 10) {
        score = 1;
    } else if (gc.currentHealth < 18) {
        score = 2;
    } else {
        score = 3;
    }
    
    [DataController setSelect:gc.ptNum s:score];
	[[CCDirector sharedDirector] replaceScene: [SceneManager TransFade:0.56f scene:[SelectSence scene]]];
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
    [gc.gameMagic.btnGo doProgress:dt from:50 to:0 t:self s:@selector(doNextWave:)];
    [gc.gameMagic.btnGo setIsEnabled:YES];
}

- (void) minusNextWave:(ccTime)dt
{
    _waveGold = _waveGold - _waveMinusGold;
}

- (void) doNextWave:(ccTime)dt
{
    GameController *gc = [GameController getGameController];
    [gc startNextWave];
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
    GameController *gc = [GameController getGameController];
    [gc.gameMagic.btnGo stopAllActions];
    [[CCScheduler sharedScheduler] unscheduleSelector:@selector(minusNextWave:) forTarget:self];
    [[CCScheduler sharedScheduler] unscheduleSelector:@selector(doNextWave:) forTarget:self];
    for (CCSprite *s in _tipsArray) {
        [s removeFromParentAndCleanup:YES];
    }
    [_tipsArray removeAllObjects];
    gc.currentGold = gc.currentGold + _waveGold;
    _waveGold = 0;
    [gc setGameStatus];
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
    self = [super init];
	if (self) {
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
