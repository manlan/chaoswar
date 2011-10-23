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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(55, 139)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(179, 139)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(236, 139)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(292, 139)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(417, 139)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(165, 252)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(289, 252)];
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
            
            [self runWave:1 e:ET_FOOT11 s:1.1 t:5 wy:[gc.wayManager getWay:7]];
            [self runWave:1 e:ET_FOOT10 s:1.2 t:4 wy:[gc.wayManager getWay:8]];
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
    [manager addWayPoint:1 wayPoint:ccp(-1, 121) z:15];
    [manager addWayPoint:1 wayPoint:ccp(101, 121) z:15];
    [manager addWayPoint:1 wayPoint:ccp(101, 235) z:15];
    [manager addWayPoint:1 wayPoint:ccp(214, 235) z:15];
    [manager addWayPoint:1 wayPoint:ccp(214, 321) z:15];
    
    [manager addWayPoint:2 wayPoint:ccp(-1, 105) z:16];
    [manager addWayPoint:2 wayPoint:ccp(116, 105) z:16];
    [manager addWayPoint:2 wayPoint:ccp(116, 220) z:16];
    [manager addWayPoint:2 wayPoint:ccp(229, 220) z:16];
    [manager addWayPoint:2 wayPoint:ccp(229, 321) z:16];
    
    [manager addWayPoint:3 wayPoint:ccp(-1, 92) z:17];
    [manager addWayPoint:3 wayPoint:ccp(130, 92) z:17];
    [manager addWayPoint:3 wayPoint:ccp(130, 208) z:17];
    [manager addWayPoint:3 wayPoint:ccp(246, 208) z:17];
    [manager addWayPoint:3 wayPoint:ccp(246, 321) z:17];
    
    [manager addWayPoint:4 wayPoint:ccp(481, 121) z:15];
    [manager addWayPoint:4 wayPoint:ccp(373, 121) z:15];
    [manager addWayPoint:4 wayPoint:ccp(373, 235) z:15];
    [manager addWayPoint:4 wayPoint:ccp(246, 235) z:15];
    [manager addWayPoint:4 wayPoint:ccp(246, 321) z:15];
    
    [manager addWayPoint:5 wayPoint:ccp(481, 105) z:16];
    [manager addWayPoint:5 wayPoint:ccp(357, 105) z:16];
    [manager addWayPoint:5 wayPoint:ccp(357, 220) z:16];
    [manager addWayPoint:5 wayPoint:ccp(229, 220) z:16];
    [manager addWayPoint:5 wayPoint:ccp(229, 321) z:16];
    
    [manager addWayPoint:6 wayPoint:ccp(481, 92) z:17];
    [manager addWayPoint:6 wayPoint:ccp(343, 92) z:17];
    [manager addWayPoint:6 wayPoint:ccp(343, 205) z:17];
    [manager addWayPoint:6 wayPoint:ccp(214, 205) z:17];
    [manager addWayPoint:6 wayPoint:ccp(214, 321) z:17];
    
    [manager addWayPoint:7 wayPoint:ccp(216, -1) z:17];
    [manager addWayPoint:7 wayPoint:ccp(216, 105) z:17];
    [manager addWayPoint:7 wayPoint:ccp(116, 105) z:17];
    [manager addWayPoint:7 wayPoint:ccp(116, 220) z:17];
    [manager addWayPoint:7 wayPoint:ccp(229, 220) z:17];
    [manager addWayPoint:7 wayPoint:ccp(229, 321) z:17];

    [manager addWayPoint:8 wayPoint:ccp(238, -1) z:17];
    [manager addWayPoint:8 wayPoint:ccp(238, 105) z:17];
    [manager addWayPoint:8 wayPoint:ccp(357, 105) z:17];
    [manager addWayPoint:8 wayPoint:ccp(357, 220) z:17];
    [manager addWayPoint:8 wayPoint:ccp(229, 220) z:17];
    [manager addWayPoint:8 wayPoint:ccp(229, 321) z:17];
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
