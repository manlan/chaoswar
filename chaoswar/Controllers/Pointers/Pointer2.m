#import "Pointer2.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer2

- (void) initController
{
    GameController *gc = [GameController getGameController];
	gc.maxWave = 12;
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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(191, 146)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(248, 146)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(248, 205)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(70, 110)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(88, 230)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(372, 153)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(372, 100)];
}

- (BOOL) runWaves:(int)wave
{
    GameController *gc = [GameController getGameController];
	switch (wave) {
		case 1:
            [self runWave:1 e:ET_FOOT2 s:1.2 t:5 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:10];
			break;
        case 2:
            [self runWave:1 e:ET_FOOT2 s:1.2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT2 s:1.2 t:4 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 3:
            [self runWave:1.5 e:ET_FOOT2 s:1.2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT3 s:1.2 t:3 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 4:
            [self runWave:1 e:ET_FOOT3 s:1.2 t:8 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:10];
			break;
        case 5:
            [self runWave:2 e:ET_FOOT2 s:1.2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1.2 e:ET_FOOT3 s:1.2 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT2 s:1.2 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 6:
            [self runWave:1.5 e:ET_FOOT1 s:1.2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT2 s:1.2 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:1.6 e:ET_FOOT1 s:1.2 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 7:
            [self runWave:1 e:ET_FOOT4 s:1.2 t:3 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:10];
			break;
        case 8:
            [self runWave:1 e:ET_FOOT4 s:1.2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:2.4 e:ET_FOOT5 s:1.2 t:3 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 9:
            [self runWave:1.2 e:ET_FOOT2 s:1.2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT5 s:1.2 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:1.5 e:ET_FOOT2 s:1.2 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 10:
            [self runWave:1.8 e:ET_FOOT3 s:1.2 t:6 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT5 s:1.2 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:1.5 e:ET_FOOT3 s:1.2 t:6 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 11:
            [self runWave:1 e:ET_FOOT4 s:1.2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1.4 e:ET_FOOT5 s:1.2 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:1.8 e:ET_FOOT4 s:1.2 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 12:
            [self runWave:2 e:ET_FOOT3 s:1.2 t:8 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT5 s:1.2 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:1.5 e:ET_FOOT3 s:1.2 t:8 wy:[gc.wayManager getWay:3]];
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
    [manager addWayPoint:1 wayPoint:ccp(-1, 214)];
    [manager addWayPoint:1 wayPoint:ccp(143, 214)];
    [manager addWayPoint:1 wayPoint:ccp(143, 128)];
    [manager addWayPoint:1 wayPoint:ccp(293, 128)];
    [manager addWayPoint:1 wayPoint:ccp(293, 262)];
    [manager addWayPoint:1 wayPoint:ccp(481, 262)];
    
    [manager addWayPoint:2 wayPoint:ccp(-1, 199)];
    [manager addWayPoint:2 wayPoint:ccp(128, 199)];
    [manager addWayPoint:2 wayPoint:ccp(128, 113)];
    [manager addWayPoint:2 wayPoint:ccp(308, 113)];
    [manager addWayPoint:2 wayPoint:ccp(308, 247)];
    [manager addWayPoint:2 wayPoint:ccp(481, 247)];
    
    [manager addWayPoint:3 wayPoint:ccp(-1, 184)];
    [manager addWayPoint:3 wayPoint:ccp(113, 184)];
    [manager addWayPoint:3 wayPoint:ccp(113, 98)];
    [manager addWayPoint:3 wayPoint:ccp(323, 98)];
    [manager addWayPoint:3 wayPoint:ccp(323, 232)];
    [manager addWayPoint:3 wayPoint:ccp(481, 232)];
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
