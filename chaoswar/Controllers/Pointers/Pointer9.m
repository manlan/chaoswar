//
//  Pointer1.m
//  chaoswar
//
//  Created by Mac on 11-9-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Pointer9.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer9

- (void) initController
{
    GameController *gc = [GameController getGameController];
	gc.maxWave = 6;
	gc.currentWave = 0;
	gc.currentHealth = 20;
	gc.currentGold = 600;
	gc.screenClickType = SCT_ALL;
	gc.operateType = OT_NORMAL;
	gc.mapType = MT_GREEN;
	gc.canNext = YES;
}

- (void) initAnimate
{
    [AnimateManager initBoss01];
    [AnimateManager initBoss02];
    [AnimateManager initFly01];
    [AnimateManager initFly02];
    [AnimateManager initFly03];
    [AnimateManager initShooter01];
    [AnimateManager initMagic01];
    [AnimateManager initMagic02];
    [AnimateManager initFoot01];
    [AnimateManager initFoot02];
    [AnimateManager initFoot03];
    [AnimateManager initFoot04];
    [AnimateManager initFoot05];
    [AnimateManager initFoot06];
    [AnimateManager initFoot07];
    [AnimateManager initFoot08];
    [AnimateManager initFoot09];
    [AnimateManager initFoot10];
    [AnimateManager initFoot11];
    [AnimateManager initFoot12];
    [AnimateManager initFoot13];
    [AnimateManager initFoot14];
    [AnimateManager initFoot15];
    [AnimateManager initFoot16];
    [AnimateManager initDefenceTower01];
    [AnimateManager initDefenceTower02];
    [AnimateManager initDefenceTower03];
    [AnimateManager initTurretTower01];
    [AnimateManager initTurretTower02];
    [AnimateManager initTurretTower03];
    [AnimateManager initMagicTower01];
    [AnimateManager initMagicTower02];
    [AnimateManager initMagicTower03];
}

- (void) initEnemy:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (void) initTower:(NSMutableArray*)array
{
    [array removeAllObjects];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(320, 160)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(240, 160)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(140, 166)];
}

- (BOOL) runWaves:(int)wave
{
    GameController *gc = [GameController getGameController];
	switch (wave) {
		case 1:
			[self runWave:6 e:ET_FOOT1 s:1 t:10 wy:[gc.wayManager getWay:1]];
            [self runWave:4 e:ET_FOOT2 s:1.1 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT14 s:1.2 t:4 wy:[gc.wayManager getWay:1]];
            [self prepareNextWave:22];
			break;
		default:
            [self prepareNextWave:10];
			break;
	}
	gc.canNext = NO;
    [gc setGameStatus];
    return YES;
}

- (void) initBullety:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (void) initWayPoint:(WayManager*)manager
{
    [manager removeAllWay];
    [manager addWayPoint:1 wayPoint:ccp(228, -5) z:5];
    [manager addWayPoint:1 wayPoint:ccp(228, 0) z:5];
    [manager addWayPoint:1 wayPoint:ccp(228, 90) z:5];
    [manager addWayPoint:1 wayPoint:ccp(383, 90) z:5];
    [manager addWayPoint:1 wayPoint:ccp(383, 220) z:5];
    [manager addWayPoint:1 wayPoint:ccp(128, 220) z:5];
    [manager addWayPoint:1 wayPoint:ccp(128, 320) z:5];
    [manager addWayPoint:1 wayPoint:ccp(128, 325) z:5];
}

- (void) initMagic:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (void) initFriendly:(NSMutableArray*)array
{
    [array removeAllObjects];
}

@end
