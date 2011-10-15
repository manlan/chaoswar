//
//  GameController.m
//  chaoswar
//
//  Created by Mac on 11-9-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "GameController.h"
#import "SpritesImp.h"
#import "Wave.h"
#import "WayPoint.h"
#import "Pointer.h"
#import "WayManager.h"
#import "GameBackgroundScene.h"
#import "GameImfomationScene.h"
#import "GameMagicScene.h"
#import "GameControllerScene.h"
#import "GameHintScene.h"

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
        _wayManager = [[WayManager alloc] init];
        _frientlyArray = [[NSMutableArray alloc] init];
		self.screenClickType = SCT_ALL;
		self.operateType = OT_NORMAL;
	}
	return self;
}

- (void) initController:(Pointer*)pointer {
    self.pt = pointer;
    //=========初始化设置
    [self.pt initController];
    //=========初始化动画
    [self.pt initAnimate];
    //=========初始化路线
    [self.pt initWayPoint:_wayManager];
    //=========初始化塔
    [self.pt initTower:_towerArray];
    //=========初始化敌人
    [self.pt initEnemy:_enemyArray];
    //=========初始化子弹
    [self.pt initBullety:_bulletArray];
    //=========初始化友军
    [self.pt initFriendly:_frientlyArray];
}

- (void) start
{

}

- (void) restart
{

}

- (void) startNextWave
{
    if ([_pt runWaves:_currentWave + 1]) {
        self.currentWave++;
    }
}

- (void) deleteUnUseSprite:(CCLayer*)scene
{
    NSMutableArray *enemyDeleteArray = [[NSMutableArray alloc] init];
	NSMutableArray *towerDeleteArray = [[NSMutableArray alloc] init];	
	NSMutableArray *bulletDeleteArray = [[NSMutableArray alloc] init];
    NSMutableArray *frientlyDeleteArray = [[NSMutableArray alloc] init];
	for (TDEnemy *en1 in _enemyArray) {
        if (en1.isDelete == YES) {
            [enemyDeleteArray addObject:en1];
        }
	}
    for (TDEnemy *en2 in enemyDeleteArray) {
        [_enemyArray removeObject:en2];
        [scene removeChild:en2 cleanup:YES];									
    }
    for (TDTower *to1 in _towerArray) {
        if (to1.isDelete == YES) {
            [towerDeleteArray addObject:to1];
        }
	}
    for (TDTower *to2 in towerDeleteArray) {
        [_towerArray removeObject:to2];
        [scene removeChild:to2 cleanup:YES];									
    }
    for (TDBullet *bu1 in _bulletArray) {
        if (bu1.isDelete == YES) {
            [bulletDeleteArray addObject:bu1];
        }
	}
    for (TDBullet *bu2 in bulletDeleteArray) {
        [_bulletArray removeObject:bu2];
        [scene removeChild:bu2 cleanup:YES];									
    }
    for (TDFriendly *fr1 in _frientlyArray) {
        if (fr1.isDelete == YES) {
            [frientlyDeleteArray addObject:fr1];
        }
	}
    for (TDFriendly *fr2 in frientlyDeleteArray) {
        [_frientlyArray removeObject:fr2];
        [scene removeChild:fr2 cleanup:YES];									
    }
    [enemyDeleteArray removeAllObjects];
	[towerDeleteArray removeAllObjects];
	[bulletDeleteArray removeAllObjects];
    [frientlyDeleteArray removeAllObjects];
    [enemyDeleteArray release];
	[towerDeleteArray release];
	[bulletDeleteArray release];
    [frientlyDeleteArray release];
}

//游戏逻辑（循环）
- (void) setGameStatus {
	// 设置当前金额，波数等信息
    [_gameImfomation setPauseMenuStatus];
	//gameMagic.btnRestartMenu = 
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
    _enemyArray = nil;
    _towerArray = nil;
    _bulletArray = nil;
    _wayManager = nil;
    _frientlyArray = nil;
	[super dealloc];
}

@end
