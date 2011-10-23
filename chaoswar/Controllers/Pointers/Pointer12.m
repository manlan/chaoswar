#import "Pointer12.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer12

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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(84, 117)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(158, 45)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(222, 45)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(218, 243)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(218, 182)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(348, 125)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(415, 126)];
}

- (BOOL) runWaves:(int)wave
{
    GameController *gc = [GameController getGameController];
	switch (wave) {
		case 1:
            [self runWave:1 e:ET_FOOT14 s:1 t:5 wy:[gc.wayManager getWay:1]];
            //[self runWave:1 e:ET_FOOT13 s:1.1 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT13 s:1.2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT15 s:1 t:5 wy:[gc.wayManager getWay:4]];
            //[self runWave:1 e:ET_FOOT12 s:1.1 t:5 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT11 s:1.2 t:4 wy:[gc.wayManager getWay:6]];
            
            [self runWave:1 e:ET_FOOT16 s:1 t:5 wy:[gc.wayManager getWay:7]];
            //[self runWave:1 e:ET_FOOT15 s:1.1 t:5 wy:[gc.wayManager getWay:8]];
            [self runWave:1 e:ET_FOOT12 s:1.2 t:4 wy:[gc.wayManager getWay:9]];
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
    [manager addWayPoint:1 wayPoint:ccp(-1, 231) z:15];
    [manager addWayPoint:1 wayPoint:ccp(166, 231) z:15];
    [manager addWayPoint:1 wayPoint:ccp(166, 159) z:15];
    [manager addWayPoint:1 wayPoint:ccp(299, 159) z:15];
    [manager addWayPoint:1 wayPoint:ccp(299, 103) z:15];
    [manager addWayPoint:1 wayPoint:ccp(481, 103) z:15];
    
    [manager addWayPoint:2 wayPoint:ccp(-1, 216) z:16];
    [manager addWayPoint:2 wayPoint:ccp(151, 216) z:16];
    [manager addWayPoint:2 wayPoint:ccp(151, 143) z:16];
    [manager addWayPoint:2 wayPoint:ccp(284, 143) z:16];
    [manager addWayPoint:2 wayPoint:ccp(284, 88) z:16];
    [manager addWayPoint:2 wayPoint:ccp(481, 88) z:16];
    
    [manager addWayPoint:3 wayPoint:ccp(-1, 203) z:17];
    [manager addWayPoint:3 wayPoint:ccp(136, 203) z:17];
    [manager addWayPoint:3 wayPoint:ccp(136, 130) z:17];
    [manager addWayPoint:3 wayPoint:ccp(270, 130) z:17];
    [manager addWayPoint:3 wayPoint:ccp(270, 75) z:17];
    [manager addWayPoint:3 wayPoint:ccp(481, 75) z:17];
    
    [manager addWayPoint:4 wayPoint:ccp(136, 321) z:15];
    [manager addWayPoint:4 wayPoint:ccp(136, 130) z:17];
    [manager addWayPoint:4 wayPoint:ccp(270, 130) z:17];
    [manager addWayPoint:4 wayPoint:ccp(270, 75) z:17];
    [manager addWayPoint:4 wayPoint:ccp(481, 75) z:17];
    
    [manager addWayPoint:5 wayPoint:ccp(151, 321) z:16];
    [manager addWayPoint:5 wayPoint:ccp(151, 143) z:16];
    [manager addWayPoint:5 wayPoint:ccp(284, 143) z:16];
    [manager addWayPoint:5 wayPoint:ccp(284, 88) z:16];
    [manager addWayPoint:5 wayPoint:ccp(481, 88) z:16];
    
    [manager addWayPoint:6 wayPoint:ccp(166, 321) z:15];
    [manager addWayPoint:6 wayPoint:ccp(166, 159) z:15];
    [manager addWayPoint:6 wayPoint:ccp(299, 159) z:15];
    [manager addWayPoint:6 wayPoint:ccp(299, 103) z:15];
    [manager addWayPoint:6 wayPoint:ccp(481, 103) z:15];
    
    [manager addWayPoint:7 wayPoint:ccp(397, 321) z:15];
    [manager addWayPoint:7 wayPoint:ccp(397, 259) z:15];
    [manager addWayPoint:7 wayPoint:ccp(271, 259) z:15];
    [manager addWayPoint:7 wayPoint:ccp(271, 75) z:15];
    [manager addWayPoint:7 wayPoint:ccp(481, 75) z:17];
    
    [manager addWayPoint:8 wayPoint:ccp(412, 321) z:16];
    [manager addWayPoint:8 wayPoint:ccp(412, 244) z:16];
    [manager addWayPoint:8 wayPoint:ccp(284, 244) z:16];
    [manager addWayPoint:8 wayPoint:ccp(284, 88) z:16];
    [manager addWayPoint:8 wayPoint:ccp(481, 88) z:16];
    
    [manager addWayPoint:9 wayPoint:ccp(427, 321) z:17];
    [manager addWayPoint:9 wayPoint:ccp(427, 230) z:17];
    [manager addWayPoint:9 wayPoint:ccp(299, 230) z:17];
    [manager addWayPoint:9 wayPoint:ccp(299, 103) z:17];
    [manager addWayPoint:9 wayPoint:ccp(481, 103) z:15];
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
