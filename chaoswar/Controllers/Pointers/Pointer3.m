#import "Pointer3.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer3

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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(188, 260)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(250, 260)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(409, 192)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(30, 145)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(154, 139)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(215, 139)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(280, 139)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(307, 60)];
}

- (BOOL) runWaves:(int)wave
{
    GameController *gc = [GameController getGameController];
	switch (wave) {
		case 1:
			[self runWave:2 e:ET_FOOT1 s:1.2 t:10 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT2 s:1.2 t:10 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT14 s:1.2 t:10 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 2:
            [self runWave:1 e:ET_FOOT3 s:1.2 t:4 wy:[gc.wayManager getWay:2]];
            [self runWave:1.8 e:ET_FOOT3 s:1.3 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 3:
            [self runWave:1 e:ET_FOOT3 s:1.2 t:6 wy:[gc.wayManager getWay:2]];
            [self runWave:1.5 e:ET_FOOT4 s:1.2 t:5 wy:[gc.wayManager getWay:1]];
            [self prepareNextWave:10];
			break;
        case 4:
			[self runWave:1 e:ET_FOOT3 s:1.2 t:8 wy:[gc.wayManager getWay:2]];
            [self runWave:1.5 e:ET_FOOT5 s:1.2 t:4 wy:[gc.wayManager getWay:1]];
            [self prepareNextWave:10];
			break;
        case 5:
			[self runWave:1.2 e:ET_FOOT3 s:1.2 t:6 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT5 s:1.2 t:4 wy:[gc.wayManager getWay:2]];
            [self runWave:1.5 e:ET_FOOT4 s:1.2 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 6:
            [self runWave:1 e:ET_FOOT6 s:1.2 t:5 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:10];
			break;
        case 7:
			[self runWave:1 e:ET_FLY1 s:1.2 t:6 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:10];
			break;
        case 8:
			[self runWave:1.3 e:ET_FOOT4 s:1.2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT6 s:1.2 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:1.5 e:ET_FOOT4 s:1.2 t:4 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 9:
			[self runWave:1 e:ET_FLY1 s:1.2 t:6 wy:[gc.wayManager getWay:1]];
            [self runWave:1.2 e:ET_FOOT5 s:1.2 t:6 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:10];
			break;
        case 10:
            [self runWave:1.3 e:ET_FOOT5 s:1.2 t:6 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT5 s:1.2 t:6 wy:[gc.wayManager getWay:2]];
            [self runWave:1.5 e:ET_FOOT5 s:1.2 t:6 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 11:
            [self runWave:1.5 e:ET_FOOT6 s:1.2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT6 s:1.2 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 12:
            [self runWave:1.5 e:ET_FOOT6 s:1.2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT6 s:1.2 t:6 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:10];
			break;
        case 13:
			[self runWave:1.5 e:ET_FOOT5 s:2 t:6 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FLY1 s:1.2 t:10 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:10];
			break;
        case 14:
            [self runWave:1.5 e:ET_FOOT4 s:2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FLY1 s:1.2 t:10 wy:[gc.wayManager getWay:2]];
            [self runWave:1.5 e:ET_FOOT4 s:2 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 15:
            [self runWave:1.5 e:ET_FOOT4 s:1.2 t:8 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT6 s:2 t:6 wy:[gc.wayManager getWay:2]];
            [self runWave:1.5 e:ET_FOOT4 s:1.2 t:8 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 16:
			[self runWave:1.5 e:ET_FOOT5 s:1.2 t:8 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT6 s:1.2 t:10 wy:[gc.wayManager getWay:2]];
            [self runWave:1.5 e:ET_FLY1 s:1.2 t:8 wy:[gc.wayManager getWay:3]];
            //[self prepareNextWave:22];
			break;
		default:
            //[self prepareNextWave:10];
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
    [manager addWayPoint:1 wayPoint:ccp(231, -1) z:15];
    [manager addWayPoint:1 wayPoint:ccp(231, 88) z:15];
    [manager addWayPoint:1 wayPoint:ccp(77, 88) z:15];
    [manager addWayPoint:1 wayPoint:ccp(77, 243) z:15];
    [manager addWayPoint:1 wayPoint:ccp(359, 243) z:15];
    [manager addWayPoint:1 wayPoint:ccp(359, 175) z:15];
    [manager addWayPoint:1 wayPoint:ccp(481, 175) z:15];
    
    [manager addWayPoint:2 wayPoint:ccp(246, -1) z:15];
    [manager addWayPoint:2 wayPoint:ccp(246, 103) z:15];
    [manager addWayPoint:2 wayPoint:ccp(92, 103) z:15];
    [manager addWayPoint:2 wayPoint:ccp(92, 228) z:15];
    [manager addWayPoint:2 wayPoint:ccp(344, 228) z:15];
    [manager addWayPoint:2 wayPoint:ccp(344, 160) z:15];
    [manager addWayPoint:2 wayPoint:ccp(481, 160) z:15];
    
    [manager addWayPoint:3 wayPoint:ccp(261, -1) z:15];
    [manager addWayPoint:3 wayPoint:ccp(261, 118) z:15];
    [manager addWayPoint:3 wayPoint:ccp(113, 118) z:15];
    [manager addWayPoint:3 wayPoint:ccp(113, 213) z:15];
    [manager addWayPoint:3 wayPoint:ccp(339, 213) z:15];
    [manager addWayPoint:3 wayPoint:ccp(339, 145) z:15];
    [manager addWayPoint:3 wayPoint:ccp(481, 145) z:15];
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
