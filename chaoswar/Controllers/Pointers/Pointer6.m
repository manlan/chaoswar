#import "Pointer6.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer6

- (void) initController
{
    GameController *gc = [GameController getGameController];
	gc.maxWave = 16;
	gc.currentWave = 0;
	gc.currentHealth = 20;
	gc.currentGold = 400;
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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(34, 130)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(155, 115)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(155, 172)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(228, 172)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(280, 50)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(358, 168)];
     [self addTower:array t:[TDEmptyTower getSprite] p:ccp(418, 168)];
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
			//[self runWave:1 e:ET_FLY1 s:2 t:4 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:10];
			break;
        case 3:
			[self runWave:1 e:ET_FLY2 s:2 t:4 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 4:
			[self runWave:1 e:ET_FOOT2 s:2 t:3 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT7 s:3 t:2 wy:[gc.wayManager getWay:2]];
            
            //[self runWave:1 e:ET_FLY1 s:4 t:2 wy:[gc.wayManager getWay:5]];
            //[self runWave:3 e:ET_FLY2 s:4 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 5:
			[self runWave:1 e:ET_FOOT4 s:2 t:3 wy:[gc.wayManager getWay:1]];
            
            [self runWave:1 e:ET_FOOT2 s:2 t:3 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT7 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 6:
			[self runWave:1 e:ET_FOOT5 s:2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_MAGIC1 s:3 t:2 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT2 s:2 t:3 wy:[gc.wayManager getWay:4]];
            [self prepareNextWave:10];
			break;
        case 7:
            //new enemy
            [self runWave:1 e:ET_FOOT11 s:3.5 t:3 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:10];
			break;
        case 8:
			[self runWave:1.4 e:ET_FOOT4 s:2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT11 s:3.5 t:3 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:10];
			break;
        case 9:
			[self runWave:1.4 e:ET_FOOT4 s:2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT11 s:3.5 t:3 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT2 s:2 t:3 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT7 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 10:
            //new enemy
			[self runWave:1.4 e:ET_FOOT9 s:3 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_MAGIC2 s:3.5 t:2 wy:[gc.wayManager getWay:2]];
            
            [self prepareNextWave:10];
			break;
        case 11:
			[self runWave:1.4 e:ET_FOOT4 s:2 t:3 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT11 s:3.5 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1.4 e:ET_FOOT9 s:3 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_MAGIC2 s:3.5 t:2 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:10];
			break;
        case 12:
			[self runWave:1.4 e:ET_FOOT4 s:2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT11 s:3.5 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT2 s:2 t:5 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT7 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 13:
			[self runWave:1.4 e:ET_FOOT10 s:3 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_MAGIC2 s:3.5 t:2 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT3 s:2 t:4 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT9 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 14:
			[self runWave:1.4 e:ET_FOOT10 s:3 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_MAGIC2 s:3.5 t:2 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT2 s:2 t:5 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT7 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 15:
			[self runWave:1.4 e:ET_FOOT4 s:3 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT11 s:3.5 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT2 s:2 t:5 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT7 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 16:
			[self runWave:1.4 e:ET_FOOT4 s:3 t:6 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT11 s:3.5 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT2 s:2 t:5 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT7 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT10 s:2 t:2 wy:[gc.wayManager getWay:6]];
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
    [manager addWayPoint:1 wayPoint:ccp(481, 264)];
    [manager addWayPoint:1 wayPoint:ccp(282, 264)];
    [manager addWayPoint:1 wayPoint:ccp(282, 146)];
    [manager addWayPoint:1 wayPoint:ccp(205, 146)];
    [manager addWayPoint:1 wayPoint:ccp(205, 94)];
    [manager addWayPoint:1 wayPoint:ccp(110, 94)];
    [manager addWayPoint:1 wayPoint:ccp(110, 229)];
    [manager addWayPoint:1 wayPoint:ccp(-1, 229)];
    
    [manager addWayPoint:2 wayPoint:ccp(481, 247)];
    [manager addWayPoint:2 wayPoint:ccp(295, 247)];
    [manager addWayPoint:2 wayPoint:ccp(295, 130)];
    [manager addWayPoint:2 wayPoint:ccp(217, 130)];
    [manager addWayPoint:2 wayPoint:ccp(217, 79)];
    [manager addWayPoint:2 wayPoint:ccp(96, 79)];
    [manager addWayPoint:2 wayPoint:ccp(96, 212)];
    [manager addWayPoint:2 wayPoint:ccp(-1, 212)];
    
    [manager addWayPoint:3 wayPoint:ccp(481, 226)];
    [manager addWayPoint:3 wayPoint:ccp(310, 226)];
    [manager addWayPoint:3 wayPoint:ccp(310, 117)];
    [manager addWayPoint:3 wayPoint:ccp(232, 117)];
    [manager addWayPoint:3 wayPoint:ccp(232, 62)];
    [manager addWayPoint:3 wayPoint:ccp(83, 62)];
    [manager addWayPoint:3 wayPoint:ccp(83, 198)];
    [manager addWayPoint:3 wayPoint:ccp(-1, 198)];
    
    [manager addWayPoint:4 wayPoint:ccp(481, 150)];
    [manager addWayPoint:4 wayPoint:ccp(205, 150)];
    [manager addWayPoint:4 wayPoint:ccp(205, 94)];
    [manager addWayPoint:4 wayPoint:ccp(110, 94)];
    [manager addWayPoint:4 wayPoint:ccp(110, 231)];
    [manager addWayPoint:4 wayPoint:ccp(-1, 231)];
    
    [manager addWayPoint:5 wayPoint:ccp(481, 134)];
    [manager addWayPoint:5 wayPoint:ccp(218, 134)];
    [manager addWayPoint:5 wayPoint:ccp(217, 79)];
    [manager addWayPoint:5 wayPoint:ccp(96, 79)];
    [manager addWayPoint:5 wayPoint:ccp(96, 214)];
    [manager addWayPoint:5 wayPoint:ccp(-1, 214)];
    
    [manager addWayPoint:6 wayPoint:ccp(481, 117)];
    [manager addWayPoint:6 wayPoint:ccp(232, 117)];
    [manager addWayPoint:6 wayPoint:ccp(232, 62)];
    [manager addWayPoint:6 wayPoint:ccp(83, 62)];
    [manager addWayPoint:6 wayPoint:ccp(83, 198)];
    [manager addWayPoint:6 wayPoint:ccp(-1, 198)];
}

- (void) initFriendly:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (BOOL) isWhite:(CGPoint)point
{
    if (point.x > 0 && point.x < 167 && point.y > 191 && point.y < 243) {
        return YES;
    }
    
    if (point.x > 71 && point.x < 167 && point.y > 55 && point.y < 243) {
        return YES;
    }
    
    if (point.x > 71 && point.x < 243 && point.y > 55 && point.y < 106) {
        return YES;
    }
    
    if (point.x > 191 && point.x < 243 && point.y > 55 && point.y < 161) {
        return YES;
    }
    
    if (point.x > 191 && point.x < 243 && point.y > 110 && point.y < 161) {
        return YES;
    }
    
    if (point.x > 270 && point.x < 321 && point.y > 110 && point.y < 276) {
        return YES;
    }
    
    if (point.x > 270 && point.x < 480 && point.y > 224 && point.y < 276) {
        return YES;
    }
    
    return NO;
}

@end
