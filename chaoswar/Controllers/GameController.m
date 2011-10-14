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

@synthesize gameBackground;
@synthesize gameImfomation;	
@synthesize gameMagic;
@synthesize gameController;
@synthesize gameHint;
@synthesize enemyArray;
@synthesize towerArray;
@synthesize waveArray;	
@synthesize bulletArray;	
@synthesize wayManager;
@synthesize magicArray;
@synthesize frientlyArray;
@synthesize gestureRecognizer;
@synthesize pt;
@synthesize maxWave;
@synthesize currentWave;
@synthesize currentHealth;
@synthesize currentGold;
@synthesize screenClickType;
@synthesize operateType;
@synthesize mapType;
@synthesize canNext;

static GameController *_sharedController = nil;

+ (GameController*) getGameController
{
	if (!_sharedController) {
		_sharedController = [[self alloc] init];
	}
	return _sharedController;
}

- (id) init
{
	if ((self = [super init])) {
        self.enemyArray = [[NSMutableArray alloc] init];
        self.towerArray = [[NSMutableArray alloc] init];
        self.waveArray = [[NSMutableArray alloc] init];
        self.bulletArray = [[NSMutableArray alloc] init];
        self.wayManager = [[WayManager alloc] init];
        self.magicArray = [[NSMutableArray alloc] init];
        self.frientlyArray = [[NSMutableArray alloc] init];
		self.screenClickType = SCT_ALL;
		self.operateType = OT_NORMAL;
	}
	return self;
}

- (void) initController:(Pointer*)pointer {
    pt = pointer;
    maxWave = 7;
    currentWave = 7;
    currentHealth = 20;
    currentGold = 320;
    [self.pt initController];
    
    [self.pt initAnimate];
    //=========初始化路线
    [self.pt initWayPoint:wayManager];
//    //=========初始化出兵顺序
//    [pt initWave:waveArray];
    //=========初始化塔
    [self.pt initTower:towerArray];
    //=========初始化敌人
    [self.pt initEnemy:enemyArray];
    //=========初始化子弹
    [self.pt initBullety:bulletArray];
    //=========初始化魔法
    [self.pt initMagic:magicArray];
    //=========初始化友军
    [self.pt initFriendly:frientlyArray];
}

- (void) start
{

}

- (void) restart
{

}

- (void) startNextWave
{
	if ([self.pt runWaves:self.currentWave + 1]) {
		self.currentWave++;
	}
}

- (void) deleteUnUseSprite:(CCLayer*)scene
{
    NSMutableArray *enemyDeleteArray = [[NSMutableArray alloc] init];
	NSMutableArray *towerDeleteArray = [[NSMutableArray alloc] init];	
	NSMutableArray *bulletDeleteArray = [[NSMutableArray alloc] init];
    NSMutableArray *frientlyDeleteArray = [[NSMutableArray alloc] init];
	for (TDEnemy *en1 in self.enemyArray) {
        if (en1.isDelete == YES) {
            [enemyDeleteArray addObject:en1];
        }
	}
    for (TDEnemy *en2 in enemyDeleteArray) {
        [self.enemyArray removeObject:en2];
        [scene removeChild:en2 cleanup:YES];									
    }
    for (TDTower *to1 in self.towerArray) {
        if (to1.isDelete == YES) {
            [towerDeleteArray addObject:to1];
        }
	}
    for (TDTower *to2 in towerDeleteArray) {
        [self.towerArray removeObject:to2];
        [scene removeChild:to2 cleanup:YES];									
    }
    for (TDBullet *bu1 in self.bulletArray) {
        if (bu1.isDelete == YES) {
            [bulletDeleteArray addObject:bu1];
        }
	}
    for (TDBullet *bu2 in bulletDeleteArray) {
        [self.bulletArray removeObject:bu2];
        [scene removeChild:bu2 cleanup:YES];									
    }
    for (TDFriendly *fr1 in self.frientlyArray) {
        if (fr1.isDelete == YES) {
            [frientlyDeleteArray addObject:fr1];
        }
	}
    for (TDFriendly *fr2 in frientlyDeleteArray) {
        [self.frientlyArray removeObject:fr2];
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
    [self.gameImfomation setPauseMenuStatus];
	//gameMagic.btnRestartMenu = 
	// 控制法术按钮及下一波按钮的状态
    [gameMagic setGoMenuStatus];
    [gameMagic setMagic1MenuStatus];
    [gameMagic setMagic2MenuStatus];
    [gameMagic setMagic3MenuStatus];
    [gameMagic setMagic4MenuStatus];
    // 控制建造按钮及其他操作按钮的状态
    [gameController setBuild1MenuStatus];
    [gameController setBuild2MenuStatus];
    [gameController setBuild3MenuStatus];
    [gameController setBuild4MenuStatus];
    [gameController setUpdateMenuStatus];
    [gameController setSellMenuStatus];
    [gameController setZoneMenuStatus];
}

- (void)dealloc {
    [enemyArray removeAllObjects];
    [towerArray removeAllObjects];
    [waveArray removeAllObjects];
    [bulletArray removeAllObjects];
    [magicArray removeAllObjects];
    [frientlyArray removeAllObjects];
    [gameBackground release];
	[gameImfomation release];	
	[gameMagic release];
    [gameController release];
    [gameHint release];
	[gestureRecognizer release];
    [enemyArray release];
    [towerArray release];
    [waveArray release];
    [bulletArray release];
    [wayManager release];
    [magicArray release];
    [frientlyArray release];
    gameBackground = nil;
	gameImfomation = nil;	
	gameMagic = nil;
    gameController = nil;
	gestureRecognizer = nil;
    enemyArray = nil;
    towerArray = nil;
    waveArray = nil;
    bulletArray = nil;
    wayManager = nil;
    magicArray = nil;
    frientlyArray = nil;
	[super dealloc];
}

@end
