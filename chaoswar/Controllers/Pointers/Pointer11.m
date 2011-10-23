#import "Pointer11.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer11

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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(28, 112)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(28, 177)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(447, 112)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(447, 177)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(161, 145)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(240, 145)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(317, 145)];
}

- (BOOL) runWaves:(int)wave
{
    GameController *gc = [GameController getGameController];
	switch (wave) {
		case 1:
            [self runWave:1 e:ET_FOOT9 s:1 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT9 s:1.1 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT10 s:1.2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT10 s:1 t:5 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT11 s:1.1 t:5 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT10 s:1.2 t:4 wy:[gc.wayManager getWay:6]];
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
    [manager addWayPoint:1 wayPoint:ccp(125, 321) z:15];
    [manager addWayPoint:1 wayPoint:ccp(125, 257) z:15];
    [manager addWayPoint:1 wayPoint:ccp(81, 257) z:15];
    [manager addWayPoint:1 wayPoint:ccp(81, 99) z:15];
    [manager addWayPoint:1 wayPoint:ccp(230, 99) z:15];
    [manager addWayPoint:1 wayPoint:ccp(230, -1) z:15];
    
    [manager addWayPoint:2 wayPoint:ccp(140, 321) z:16];
    [manager addWayPoint:2 wayPoint:ccp(140, 242) z:16];
    [manager addWayPoint:2 wayPoint:ccp(94, 242) z:16];
    [manager addWayPoint:2 wayPoint:ccp(94, 112) z:16];
    [manager addWayPoint:2 wayPoint:ccp(245, 112) z:16];
    [manager addWayPoint:2 wayPoint:ccp(245, -1) z:16];
    
    [manager addWayPoint:3 wayPoint:ccp(155, 321) z:17];
    [manager addWayPoint:3 wayPoint:ccp(155, 252) z:17];
    [manager addWayPoint:3 wayPoint:ccp(369, 252) z:17];
    [manager addWayPoint:3 wayPoint:ccp(369, 127) z:17];
    [manager addWayPoint:3 wayPoint:ccp(230, 127) z:17];
    [manager addWayPoint:3 wayPoint:ccp(230, -1) z:17];
    
    [manager addWayPoint:4 wayPoint:ccp(336, 321) z:15];
    [manager addWayPoint:4 wayPoint:ccp(336, 227) z:15];
    [manager addWayPoint:4 wayPoint:ccp(109, 227) z:17];
    [manager addWayPoint:4 wayPoint:ccp(109, 127) z:17];
    [manager addWayPoint:4 wayPoint:ccp(260, 127) z:17];
    [manager addWayPoint:4 wayPoint:ccp(260, -1) z:17];
    
    [manager addWayPoint:5 wayPoint:ccp(351, 321) z:16];
    [manager addWayPoint:5 wayPoint:ccp(351, 242) z:16];
    [manager addWayPoint:5 wayPoint:ccp(383, 242) z:16];
    [manager addWayPoint:5 wayPoint:ccp(383, 112) z:16];
    [manager addWayPoint:5 wayPoint:ccp(245, 112) z:16];
    [manager addWayPoint:5 wayPoint:ccp(245, -1) z:16];
    
    [manager addWayPoint:6 wayPoint:ccp(366, 321) z:15];
    [manager addWayPoint:6 wayPoint:ccp(366, 257) z:15];
    [manager addWayPoint:6 wayPoint:ccp(396, 257) z:17];
    [manager addWayPoint:6 wayPoint:ccp(396, 99) z:17];
    [manager addWayPoint:6 wayPoint:ccp(260, 99) z:17];
    [manager addWayPoint:6 wayPoint:ccp(260, -1) z:17];
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
