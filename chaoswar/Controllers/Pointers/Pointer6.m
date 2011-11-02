#import "Pointer6.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer6

- (void) initController
{
    GameController *gc = [GameController getGameController];
	gc.maxWave = 16;
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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(34, 130)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(155, 115)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(155, 172)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(228, 172)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(280, 50)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(358, 168)];
     [self addTower:array t:[TDEmptyTower getSprite] p:ccp(418, 168)];
}

- (BOOL) runWaves:(int)wave
{
    GameController *gc = [GameController getGameController];
	switch (wave) {
		case 1:
			[self runWave:1 e:ET_FOOT9 s:1 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT8 s:1.1 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT10 s:1.2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT12 s:1 t:5 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT8 s:1.1 t:5 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT11 s:1.2 t:4 wy:[gc.wayManager getWay:6]];
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
    [manager addWayPoint:1 wayPoint:ccp(481, 270)];
    [manager addWayPoint:1 wayPoint:ccp(282, 270)];
    [manager addWayPoint:1 wayPoint:ccp(282, 152)];
    [manager addWayPoint:1 wayPoint:ccp(205, 152)];
    [manager addWayPoint:1 wayPoint:ccp(205, 100)];
    [manager addWayPoint:1 wayPoint:ccp(110, 100)];
    [manager addWayPoint:1 wayPoint:ccp(110, 235)];
    [manager addWayPoint:1 wayPoint:ccp(-1, 235)];
    
    [manager addWayPoint:2 wayPoint:ccp(481, 253)];
    [manager addWayPoint:2 wayPoint:ccp(295, 253)];
    [manager addWayPoint:2 wayPoint:ccp(295, 136)];
    [manager addWayPoint:2 wayPoint:ccp(217, 136)];
    [manager addWayPoint:2 wayPoint:ccp(217, 85)];
    [manager addWayPoint:2 wayPoint:ccp(96, 85)];
    [manager addWayPoint:2 wayPoint:ccp(96, 218)];
    [manager addWayPoint:2 wayPoint:ccp(-1, 218)];
    
    [manager addWayPoint:3 wayPoint:ccp(481, 240)];
    [manager addWayPoint:3 wayPoint:ccp(310, 240)];
    [manager addWayPoint:3 wayPoint:ccp(310, 125)];
    [manager addWayPoint:3 wayPoint:ccp(232, 125)];
    [manager addWayPoint:3 wayPoint:ccp(232, 72)];
    [manager addWayPoint:3 wayPoint:ccp(83, 72)];
    [manager addWayPoint:3 wayPoint:ccp(83, 205)];
    [manager addWayPoint:3 wayPoint:ccp(-1, 205)];
    
    [manager addWayPoint:4 wayPoint:ccp(481, 156)];
    [manager addWayPoint:4 wayPoint:ccp(205, 156)];
    [manager addWayPoint:4 wayPoint:ccp(205, 100)];
    [manager addWayPoint:4 wayPoint:ccp(110, 100)];
    [manager addWayPoint:4 wayPoint:ccp(110, 237)];
    [manager addWayPoint:4 wayPoint:ccp(-1, 237)];
    
    [manager addWayPoint:5 wayPoint:ccp(481, 140)];
    [manager addWayPoint:5 wayPoint:ccp(218, 140)];
    [manager addWayPoint:5 wayPoint:ccp(217, 85)];
    [manager addWayPoint:5 wayPoint:ccp(96, 85)];
    [manager addWayPoint:5 wayPoint:ccp(96, 220)];
    [manager addWayPoint:5 wayPoint:ccp(-1, 220)];
    
    [manager addWayPoint:6 wayPoint:ccp(481, 127)];
    [manager addWayPoint:6 wayPoint:ccp(232, 127)];
    [manager addWayPoint:6 wayPoint:ccp(232, 72)];
    [manager addWayPoint:6 wayPoint:ccp(83, 72)];
    [manager addWayPoint:6 wayPoint:ccp(83, 208)];
    [manager addWayPoint:6 wayPoint:ccp(-1, 208)];
}

- (void) initFriendly:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (BOOL) isWhite:(CGPoint)point
{
    return YES;
}

@end
