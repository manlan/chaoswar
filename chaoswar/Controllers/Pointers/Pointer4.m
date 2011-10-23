#import "Pointer4.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer4

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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(212, 186)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(212, 243)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(83, 156)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(344, 142)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(150, 56)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(279, 56)];
}

- (BOOL) runWaves:(int)wave
{
    GameController *gc = [GameController getGameController];
	switch (wave) {
		case 1:
            [self runWave:1 e:ET_FOOT8 s:1 t:10 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT6 s:1.1 t:10 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT7 s:1.2 t:10 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT8 s:1 t:10 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT6 s:1.1 t:10 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT7 s:1.2 t:10 wy:[gc.wayManager getWay:6]];
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
    [manager addWayPoint:1 wayPoint:ccp(-1, 266) z:15];
    [manager addWayPoint:1 wayPoint:ccp(160, 266) z:15];
    [manager addWayPoint:1 wayPoint:ccp(160, 167) z:15];
    [manager addWayPoint:1 wayPoint:ccp(225, 167) z:15];
    [manager addWayPoint:1 wayPoint:ccp(225, -1) z:15];
    
    [manager addWayPoint:2 wayPoint:ccp(-1, 251) z:15];
    [manager addWayPoint:2 wayPoint:ccp(146, 251) z:15];
    [manager addWayPoint:2 wayPoint:ccp(146, 152) z:15];
    [manager addWayPoint:2 wayPoint:ccp(212, 152) z:15];
    [manager addWayPoint:2 wayPoint:ccp(212, -1) z:15];
    
    [manager addWayPoint:3 wayPoint:ccp(-1, 239) z:15];
    [manager addWayPoint:3 wayPoint:ccp(131, 239) z:15];
    [manager addWayPoint:3 wayPoint:ccp(131, 138) z:15];
    [manager addWayPoint:3 wayPoint:ccp(198, 138) z:15];
    [manager addWayPoint:3 wayPoint:ccp(198, -1) z:15];
    
    [manager addWayPoint:4 wayPoint:ccp(481, 177) z:15];
    [manager addWayPoint:4 wayPoint:ccp(426, 177) z:15];
    [manager addWayPoint:4 wayPoint:ccp(426, 243) z:15];
    [manager addWayPoint:4 wayPoint:ccp(267, 243) z:15];
    [manager addWayPoint:4 wayPoint:ccp(267, 167) z:15];
    [manager addWayPoint:4 wayPoint:ccp(196, 167) z:15];
    [manager addWayPoint:4 wayPoint:ccp(196, -1) z:15];
    
    [manager addWayPoint:5 wayPoint:ccp(481, 162) z:15];
    [manager addWayPoint:5 wayPoint:ccp(411, 162) z:15];
    [manager addWayPoint:5 wayPoint:ccp(411, 228) z:15];
    [manager addWayPoint:5 wayPoint:ccp(280, 228) z:15];
    [manager addWayPoint:5 wayPoint:ccp(280, 152) z:15];
    [manager addWayPoint:5 wayPoint:ccp(212, 152) z:15];
    [manager addWayPoint:5 wayPoint:ccp(212, -1) z:15];
    
    [manager addWayPoint:6 wayPoint:ccp(481, 147) z:15];
    [manager addWayPoint:6 wayPoint:ccp(396, 147) z:15];
    [manager addWayPoint:6 wayPoint:ccp(396, 213) z:15];
    [manager addWayPoint:6 wayPoint:ccp(295, 213) z:15];
    [manager addWayPoint:6 wayPoint:ccp(295, 136) z:15];
    [manager addWayPoint:6 wayPoint:ccp(226, 136) z:15];
    [manager addWayPoint:6 wayPoint:ccp(226, -1) z:15];
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
