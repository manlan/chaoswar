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
	return _sharedController;
}

+ (void) initGameController
{
    if (!_sharedController) {
		_sharedController = [[self alloc] init];
	}
	if (_sharedController) {
		[_sharedController initScene];
	}
}

+ (void) releaseGameController
{
	if (_sharedController) {
		[_sharedController release];
        _sharedController = nil;
	}
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
    [self releaseScene];
    [self init];
    [self start];
}

- (void) doMagicFire:(CGPoint)point
{
    CGPoint pt1t = point;
    CGPoint pt2t = ccp(point.x - 15, point.y - 15);
    CGPoint pt3t = ccp(point.x + 15, point.y + 15);
    CGPoint pt1o = ccp(pt1t.x, pt1t.y + 100);
    CGPoint pt2o = ccp(pt2t.x, pt2t.y + 100);
    CGPoint pt3o = ccp(pt3t.x, pt3t.y + 100);
	TDFireBullet1 *b1 = [TDFireBullet1 getSprite];
    b1.firePoint = pt1t;
    b1.position = pt1o;
    TDFireBullet1 *b2 = [TDFireBullet1 getSprite];
    b2.firePoint = pt2t;
    b2.position = pt2o;
    TDFireBullet1 *b3 = [TDFireBullet1 getSprite];
    b3.firePoint = pt3t;
    b3.position = pt3o;
    [self.gameBackground addChild:b1 z:60];
    [self.gameBackground addChild:b2 z:60];
    [self.gameBackground addChild:b3 z:60];
    [self.bulletArray addObject:b1];
    [self.bulletArray addObject:b2];
    [self.bulletArray addObject:b3];
    [b1 run];
    [b2 run];
    [b3 run];
}

- (void) doMagicFriendly:(CGPoint)point
{
    CGPoint pt1 = point;
    CGPoint pt2 = ccp(point.x - 15, point.y - 15);
    CGPoint pt3 = ccp(point.x + 15, point.y + 15);
	TDMagicFriendly1 *b1 = [TDMagicFriendly1 getSprite];
    b1.position = pt1;
    TDMagicFriendly1 *b2 = [TDMagicFriendly1 getSprite];
    b2.position = pt2;
    TDMagicFriendly1 *b3 = [TDMagicFriendly1 getSprite];
    b3.position = pt3;
    [self.gameBackground addChild:b1 z:60];
    [self.gameBackground addChild:b2 z:60];
    [self.gameBackground addChild:b3 z:60];
    [self.frientlyArray addObject:b1];
    [self.frientlyArray addObject:b2];
    [self.frientlyArray addObject:b3];
    [b1 run];
    [b2 run];
    [b3 run];
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

- (void) initScene
{
    [_enemyArray removeAllObjects];
    [_towerArray removeAllObjects];
    [_bulletArray removeAllObjects];
    [_frientlyArray removeAllObjects];
    [_wayManager removeAllWay];
    _maxWave = 0;
    _currentWave = 0;
    _currentHealth = 0;
    _currentGold = 0;
    _screenClickType = SCT_ALL;
    _operateType = OT_NORMAL;
    _mapType = MT_GREEN;
    _canNext = NO;   
}

- (void) releaseScene
{
    [_pt stopController];
    NSMutableArray *tempEnemyArray = [NSMutableArray arrayWithArray:_enemyArray];
    for (TDEnemy *en in tempEnemyArray) en.spriteStatus = TSS_DEAD;
    NSMutableArray *tempTowerArray = [NSMutableArray arrayWithArray:_towerArray];
    for (TDTower *to in tempTowerArray) to.spriteStatus = TSS_DEAD;
    NSMutableArray *tempBulletArray = [NSMutableArray arrayWithArray:_bulletArray];
    for (TDBullet *bu in tempBulletArray) bu.spriteStatus = TSS_DEAD;
    NSMutableArray *tempFrientlyArray = [NSMutableArray arrayWithArray:_frientlyArray];
    for (TDFriendly *fr in tempFrientlyArray) fr.spriteStatus = TSS_DEAD;
    [_enemyArray removeAllObjects];
    [_towerArray removeAllObjects];
    [_bulletArray removeAllObjects];
    [_frientlyArray removeAllObjects];
    [_wayManager removeAllWay];
    
    _maxWave = 0;
    _currentWave = 0;
    _currentHealth = 0;
    _currentGold = 0;
    _screenClickType = SCT_ALL;
    _operateType = OT_NORMAL;
    _mapType = MT_GREEN;
    _canNext = NO;    
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

- (void)dealloc {
    [self releaseScene];
    [_enemyArray release];
    [_towerArray release];
    [_bulletArray release];
    [_frientlyArray release];
    [_wayManager release];
    [_pt release];
    _gameBackground = nil;
    _gameImfomation = nil;
    _gameMagic = nil;
    _gameController = nil;
    _gameHint = nil;
	[super dealloc];
}

@end
