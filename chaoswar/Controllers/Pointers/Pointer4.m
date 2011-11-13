#import "Pointer4.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer4

- (void) initController
{
    GameController *gc = [GameController getGameController];
	gc.maxWave = 16;
	gc.currentWave = 0;
	gc.currentHealth = 20;
	gc.currentGold = 250;
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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(212, 186)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(212, 243)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(83, 156)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(344, 142)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(150, 56)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(279, 56)];
}

- (BOOL) runWaves:(int)wave
{
    GameController *gc = [GameController getGameController];
	switch (wave) {
		case 1:
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT3 s:2 t:4 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 2:
            [self runWave:1 e:ET_FOOT4 s:1.1 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT2 s:2 t:4 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT7 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 3:
            [self runWave:1 e:ET_MAGIC1 s:4 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT5 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT2 s:2 t:4 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT7 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 4:
            //new enemy
            [self runWave:1 e:ET_FOOT9 s:3 t:4 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:10];
            break;
        case 5:
            [self runWave:1 e:ET_FOOT9 s:3 t:2 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT2 s:2 t:5 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT7 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 6:
            [self runWave:1 e:ET_FOOT4 s:2 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT9 s:3 t:2 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT2 s:2 t:5 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT7 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 7:
            [self runWave:2 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_MAGIC1 s:4 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT5 s:2 t:3 wy:[gc.wayManager getWay:3]];
            
            [self runWave:2 e:ET_FOOT2 s:2 t:4 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT4 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT2 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 8:
            [self runWave:1 e:ET_MAGIC1 s:4 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT5 s:2 t:6 wy:[gc.wayManager getWay:3]];
            
            //[self runWave:1 e:ET_FLY1 s:2.5 t:6 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 9:
            //[self runWave:1 e:ET_FLY1 s:2.5 t:8 wy:[gc.wayManager getWay:2]];
            
            //[self runWave:1 e:ET_FLY1 s:2.5 t:6 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 10:
            //new enemy
            [self runWave:1 e:ET_FOOT10 s:3 t:4 wy:[gc.wayManager getWay:2]];

            [self prepareNextWave:10];
			break;
        case 11:
            [self runWave:2 e:ET_FOOT10 s:3 t:5 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1.5 e:ET_FOOT2 s:2 t:4 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT7 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 12:
            [self runWave:2 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:3]];
            [self runWave:2 e:ET_FOOT10 s:3 t:5 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_MAGIC1 s:4 t:2 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT5 s:2 t:4 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 13:
            [self runWave:2 e:ET_FOOT9 s:2 t:2 wy:[gc.wayManager getWay:3]];
            [self runWave:2 e:ET_FOOT10 s:2 t:5 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1.5 e:ET_FOOT2 s:2 t:5 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT7 s:3 t:4 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 14:
            [self runWave:1 e:ET_MAGIC1 s:4 t:4 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT5 s:2 t:5 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT7 s:3 t:6 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 15:
            [self runWave:1 e:ET_MAGIC1 s:4 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT5 s:2 t:5 wy:[gc.wayManager getWay:3]];
            
            //[self runWave:1 e:ET_FLY1 s:3 t:6 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 16:
            [self runWave:1 e:ET_FOOT4 s:2 t:6 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT10 s:2 t:5 wy:[gc.wayManager getWay:3]];
            
            //[self runWave:1 e:ET_FLY1 s:3 t:8 wy:[gc.wayManager getWay:5]];
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
    [manager addWayPoint:1 wayPoint:ccp(-1, 260)];
    [manager addWayPoint:1 wayPoint:ccp(160, 260)];
    [manager addWayPoint:1 wayPoint:ccp(160, 161)];
    [manager addWayPoint:1 wayPoint:ccp(225, 161)];
    [manager addWayPoint:1 wayPoint:ccp(225, -1)];
    
    [manager addWayPoint:2 wayPoint:ccp(-1, 246)];
    [manager addWayPoint:2 wayPoint:ccp(146, 246)];
    [manager addWayPoint:2 wayPoint:ccp(146, 147)];
    [manager addWayPoint:2 wayPoint:ccp(212, 147)];
    [manager addWayPoint:2 wayPoint:ccp(212, -1)];
    
    [manager addWayPoint:3 wayPoint:ccp(-1, 233)];
    [manager addWayPoint:3 wayPoint:ccp(131, 233)];
    [manager addWayPoint:3 wayPoint:ccp(131, 132)];
    [manager addWayPoint:3 wayPoint:ccp(198, 132)];
    [manager addWayPoint:3 wayPoint:ccp(198, -1)];
    
    [manager addWayPoint:4 wayPoint:ccp(481, 171)];
    [manager addWayPoint:4 wayPoint:ccp(426, 171)];
    [manager addWayPoint:4 wayPoint:ccp(426, 238)];
    [manager addWayPoint:4 wayPoint:ccp(267, 237)];
    [manager addWayPoint:4 wayPoint:ccp(267, 161)];
    [manager addWayPoint:4 wayPoint:ccp(196, 161)];
    [manager addWayPoint:4 wayPoint:ccp(196, -1)];
    
    [manager addWayPoint:5 wayPoint:ccp(481, 157)];
    [manager addWayPoint:5 wayPoint:ccp(411, 157)];
    [manager addWayPoint:5 wayPoint:ccp(411, 222)];
    [manager addWayPoint:5 wayPoint:ccp(280, 222)];
    [manager addWayPoint:5 wayPoint:ccp(280, 147)];
    [manager addWayPoint:5 wayPoint:ccp(212, 147)];
    [manager addWayPoint:5 wayPoint:ccp(212, -1)];
    
    [manager addWayPoint:6 wayPoint:ccp(481, 141)];
    [manager addWayPoint:6 wayPoint:ccp(396, 141)];
    [manager addWayPoint:6 wayPoint:ccp(396, 207)];
    [manager addWayPoint:6 wayPoint:ccp(295, 207)];
    [manager addWayPoint:6 wayPoint:ccp(295, 130)];
    [manager addWayPoint:6 wayPoint:ccp(226, 130)];
    [manager addWayPoint:6 wayPoint:ccp(226, -1)];
}

- (void) initFriendly:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (BOOL) isWhite:(CGPoint)point
{
    if (point.x > 0 && point.x < 247 && point.y > 222 && point.y < 278) {
        return YES;
    }
    
    if (point.x > 120 && point.x < 170 && point.y > 123 && point.y < 278) {
        return YES;
    }
    
    if (point.x > 120 && point.x < 308 && point.y > 123 && point.y < 178) {
        return YES;
    }
    
    if (point.x > 185 && point.x < 243 && point.y > 30 && point.y < 140) {
        return YES;
    }
    
    if (point.x > 252 && point.x < 308 && point.y > 123 && point.y < 258) {
        return YES;
    }
    
    if (point.x > 252 && point.x < 439 && point.y > 202 && point.y < 258) {
        return YES;
    }
    
    if (point.x > 383 && point.x < 480 && point.y > 135 && point.y < 258) {
        return YES;
    }
    
    return NO;
}

@end
