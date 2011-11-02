#import "Pointer5.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer5

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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(130, 243)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(200, 243)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(271, 144)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(271, 201)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(137, 113)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(404, 140)];
}

- (BOOL) runWaves:(int)wave
{
    GameController *gc = [GameController getGameController];
	switch (wave) {
		case 1:
			[self runWave:1 e:ET_FOOT1 s:1 t:2 wy:[gc.wayManager getWay:1]];
            [self runWave:2 e:ET_FOOT2 s:1.1 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:3 e:ET_FOOT3 s:1.2 t:2 wy:[gc.wayManager getWay:3]];
            
            [self runWave:5 e:ET_FOOT4 s:1 t:2 wy:[gc.wayManager getWay:1]];
            [self runWave:5 e:ET_FOOT5 s:1.1 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:5 e:ET_FOOT6 s:1.2 t:2 wy:[gc.wayManager getWay:3]];
            
            [self runWave:8 e:ET_FOOT7 s:1 t:2 wy:[gc.wayManager getWay:1]];
            [self runWave:8 e:ET_FOOT8 s:1.1 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:8 e:ET_FOOT9 s:1.2 t:2 wy:[gc.wayManager getWay:3]];
            
            [self runWave:11 e:ET_FOOT10 s:1.2 t:2 wy:[gc.wayManager getWay:1]];
            [self runWave:11 e:ET_FOOT11 s:1.2 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:11 e:ET_FOOT12 s:1.2 t:2 wy:[gc.wayManager getWay:3]];
            
            [self runWave:14 e:ET_FOOT13 s:1.2 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:17 e:ET_FOOT14 s:1.2 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:20 e:ET_FOOT15 s:1.2 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:23 e:ET_FOOT15 s:1.2 t:2 wy:[gc.wayManager getWay:2]];
            
            [self runWave:26 e:ET_FLY1 s:1.2 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:29 e:ET_FLY2 s:1.2 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:32 e:ET_FLY2 s:1.2 t:2 wy:[gc.wayManager getWay:2]];
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
    [manager addWayPoint:1 wayPoint:ccp(481, 250)];
    [manager addWayPoint:1 wayPoint:ccp(324, 250)];
    [manager addWayPoint:1 wayPoint:ccp(324, 118)];
    [manager addWayPoint:1 wayPoint:ccp(220, 118)];
    [manager addWayPoint:1 wayPoint:ccp(220, 225)];
    [manager addWayPoint:1 wayPoint:ccp(57, 225)];
    [manager addWayPoint:1 wayPoint:ccp(57, 143)];
    [manager addWayPoint:1 wayPoint:ccp(-1, 143)];
    
    [manager addWayPoint:2 wayPoint:ccp(481, 235)];
    [manager addWayPoint:2 wayPoint:ccp(339, 235)];
    [manager addWayPoint:2 wayPoint:ccp(339, 103)];
    [manager addWayPoint:2 wayPoint:ccp(205, 103)];
    [manager addWayPoint:2 wayPoint:ccp(205, 212)];
    [manager addWayPoint:2 wayPoint:ccp(70, 212)];
    [manager addWayPoint:2 wayPoint:ccp(70, 130)];
    [manager addWayPoint:2 wayPoint:ccp(-1, 130)];
    
    [manager addWayPoint:3 wayPoint:ccp(481, 220)];
    [manager addWayPoint:3 wayPoint:ccp(353, 220)];
    [manager addWayPoint:3 wayPoint:ccp(353, 90)];
    [manager addWayPoint:3 wayPoint:ccp(192, 90)];
    [manager addWayPoint:3 wayPoint:ccp(192, 198)];
    [manager addWayPoint:3 wayPoint:ccp(93, 198)];
    [manager addWayPoint:3 wayPoint:ccp(93, 117)];
    [manager addWayPoint:3 wayPoint:ccp(-1, 117)];
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
