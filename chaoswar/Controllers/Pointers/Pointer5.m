#import "Pointer5.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer5

- (void) initController
{
    GameController *gc = [GameController getGameController];
	gc.maxWave = 14;
	gc.currentWave = 0;
	gc.currentHealth = 20;
	gc.currentGold = 350;
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
    [AnimateManager initTurretBullet];
    [AnimateManager initMagicTower01];
    [AnimateManager initMagicTower02];
    [AnimateManager initMagicTower03];
    [AnimateManager initMagicFriendly01];
    [AnimateManager initMagicFriendly02];
    [AnimateManager initForeverFriendly01];
    [AnimateManager initMagicFire];
    [AnimateManager initMagicThunder];
    [AnimateManager initMagicStone];
    [AnimateManager initAllEffect];
}

- (void) initEnemy:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (void) initTower:(NSMutableArray*)array
{
    [array removeAllObjects];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(130, 245)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(200, 245)];
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
            [self runWave:1 e:ET_FOOT4 s:1.6 t:5 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:10];
			break;
        case 2:
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT5 s:2 t:3 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 3:
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT4 s:2 t:3 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 4:
            [self runWave:1 e:ET_MAGIC1 s:4 t:1 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT5 s:2 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 5:
            //new enemy
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:10];
			break;
        case 6:
            [self runWave:1 e:ET_FOOT9 s:2 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:2.5 e:ET_FOOT6 s:2 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 7:
            [self runWave:1 e:ET_FOOT6 s:1.4 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT6 s:1.4 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 8:
            [self runWave:1 e:ET_FOOT10 s:2 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:2.5 e:ET_FOOT6 s:1.4 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 9:
            //new enemy
            [self runWave:1 e:ET_FLY2 s:1.5 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT6 s:1.5 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 10:
            [self runWave:1 e:ET_FOOT10 s:3 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT9 s:2 t:4 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 11:
            [self runWave:2 e:ET_FOOT4 s:2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT10 s:2 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT9 s:2 t:3 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 12:
            [self runWave:3 e:ET_FOOT6 s:2 t:6 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT9 s:2 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 13:
            [self runWave:3 e:ET_FOOT6 s:2 t:6 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT10 s:3 t:6 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:10];
			break;
        case 14:
            [self runWave:3 e:ET_FOOT10 s:1.5 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1.2 e:ET_FOOT9 s:2 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT10 s:3 t:6 wy:[gc.wayManager getWay:3]];
            //[self prepareNextWave:10];
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
    [manager addWayPoint:1 wayPoint:ccp(481, 244)];
    [manager addWayPoint:1 wayPoint:ccp(324, 244)];
    [manager addWayPoint:1 wayPoint:ccp(324, 112)];
    [manager addWayPoint:1 wayPoint:ccp(220, 112)];
    [manager addWayPoint:1 wayPoint:ccp(220, 219)];
    [manager addWayPoint:1 wayPoint:ccp(57, 219)];
    [manager addWayPoint:1 wayPoint:ccp(57, 137)];
    [manager addWayPoint:1 wayPoint:ccp(-1, 137)];
    
    [manager addWayPoint:2 wayPoint:ccp(481, 229)];
    [manager addWayPoint:2 wayPoint:ccp(339, 229)];
    [manager addWayPoint:2 wayPoint:ccp(339, 97)];
    [manager addWayPoint:2 wayPoint:ccp(205, 97)];
    [manager addWayPoint:2 wayPoint:ccp(205, 206)];
    [manager addWayPoint:2 wayPoint:ccp(70, 206)];
    [manager addWayPoint:2 wayPoint:ccp(70, 124)];
    [manager addWayPoint:2 wayPoint:ccp(-1, 124)];
    
    [manager addWayPoint:3 wayPoint:ccp(481, 210)];
    [manager addWayPoint:3 wayPoint:ccp(353, 210)];
    [manager addWayPoint:3 wayPoint:ccp(353, 80)];
    [manager addWayPoint:3 wayPoint:ccp(192, 80)];
    [manager addWayPoint:3 wayPoint:ccp(192, 188)];
    [manager addWayPoint:3 wayPoint:ccp(93, 188)];
    [manager addWayPoint:3 wayPoint:ccp(93, 107)];
    [manager addWayPoint:3 wayPoint:ccp(-1, 107)];
}

- (void) initFriendly:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (BOOL) isWhite:(CGPoint)point
{
    if (point.x > 0 && point.x < 100 && point.y > 98 && point.y < 156) {
        return YES;
    }
    
    if (point.x > 42 && point.x < 100 && point.y > 98 && point.y < 236) {
        return YES;
    }
    
    if (point.x > 42 && point.x < 233 && point.y > 180 && point.y < 236) {
        return YES;
    }
    
    if (point.x > 177 && point.x < 233 && point.y > 72 && point.y < 236) {
        return YES;
    }
    
    if (point.x > 177 && point.x < 368 && point.y > 72 && point.y < 128) {
        return YES;
    }
    
    if (point.x > 310 && point.x < 368 && point.y > 72 && point.y < 261) {
        return YES;
    }
    
    if (point.x > 310 && point.x < 480 && point.y > 204 && point.y < 261) {
        return YES;
    }
    
    return NO;
}

@end
