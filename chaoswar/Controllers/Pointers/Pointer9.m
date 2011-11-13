#import "Pointer9.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer9

- (void) initController
{
    GameController *gc = [GameController getGameController];
	gc.maxWave = 18;
	gc.currentWave = 0;
	gc.currentHealth = 20;
	gc.currentGold = 420;
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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(55, 139)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(55, 190)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(179, 139)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(236, 139)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(292, 139)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(417, 190)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(417, 139)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(165, 252)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(289, 252)];
}

- (BOOL) runWaves:(int)wave
{
    GameController *gc = [GameController getGameController];
	switch (wave) {
		case 1:
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:7]];
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 2:
            [self runWave:1 e:ET_FOOT3 s:2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT4 s:2 t:3 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT3 s:2 t:4 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT4 s:2 t:3 wy:[gc.wayManager getWay:6]];

            [self prepareNextWave:10];
			break;
        case 3:
            [self runWave:1 e:ET_FOOT4 s:2 t:3 wy:[gc.wayManager getWay:2]];

            [self runWave:1 e:ET_FOOT4 s:2 t:3 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:7]];
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 4:
            [self runWave:2 e:ET_FOOT10 s:2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT12 s:3 t:3 wy:[gc.wayManager getWay:2]];

            [self prepareNextWave:10];
			break;
        case 5:
            [self runWave:1 e:ET_FLY2 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FLY2 s:2 t:4 wy:[gc.wayManager getWay:5]];
            
            [self prepareNextWave:10];
			break;
        case 6:
            [self runWave:1 e:ET_FOOT4 s:1.5 t:8 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT4 s:1.5 t:8 wy:[gc.wayManager getWay:5]];
            
            [self prepareNextWave:10];
			break;
        case 7:
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT14 s:3 t:2 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT10 s:2 t:3 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT12 s:3 t:2 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT4 s:2 t:3 wy:[gc.wayManager getWay:7]];
            [self runWave:1 e:ET_FOOT11 s:3 t:2 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 8:
            //new enemy
            [self runWave:1 e:ET_FOOT15 s:1 t:1 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT15 s:1 t:1 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT15 s:3 t:1 wy:[gc.wayManager getWay:7]];
            [self runWave:1 e:ET_FOOT15 s:3 t:1 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 9:
            [self runWave:1 e:ET_FOOT15 s:4 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT10 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT15 s:4 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT10 s:2 t:4 wy:[gc.wayManager getWay:6]];

            [self prepareNextWave:10];
			break;
        case 10:
            [self runWave:1 e:ET_FOOT15 s:4 t:1 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT11 s:3 t:3 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT15 s:4 t:1 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT12 s:3 t:3 wy:[gc.wayManager getWay:6]];
            
            [self runWave:1 e:ET_FOOT15 s:4 t:2 wy:[gc.wayManager getWay:7]];
            [self runWave:1 e:ET_FOOT10 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 11:
            [self runWave:1 e:ET_FOOT4 s:3 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT11 s:3 t:3 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT10 s:3 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT12 s:3 t:3 wy:[gc.wayManager getWay:6]];
            
            [self runWave:1 e:ET_FOOT14 s:3 t:3 wy:[gc.wayManager getWay:7]];
            [self runWave:1 e:ET_FOOT3 s:3 t:3 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 12:
            [self runWave:1 e:ET_FOOT7 s:2 t:4 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT2 s:2 t:5 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_MAGIC1 s:2 t:4 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT5 s:2 t:5 wy:[gc.wayManager getWay:6]];
            
            //[self runWave:1 e:ET_MAGIC2 s:2 t:4 wy:[gc.wayManager getWay:7]];
            [self runWave:1 e:ET_FOOT9 s:2 t:5 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 13:
            [self runWave:1 e:ET_FOOT4 s:1.5 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT11 s:2 t:3 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT10 s:1.5 t:4 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT12 s:2 t:3 wy:[gc.wayManager getWay:6]];
            
            [self runWave:1 e:ET_FOOT14 s:2 t:3 wy:[gc.wayManager getWay:7]];
            [self runWave:1 e:ET_FOOT3 s:1.5 t:5 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 14:
            [self runWave:1 e:ET_FOOT15 s:4 t:3 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT15 s:4 t:3 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT15 s:4 t:3 wy:[gc.wayManager getWay:7]];
            [self prepareNextWave:10];
			break;
        case 15:
            [self runWave:1 e:ET_FOOT15 s:4 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT15 s:4 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:6]];
            
            [self runWave:1 e:ET_FOOT15 s:4 t:2 wy:[gc.wayManager getWay:7]];
            [self runWave:1 e:ET_FOOT10 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 16:
            [self runWave:1 e:ET_FOOT15 s:4 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT15 s:4 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:6]];
            
            [self runWave:1 e:ET_FOOT15 s:4 t:3 wy:[gc.wayManager getWay:7]];
            [self runWave:1 e:ET_FOOT10 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 17:
            [self runWave:1 e:ET_BOSS1 s:2 t:1 wy:[gc.wayManager getWay:7]];
            [self prepareNextWave:10];
			break;
        case 18:
            [self runWave:1 e:ET_BOSS1 s:2 t:1 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_BOSS1 s:2 t:1 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
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
    [manager addWayPoint:1 wayPoint:ccp(-1, 116)];
    [manager addWayPoint:1 wayPoint:ccp(101, 116)];
    [manager addWayPoint:1 wayPoint:ccp(101, 229)];
    [manager addWayPoint:1 wayPoint:ccp(214, 229)];
    [manager addWayPoint:1 wayPoint:ccp(214, 321)];
    
    [manager addWayPoint:2 wayPoint:ccp(-1, 99)];
    [manager addWayPoint:2 wayPoint:ccp(116, 99)];
    [manager addWayPoint:2 wayPoint:ccp(116, 214)];
    [manager addWayPoint:2 wayPoint:ccp(229, 214)];
    [manager addWayPoint:2 wayPoint:ccp(229, 321)];
    
    [manager addWayPoint:3 wayPoint:ccp(-1, 82)];
    [manager addWayPoint:3 wayPoint:ccp(130, 82)];
    [manager addWayPoint:3 wayPoint:ccp(130, 198)];
    [manager addWayPoint:3 wayPoint:ccp(246, 198)];
    [manager addWayPoint:3 wayPoint:ccp(246, 321)];
    
    [manager addWayPoint:4 wayPoint:ccp(481, 115)];
    [manager addWayPoint:4 wayPoint:ccp(373, 115)];
    [manager addWayPoint:4 wayPoint:ccp(373, 229)];
    [manager addWayPoint:4 wayPoint:ccp(246, 229)];
    [manager addWayPoint:4 wayPoint:ccp(246, 321)];
    
    [manager addWayPoint:5 wayPoint:ccp(481, 99)];
    [manager addWayPoint:5 wayPoint:ccp(357, 99)];
    [manager addWayPoint:5 wayPoint:ccp(357, 214)];
    [manager addWayPoint:5 wayPoint:ccp(229, 214)];
    [manager addWayPoint:5 wayPoint:ccp(229, 321)];
    
    [manager addWayPoint:6 wayPoint:ccp(481, 82)];
    [manager addWayPoint:6 wayPoint:ccp(343, 82)];
    [manager addWayPoint:6 wayPoint:ccp(343, 198)];
    [manager addWayPoint:6 wayPoint:ccp(214, 198)];
    [manager addWayPoint:6 wayPoint:ccp(214, 321)];
    
    [manager addWayPoint:7 wayPoint:ccp(216, -1)];
    [manager addWayPoint:7 wayPoint:ccp(216, 99)];
    [manager addWayPoint:7 wayPoint:ccp(116, 99)];
    [manager addWayPoint:7 wayPoint:ccp(116, 214)];
    [manager addWayPoint:7 wayPoint:ccp(229, 214)];
    [manager addWayPoint:7 wayPoint:ccp(229, 321)];

    [manager addWayPoint:8 wayPoint:ccp(238, -1)];
    [manager addWayPoint:8 wayPoint:ccp(238, 99)];
    [manager addWayPoint:8 wayPoint:ccp(357, 99)];
    [manager addWayPoint:8 wayPoint:ccp(357, 214)];
    [manager addWayPoint:8 wayPoint:ccp(229, 214)];
    [manager addWayPoint:8 wayPoint:ccp(229, 321)];
}

- (void) initFriendly:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (BOOL) isWhite:(CGPoint)point
{
    if (point.x > 200 && point.x < 256 && point.y > 30 && point.y < 90) {
        return YES;
    }
    
    if (point.x > 0 && point.x < 480 && point.y > 77 && point.y < 133) {
        return YES;
    }
    
    if (point.x > 88 && point.x < 145 && point.y > 118 && point.y < 247) {
        return YES;
    }
    
    if (point.x > 328 && point.x < 386 && point.y > 118 && point.y < 247) {
        return YES;
    }
    
    if (point.x > 88 && point.x < 386 && point.y > 191 && point.y < 265) {
        return YES;
    }
    
    if (point.x > 200 && point.x < 257 && point.y > 225 && point.y < 320) {
        return YES;
    }
    
    return NO;
}

@end
