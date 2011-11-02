#import "Pointer10.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer10

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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(115, 130)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(115, 184)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(245, 143)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(307, 143)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(370, 143)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(204, 272)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(395, 66)];
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
    [manager addWayPoint:1 wayPoint:ccp(-1, 113)];
    [manager addWayPoint:1 wayPoint:ccp(148, 113)];
    [manager addWayPoint:1 wayPoint:ccp(344, 124)];
    [manager addWayPoint:1 wayPoint:ccp(344, -1)];
    
    [manager addWayPoint:2 wayPoint:ccp(-1, 99)];
    [manager addWayPoint:2 wayPoint:ccp(148, 99)];
    [manager addWayPoint:2 wayPoint:ccp(331, 110)];
    [manager addWayPoint:2 wayPoint:ccp(331, -1)];
    
    [manager addWayPoint:3 wayPoint:ccp(-1, 84)];
    [manager addWayPoint:3 wayPoint:ccp(148, 84)];
    [manager addWayPoint:3 wayPoint:ccp(318, 97)];
    [manager addWayPoint:3 wayPoint:ccp(318, -1)];
    
    [manager addWayPoint:4 wayPoint:ccp(481, 260)];
    [manager addWayPoint:4 wayPoint:ccp(167, 260)];
    [manager addWayPoint:4 wayPoint:ccp(167, 97)];
    [manager addWayPoint:4 wayPoint:ccp(318, 97)];
    [manager addWayPoint:4 wayPoint:ccp(318, -1)];
    
    [manager addWayPoint:5 wayPoint:ccp(481, 246)];
    [manager addWayPoint:5 wayPoint:ccp(180, 246)];
    [manager addWayPoint:5 wayPoint:ccp(180, 110)];
    [manager addWayPoint:5 wayPoint:ccp(331, 110)];
    [manager addWayPoint:5 wayPoint:ccp(331, -1)];
    
    [manager addWayPoint:6 wayPoint:ccp(481, 230)];
    [manager addWayPoint:6 wayPoint:ccp(195, 230)];
    [manager addWayPoint:6 wayPoint:ccp(195, 124)];
    [manager addWayPoint:6 wayPoint:ccp(348, 124)];
    [manager addWayPoint:6 wayPoint:ccp(348, -1)];
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
