//
//  GameController.m
//  chaoswar
//
//  Created by Mac on 11-9-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "GameController.h"
#import "Bullet.h"
#import "Tower.h"
#import "Enemy.h"
#import "Friendly.h"
#import "Wave.h"
#import "WayPoint.h"

@implementation GameController

@synthesize gameBackground;
@synthesize gameImfomation;	
@synthesize gameMagic;
@synthesize gameController;
@synthesize enemyArray;
@synthesize towerArray;
@synthesize waveArray;	
@synthesize bulletArray;	
@synthesize waypointArray;
@synthesize magicArray;
@synthesize frientlyArray;
@synthesize gestureRecognizer;
@synthesize waveLevel;

static GameController *_sharedController = nil;

+ (GameController*) getGameController
{
	if (!_sharedController) {
		_sharedController = [[self alloc] init];
	}
	return _sharedController;
}

- (void) initController:(id<Pointer>*)pointer {
    pt = pointer;
    //=========初始化敌人
    [pointer initEnemy:enemyArray];
    //=========初始化塔
    [pointer initTower:towerArray];
    //=========初始化出兵顺序
    [pointer initWave:waveArray];
    //=========初始化子弹
    [pointer initBullety:bulletArray];
    //=========初始化路线
    [pointer initWayPoint:waypointArray];
    //=========初始化魔法
    [pointer initMagic:magicArray];
    //=========初始化友军
    [pointer initFriendly:frientlyArray];
}

- (void) deleteUnUseSprite:(CCLayer*)scene
{
    NSMutableArray *enemyDeleteArray = [[NSMutableArray alloc] init];
	NSMutableArray *towerDeleteArray = [[NSMutableArray alloc] init];	
	NSMutableArray *bulletDeleteArray = [[NSMutableArray alloc] init];
    NSMutableArray *frientlyDeleteArray = [[NSMutableArray alloc] init];
	for (Enemy *en1 in self.enemyArray) {
        if (en1.isdelete == 1) {
            [enemyDeleteArray addObject:en1];
        }
		for (Enemy *en2 in enemyDeleteArray) {
			[self.enemyArray removeObject:en2];
			[scene removeChild:en2 cleanup:YES];									
		}
	}
    for (Tower *to1 in self.towerArray) {
        if (to1.isdelete == 1) {
            [towerDeleteArray addObject:to1];
        }
		for (Bullet *to2 in towerDeleteArray) {
			[self.towerArray removeObject:to2];
			[scene removeChild:to2 cleanup:YES];									
		}
	}

    for (Bullet *bu1 in self.bulletArray) {
        if (bu1.isdelete == 1) {
            [bulletDeleteArray addObject:bu1];
        }
		for (Bullet *bu2 in bulletDeleteArray) {
			[self.bulletArray removeObject:bu2];
			[scene removeChild:bu2 cleanup:YES];									
		}
	}
    
    for (Friendly *fr1 in self.frientlyArray) {
        if (fr1.isdelete == 1) {
            [frientlyDeleteArray addObject:fr1];
        }
		for (Friendly *fr2 in frientlyDeleteArray) {
			[self.frientlyArray removeObject:fr2];
			[scene removeChild:fr2 cleanup:YES];									
		}
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

- (void) showBuildButton {
    
}

- (void) spriteInfo {
    
}

- (void)encodeWithCoder:(NSCoder *)coder {
    
}

- (id)initWithCoder:(NSCoder *)coder {
	return self;
}

//获取当前的敌人攻击队列
- (Wave *)getCurrentWave {
	Wave *wave = (Wave *) [self.waveArray objectAtIndex: self.waveLevel];
	return wave;
}

//获取下一的敌人攻击队列
- (Wave *)getNextWave {
	GameController *gc = [GameController getGameController];
    self.waveLevel++;
    if (self.waveLevel > 1)
    	self.waveLevel = 0;
    Wave * wave = (Wave *) [gc.waveArray objectAtIndex:self.waveLevel];
    return wave;
}

- (id) init
{
	if ((self = [super init])) {
        enemyArray = [[NSMutableArray alloc] init];
        towerArray = [[NSMutableArray alloc] init];
        waveArray = [[NSMutableArray alloc] init];
        bulletArray = [[NSMutableArray alloc] init];
        waypointArray = [[NSMutableArray alloc] init];
        magicArray = [[NSMutableArray alloc] init];
        frientlyArray = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)dealloc {
    self.gameBackground = nil;
	self.gameImfomation = nil;	
	self.gameMagic = nil;
    self.gameController = nil;
	self.gestureRecognizer = nil;
    [enemyArray release];
    [towerArray release];
    [waveArray release];
    [bulletArray release];
    [waypointArray release];
    [magicArray release];
    [frientlyArray release];
    enemyArray = nil;
    towerArray = nil;
    waveArray = nil;
    bulletArray = nil;
    waypointArray = nil;
    magicArray = nil;
    frientlyArray = nil;
	[super dealloc];
}

@end
