#import "GameController.h"
#import "SpritesImp.h"
#import "Wave.h"
#import "WayPoint.h"
#import "WayManager.h"
#import "GameBackgroundScene.h"
#import "GameImfomationScene.h"
#import "GameMagicScene.h"
#import "GameControllerScene.h"
#import "GameHintScene.h"
#import "Pointer.h"
#import "Pointer1.h"
#import "Pointer2.h"
#import "Pointer3.h"
#import "Pointer4.h"
#import "Pointer5.h"
#import "Pointer6.h"
#import "Pointer7.h"
#import "Pointer8.h"
#import "Pointer9.h"
#import "Pointer10.h"
#import "Pointer11.h"
#import "Pointer12.h"

@implementation GameController

@synthesize gameBackground = _gameBackground;
@synthesize gameImfomation = _gameImfomation;
@synthesize gameMagic = _gameMagic;
@synthesize gameController = _gameController;
@synthesize gameHint = _gameHint;
@synthesize enemyArray = _enemyArray;
@synthesize towerArray = _towerArray;
@synthesize bulletArray = _bulletArray;
@synthesize frientlyArray = _frientlyArray;
@synthesize wayManager = _wayManager;
@synthesize pt = _pt;
@synthesize maxWave = _maxWave;
@synthesize currentWave = _currentWave;
@synthesize currentHealth = _currentHealth;
@synthesize currentGold = _currentGold;
@synthesize screenClickType = _screenClickType;
@synthesize operateType = _operateType;
@synthesize mapType = _mapType;
@synthesize canNext = _canNext;

static GameController *_sharedController = nil;

+ (GameController*) getGameController
{
	if (!_sharedController) {
		_sharedController = [[self alloc] init];
	}
	return _sharedController;
}

+ (void) delGameController
{
	if (_sharedController) {
		[_sharedController release];
        _sharedController = nil;
	}
}

- (id) init
{
	if ((self = [super init])) {
        _enemyArray = [[NSMutableArray alloc] init];
        _towerArray = [[NSMutableArray alloc] init];
        _bulletArray = [[NSMutableArray alloc] init];
        _frientlyArray = [[NSMutableArray alloc] init];
        _wayManager = [[WayManager alloc] init];
	}
	return self;
}

- (Pointer*) getPointer:(int)p
{
	switch (p) {
        case 0:
            return [[Pointer1 alloc] init];
            break;
        case 1:
            return [[Pointer2 alloc] init];
            break;
        case 2:
            return [[Pointer3 alloc] init];
            break;
        case 3:
            return [[Pointer4 alloc] init];
            break;
        case 4:
            return [[Pointer5 alloc] init];
            break;
        case 5:
            return [[Pointer6 alloc] init];
            break;
        case 6:
            return [[Pointer7 alloc] init];
            break;
        case 7:
            return [[Pointer8 alloc] init];
            break;
        case 8:
            return [[Pointer9 alloc] init];
            break;
        case 9:
            return [[Pointer10 alloc] init];
            break;
        case 10:
            return [[Pointer11 alloc] init];
            break;
        case 11:
            return [[Pointer12 alloc] init];
            break;
        default:
            return nil;
            break;
    }
}

- (void) initController:(int)p {
    _pt = [self getPointer:p];
}

- (void) start
{
    self.screenClickType = SCT_ALL;
    self.operateType = OT_NORMAL;
    //=========初始化设置
    [_pt initController];
    //=========初始化动画
    [_pt initAnimate];
    //=========初始化路线
    [_pt initWayPoint:_wayManager];
    //=========初始化塔
    [_pt initTower:_towerArray];
    //=========初始化敌人
    [_pt initEnemy:_enemyArray];
    //=========初始化子弹
    [_pt initBullety:_bulletArray];
    //=========初始化友军
    [_pt initFriendly:_frientlyArray];
}

- (void) restart
{

}

- (void) stopGame
{
    
}

//游戏逻辑（循环）
- (void) setGameStatus {
	// 设置当前金额，波数等信息
    [_gameImfomation setPauseMenuStatus];
	// 控制法术按钮及下一波按钮的状态
    [_gameMagic setGoMenuStatus];
    [_gameMagic setMagic1MenuStatus];
    [_gameMagic setMagic2MenuStatus];
    [_gameMagic setMagic3MenuStatus];
    [_gameMagic setMagic4MenuStatus];
    // 控制建造按钮及其他操作按钮的状态
    [_gameController setBuild1MenuStatus];
    [_gameController setBuild2MenuStatus];
    [_gameController setBuild3MenuStatus];
    [_gameController setBuild4MenuStatus];
    [_gameController setUpdateMenuStatus];
    [_gameController setSellMenuStatus];
    [_gameController setZoneMenuStatus];
}

- (void) startNextWave
{
    if ([_pt runWaves:_currentWave + 1]) {
        self.currentWave++;
    }
}

- (void)dealloc {
    [_enemyArray removeAllObjects];
    [_towerArray removeAllObjects];
    [_bulletArray removeAllObjects];
    [_frientlyArray removeAllObjects];
    [_enemyArray release];
    [_towerArray release];
    [_bulletArray release];
    [_wayManager release];
    [_frientlyArray release];
    [_pt release];
    _enemyArray = nil;
    _towerArray = nil;
    _bulletArray = nil;
    _frientlyArray = nil;
    _wayManager = nil;
    _pt = nil;
	[super dealloc];
}

- (void) setMaxWave:(int)maxWave
{
    _maxWave = maxWave;
    [_gameImfomation setWaveValue];
}

- (void) setCurrentWave:(int)currentWave
{
    _currentWave = currentWave;
    [_gameImfomation setWaveValue];
}

- (void) setCurrentHealth:(int)currentHealth
{
    _currentHealth = currentHealth;
    [_gameImfomation setEnemyNumValue];
}

- (void) setCurrentGold:(int)currentGold
{
    _currentGold = currentGold;
    [_gameImfomation setGoldValue];
}

@end
