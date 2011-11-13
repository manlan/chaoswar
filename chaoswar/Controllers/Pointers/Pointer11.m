#import "Pointer11.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer11

- (void) initController
{
    GameController *gc = [GameController getGameController];
	gc.maxWave = 15;
	gc.currentWave = 0;
	gc.currentHealth = 20;
	gc.currentGold = 580;
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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(28, 112)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(28, 177)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(447, 112)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(447, 177)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(161, 147)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(240, 147)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(317, 147)];
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
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:3 e:ET_FOOT4 s:2 t:2 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:3 e:ET_FOOT4 s:2 t:2 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 4:
            [self runWave:1 e:ET_FOOT14 s:3 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:3 e:ET_FOOT3 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT7 s:3 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:3 e:ET_FOOT2 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 5:
            [self runWave:1 e:ET_FOOT11 s:3 t:4 wy:[gc.wayManager getWay:2]];
            [self runWave:3 e:ET_FOOT4 s:2 t:5 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT7 s:3 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:3 e:ET_FOOT2 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 6:
            [self runWave:1 e:ET_FOOT12 s:3 t:4 wy:[gc.wayManager getWay:2]];
            [self runWave:3 e:ET_FOOT10 s:2 t:5 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT14 s:3 t:4 wy:[gc.wayManager getWay:5]];
            [self runWave:3 e:ET_FOOT3 s:2 t:5 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 7:
            [self runWave:1 e:ET_FOOT16 s:3 t:2 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT16 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 8:
            [self runWave:1 e:ET_FOOT16 s:2 t:1 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT16 s:2 t:1 wy:[gc.wayManager getWay:5]];
            [self runWave:2 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 9:
            [self runWave:1 e:ET_FOOT16 s:2 t:1 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT16 s:2 t:1 wy:[gc.wayManager getWay:5]];
            [self runWave:2 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 10:
            [self runWave:1 e:ET_FOOT12 s:2 t:4 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT10 s:2 t:5 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT11 s:2 t:4 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT4 s:2 t:5 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 11:
            [self runWave:1 e:ET_FLY2 s:3 t:5 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FLY3 s:3 t:4 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 12:
            [self runWave:1 e:ET_FOOT11 s:2 t:3 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT16 s:6 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT15 s:6 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT6 s:2 t:3 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 13:
            [self runWave:1 e:ET_FOOT8 s:2 t:8 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT6 s:2 t:8 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT6 s:2 t:8 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT8 s:2 t:8 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 14:
            [self runWave:2 e:ET_FOOT8 s:2 t:6 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT16 s:2 t:1 wy:[gc.wayManager getWay:1]];
            [self runWave:2 e:ET_FOOT6 s:2 t:6 wy:[gc.wayManager getWay:3]];
            
            [self runWave:2 e:ET_FOOT6 s:2 t:6 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT13 s:3 t:4 wy:[gc.wayManager getWay:5]];
            [self runWave:2 e:ET_FOOT9 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 15:
            [self runWave:1 e:ET_FOOT16 s:3 t:4 wy:[gc.wayManager getWay:1]];
            
            [self runWave:1 e:ET_FOOT14 s:3 t:5 wy:[gc.wayManager getWay:5]];
            [self runWave:3 e:ET_FOOT3 s:2 t:5 wy:[gc.wayManager getWay:6]];
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
    [manager addWayPoint:1 wayPoint:ccp(125, 321)];
    [manager addWayPoint:1 wayPoint:ccp(125, 251)];
    [manager addWayPoint:1 wayPoint:ccp(81, 251)];
    [manager addWayPoint:1 wayPoint:ccp(81, 89)];
    [manager addWayPoint:1 wayPoint:ccp(230, 89)];
    [manager addWayPoint:1 wayPoint:ccp(230, -1)];
    
    [manager addWayPoint:2 wayPoint:ccp(140, 321)];
    [manager addWayPoint:2 wayPoint:ccp(140, 236)];
    [manager addWayPoint:2 wayPoint:ccp(94, 236)];
    [manager addWayPoint:2 wayPoint:ccp(94, 106)];
    [manager addWayPoint:2 wayPoint:ccp(245, 106)];
    [manager addWayPoint:2 wayPoint:ccp(245, -1)];
    
    [manager addWayPoint:3 wayPoint:ccp(155, 321)];
    [manager addWayPoint:3 wayPoint:ccp(155, 246)];
    [manager addWayPoint:3 wayPoint:ccp(369, 246)];
    [manager addWayPoint:3 wayPoint:ccp(369, 121)];
    [manager addWayPoint:3 wayPoint:ccp(230, 121)];
    [manager addWayPoint:3 wayPoint:ccp(230, -1)];
    
    [manager addWayPoint:4 wayPoint:ccp(336, 321)];
    [manager addWayPoint:4 wayPoint:ccp(336, 221)];
    [manager addWayPoint:4 wayPoint:ccp(109, 221)];
    [manager addWayPoint:4 wayPoint:ccp(109, 121)];
    [manager addWayPoint:4 wayPoint:ccp(260, 121)];
    [manager addWayPoint:4 wayPoint:ccp(260, -1)];
    
    [manager addWayPoint:5 wayPoint:ccp(351, 321)];
    [manager addWayPoint:5 wayPoint:ccp(351, 236)];
    [manager addWayPoint:5 wayPoint:ccp(383, 236)];
    [manager addWayPoint:5 wayPoint:ccp(383, 106)];
    [manager addWayPoint:5 wayPoint:ccp(245, 106)];
    [manager addWayPoint:5 wayPoint:ccp(245, -1)];
    
    [manager addWayPoint:6 wayPoint:ccp(366, 321)];
    [manager addWayPoint:6 wayPoint:ccp(366, 251)];
    [manager addWayPoint:6 wayPoint:ccp(396, 251)];
    [manager addWayPoint:6 wayPoint:ccp(396, 89)];
    [manager addWayPoint:6 wayPoint:ccp(260, 89)];
    [manager addWayPoint:6 wayPoint:ccp(260, -1)];
}

- (void) initFriendly:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (BOOL) isWhite:(CGPoint)point
{
    if (point.x > 112 && point.x < 171 && point.y > 255 && point.y < 320) {
        return YES;
    }
    
    if (point.x > 321 && point.x < 380 && point.y > 255 && point.y < 320) {
        return YES;
    }
    
    if (point.x > 65 && point.x < 414 && point.y > 209 && point.y < 268) {
        return YES;
    }
    
    if (point.x > 65 && point.x < 123 && point.y > 80 && point.y < 268) {
        return YES;
    }
    
    if (point.x > 355 && point.x < 415 && point.y > 80 && point.y < 268) {
        return YES;
    }
    
    if (point.x > 65 && point.x < 415 && point.y > 80 && point.y < 139) {
        return YES;
    }
    
    if (point.x > 217 && point.x < 276 && point.y > 30 && point.y < 95) {
        return YES;
    }
    
    return NO;
}

@end
