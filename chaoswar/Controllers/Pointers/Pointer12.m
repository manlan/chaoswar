#import "Pointer12.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer12

- (void) initController
{
    GameController *gc = [GameController getGameController];
	gc.maxWave = 18;
	gc.currentWave = 0;
	gc.currentHealth = 20;
	gc.currentGold = 650;
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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(84, 120)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(93, 62)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(158, 48)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(222, 48)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(218, 246)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(218, 185)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(348, 128)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(415, 130)];
}

- (BOOL) runWaves:(int)wave
{
    GameController *gc = [GameController getGameController];
	switch (wave) {
		case 1:
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT4 s:2 t:3 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:8]];
            
            [self prepareNextWave:10];
			break;
        case 2:
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT7 s:2 t:4 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 3:
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT7 s:2 t:4 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 4:
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 5:
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT11 s:3 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:6]];
            
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 6:
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT14 s:3 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT3 s:2 t:4 wy:[gc.wayManager getWay:6]];
            
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 7:
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT13 s:3 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT9 s:2 t:4 wy:[gc.wayManager getWay:6]];
            
            [self runWave:1 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 8:
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT12 s:3 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT10 s:2 t:4 wy:[gc.wayManager getWay:6]];
            
            [self runWave:1 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 9:
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT15 s:4 t:3 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 10:
            [self runWave:1 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT16 s:4 t:3 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 11:
            [self runWave:2 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT7 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT16 s:4 t:3 wy:[gc.wayManager getWay:5]];
            
            [self runWave:2 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self runWave:1 e:ET_FOOT5 s:2 t:4 wy:[gc.wayManager getWay:9]];
            [self prepareNextWave:10];
			break;
        case 12:
            [self runWave:2 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:5]];
            
            [self runWave:2 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:9]];
            [self prepareNextWave:10];
			break;
        case 13:
            [self runWave:2 e:ET_FLY3 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:2 e:ET_FLY3 s:2 t:4 wy:[gc.wayManager getWay:5]];
            
            [self runWave:2 e:ET_FLY3 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 14:
            [self runWave:1 e:ET_FOOT16 s:4 t:3 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT16 s:4 t:3 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT16 s:4 t:3 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 15:
            [self runWave:1 e:ET_FOOT15 s:4 t:3 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT15 s:4 t:3 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT15 s:4 t:3 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:10];
			break;
        case 16:
            [self runWave:1 e:ET_BOSS1 s:2 t:1 wy:[gc.wayManager getWay:5]];

            [self prepareNextWave:10];
			break;
        case 17:
            [self runWave:1 e:ET_BOSS2 s:2 t:1 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 18:
            [self runWave:1 e:ET_BOSS2 s:2 t:1 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_BOSS2 s:2 t:1 wy:[gc.wayManager getWay:8]];
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
    [manager addWayPoint:1 wayPoint:ccp(-1, 225)];
    [manager addWayPoint:1 wayPoint:ccp(166, 225)];
    [manager addWayPoint:1 wayPoint:ccp(166, 154)];
    [manager addWayPoint:1 wayPoint:ccp(299, 154)];
    [manager addWayPoint:1 wayPoint:ccp(299, 99)];
    [manager addWayPoint:1 wayPoint:ccp(481, 99)];
    
    [manager addWayPoint:2 wayPoint:ccp(-1, 206)];
    [manager addWayPoint:2 wayPoint:ccp(151, 206)];
    [manager addWayPoint:2 wayPoint:ccp(151, 133)];
    [manager addWayPoint:2 wayPoint:ccp(284, 133)];
    [manager addWayPoint:2 wayPoint:ccp(284, 80)];
    [manager addWayPoint:2 wayPoint:ccp(481, 80)];
    
    [manager addWayPoint:3 wayPoint:ccp(-1, 190)];
    [manager addWayPoint:3 wayPoint:ccp(136, 190)];
    [manager addWayPoint:3 wayPoint:ccp(136, 121)];
    [manager addWayPoint:3 wayPoint:ccp(270, 121)];
    [manager addWayPoint:3 wayPoint:ccp(270, 63)];
    [manager addWayPoint:3 wayPoint:ccp(481, 63)];
    
    [manager addWayPoint:4 wayPoint:ccp(136, 321)];
    [manager addWayPoint:4 wayPoint:ccp(136, 120)];
    [manager addWayPoint:4 wayPoint:ccp(270, 120)];
    [manager addWayPoint:4 wayPoint:ccp(270, 63)];
    [manager addWayPoint:4 wayPoint:ccp(481, 63)];
    
    [manager addWayPoint:5 wayPoint:ccp(151, 321)];
    [manager addWayPoint:5 wayPoint:ccp(151, 133)];
    [manager addWayPoint:5 wayPoint:ccp(284, 133)];
    [manager addWayPoint:5 wayPoint:ccp(284, 80)];
    [manager addWayPoint:5 wayPoint:ccp(481, 80)];
    
    [manager addWayPoint:6 wayPoint:ccp(166, 321)];
    [manager addWayPoint:6 wayPoint:ccp(166, 153)];
    [manager addWayPoint:6 wayPoint:ccp(299, 153)];
    [manager addWayPoint:6 wayPoint:ccp(299, 99)];
    [manager addWayPoint:6 wayPoint:ccp(481, 99)];
    
    [manager addWayPoint:7 wayPoint:ccp(397, 321)];
    [manager addWayPoint:7 wayPoint:ccp(397, 253)];
    [manager addWayPoint:7 wayPoint:ccp(271, 253)];
    [manager addWayPoint:7 wayPoint:ccp(271, 63)];
    [manager addWayPoint:7 wayPoint:ccp(481, 63)];
    
    [manager addWayPoint:8 wayPoint:ccp(412, 321)];
    [manager addWayPoint:8 wayPoint:ccp(412, 236)];
    [manager addWayPoint:8 wayPoint:ccp(284, 236)];
    [manager addWayPoint:8 wayPoint:ccp(284, 80)];
    [manager addWayPoint:8 wayPoint:ccp(481, 80)];
    
    [manager addWayPoint:9 wayPoint:ccp(427, 321)];
    [manager addWayPoint:9 wayPoint:ccp(427, 220)];
    [manager addWayPoint:9 wayPoint:ccp(299, 220)];
    [manager addWayPoint:9 wayPoint:ccp(299, 99)];
    [manager addWayPoint:9 wayPoint:ccp(481, 99)];
}

- (void) initFriendly:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (BOOL) isWhite:(CGPoint)point
{
    if (point.x > 0 && point.x < 130 && point.y > 183 && point.y < 214) {
        return YES;
    }
    
    if (point.x > 122 && point.x < 181 && point.y > 110 && point.y < 320) {
        return YES;
    }
    
    if (point.x > 122 && point.x < 280 && point.y > 110 && point.y < 168) {
        return YES;
    }
    
    if (point.x > 256 && point.x < 315 && point.y > 56 && point.y < 269) {
        return YES;
    }
    
    if (point.x > 383 && point.x < 442 && point.y > 210 && point.y < 269) {
        return YES;
    }
    
    if (point.x > 256 && point.x < 442 && point.y > 210 && point.y < 269) {
        return YES;
    }
    
    if (point.x > 256 && point.x < 480 && point.y > 56 && point.y < 114) {
        return YES;
    }
    
    return NO;
}

@end
