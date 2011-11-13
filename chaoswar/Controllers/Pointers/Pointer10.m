#import "Pointer10.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer10

- (void) initController
{
    GameController *gc = [GameController getGameController];
	gc.maxWave = 14;
	gc.currentWave = 0;
	gc.currentHealth = 20;
	gc.currentGold = 460;
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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(115, 130)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(115, 184)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(245, 143)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(307, 143)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(370, 143)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(204, 275)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(395, 66)];
}

- (BOOL) runWaves:(int)wave
{
    GameController *gc = [GameController getGameController];
	switch (wave) {
		case 1:
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:2]];

            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 2:
            [self runWave:1 e:ET_FOOT3 s:2 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:3 e:ET_FOOT4 s:2 t:2 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT3 s:2 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:3 e:ET_FOOT4 s:2 t:2 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 3:
            [self runWave:1 e:ET_FOOT11 s:3 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:3 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT7 s:3 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:3 e:ET_FOOT2 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 4:
            [self runWave:1 e:ET_FOOT12 s:3 t:4 wy:[gc.wayManager getWay:2]];
            [self runWave:3 e:ET_FOOT10 s:2 t:5 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT7 s:3 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:3 e:ET_FOOT2 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 5:
            [self runWave:1 e:ET_FOOT13 s:3 t:4 wy:[gc.wayManager getWay:2]];
            [self runWave:3 e:ET_FOOT9 s:2 t:5 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT14 s:3 t:4 wy:[gc.wayManager getWay:5]];
            [self runWave:3 e:ET_FOOT3 s:2 t:5 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 6:
            //new enemy
            [self runWave:1 e:ET_FOOT16 s:3 t:2 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT16 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 7:
            [self runWave:1 e:ET_FOOT16 s:4 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT16 s:4 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 8:
            [self runWave:1 e:ET_FOOT16 s:4 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT16 s:4 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 9:
            [self runWave:1 e:ET_FOOT16 s:8 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:5 e:ET_FOOT15 s:8 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT16 s:8 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:5 e:ET_FOOT15 s:8 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 10:
            [self runWave:1 e:ET_FLY3 s:3 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FLY3 s:3 t:4 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 11:
            [self runWave:1 e:ET_FOOT12 s:2 t:3 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT16 s:6 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT11 s:2 t:3 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT15 s:6 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT8 s:2 t:3 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 12:
            [self runWave:1 e:ET_FOOT8 s:2 t:6 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT6 s:2 t:6 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT6 s:2 t:6 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT8 s:2 t:6 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 13:
            [self runWave:2 e:ET_FOOT8 s:2 t:6 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT16 s:2 t:1 wy:[gc.wayManager getWay:1]];
            [self runWave:2 e:ET_FOOT6 s:2 t:6 wy:[gc.wayManager getWay:3]];
            
            [self runWave:2 e:ET_FOOT6 s:2 t:6 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT16 s:2 t:1 wy:[gc.wayManager getWay:5]];
            [self runWave:2 e:ET_FOOT8 s:2 t:6 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 14:
            [self runWave:1 e:ET_FOOT16 s:3 t:5 wy:[gc.wayManager getWay:1]];
            
            [self runWave:1 e:ET_FOOT16 s:3 t:5 wy:[gc.wayManager getWay:5]];
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
    [manager addWayPoint:1 wayPoint:ccp(-1, 107)];
    [manager addWayPoint:1 wayPoint:ccp(148, 107)];
    [manager addWayPoint:1 wayPoint:ccp(344, 118)];
    [manager addWayPoint:1 wayPoint:ccp(344, -1)];
    
    [manager addWayPoint:2 wayPoint:ccp(-1, 93)];
    [manager addWayPoint:2 wayPoint:ccp(148, 93)];
    [manager addWayPoint:2 wayPoint:ccp(331, 104)];
    [manager addWayPoint:2 wayPoint:ccp(331, -1)];
    
    [manager addWayPoint:3 wayPoint:ccp(-1, 71)];
    [manager addWayPoint:3 wayPoint:ccp(148, 71)];
    [manager addWayPoint:3 wayPoint:ccp(318, 88)];
    [manager addWayPoint:3 wayPoint:ccp(318, -1)];
    
    [manager addWayPoint:4 wayPoint:ccp(481, 251)];
    [manager addWayPoint:4 wayPoint:ccp(167, 251)];
    [manager addWayPoint:4 wayPoint:ccp(167, 84)];
    [manager addWayPoint:4 wayPoint:ccp(318, 84)];
    [manager addWayPoint:4 wayPoint:ccp(318, -1)];
    
    [manager addWayPoint:5 wayPoint:ccp(481, 233)];
    [manager addWayPoint:5 wayPoint:ccp(180, 233)];
    [manager addWayPoint:5 wayPoint:ccp(180, 100)];
    [manager addWayPoint:5 wayPoint:ccp(331, 100)];
    [manager addWayPoint:5 wayPoint:ccp(331, -1)];
    
    [manager addWayPoint:6 wayPoint:ccp(481, 218)];
    [manager addWayPoint:6 wayPoint:ccp(195, 218)];
    [manager addWayPoint:6 wayPoint:ccp(195, 113)];
    [manager addWayPoint:6 wayPoint:ccp(348, 113)];
    [manager addWayPoint:6 wayPoint:ccp(348, -1)];
}

- (void) initFriendly:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (BOOL) isWhite:(CGPoint)point
{
    if (point.x > 0 && point.x < 201 && point.y > 66 && point.y < 123) {
        return YES;
    }
    
    if (point.x > 151 && point.x < 209 && point.y > 66 && point.y < 268) {
        return YES;
    }
    
    if (point.x > 200 && point.x < 361 && point.y > 76 && point.y < 135) {
        return YES;
    }
    
    if (point.x > 151 && point.x < 480 && point.y > 211 && point.y < 268) {
        return YES;
    }
    
    if (point.x > 303 && point.x < 361 && point.y > 30 && point.y < 134) {
        return YES;
    }
    
    return NO;
}

@end
