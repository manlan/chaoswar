#import "Pointer8.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer8

- (void) initController
{
    GameController *gc = [GameController getGameController];
	gc.maxWave = 14;
	gc.currentWave = 0;
	gc.currentHealth = 20;
	gc.currentGold = 320;
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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(60, 140)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(188, 206)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(188, 86)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(315, 141)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(445, 209)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(445, 86)];
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
			[self runWave:1 e:ET_FOOT4 s:2 t:3 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT4 s:2 t:3 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 3:
            //new enemy
            [self runWave:1 e:ET_FLY3 s:2 t:3 wy:[gc.wayManager getWay:2]];

            [self prepareNextWave:10];
			break;
        case 4:
			//[self runWave:1 e:ET_FLY1 s:2 t:3 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FLY2 s:2 t:3 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 5:
			//[self runWave:1 e:ET_FLY1 s:4 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:3 e:ET_FLY2 s:4 t:2 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FLY3 s:2 t:4 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 6:
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT11 s:4 t:2 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:10];
			break;
        case 7:
			[self runWave:1 e:ET_FOOT10 s:2 t:4 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT12 s:3.5 t:3 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 8:
            //new enemy
            [self runWave:1 e:ET_FOOT13 s:2 t:4 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:10];
			break;
        case 9:
			[self runWave:1 e:ET_FOOT13 s:3.5 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT9 s:2 t:5 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 10:
			[self runWave:1 e:ET_FOOT13 s:3.5 t:4 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT9 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT7 s:2 t:5 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:10];
			break;
        case 11:
            //new enemy
			[self runWave:1 e:ET_FOOT14 s:2 t:4 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:10];
			break;
        case 12:
			[self runWave:1 e:ET_FOOT13 s:3.5 t:4 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT9 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT14 s:3 t:4 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT3 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 13:
			[self runWave:1 e:ET_FOOT7 s:3 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT2 s:1.5 t:6 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT14 s:3 t:5 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT3 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:10];
			break;
        case 14:
			[self runWave:1 e:ET_FOOT13 s:2.5 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT9 s:2 t:5 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT14 s:3 t:5 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT3 s:2 t:5 wy:[gc.wayManager getWay:6]];
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
    [manager addWayPoint:1 wayPoint:ccp(-1, 243)];
    [manager addWayPoint:1 wayPoint:ccp(133, 243)];
    [manager addWayPoint:1 wayPoint:ccp(133, 181)];
    [manager addWayPoint:1 wayPoint:ccp(240, 181)];
    [manager addWayPoint:1 wayPoint:ccp(240, 245)];
    [manager addWayPoint:1 wayPoint:ccp(400, 245)];
    [manager addWayPoint:1 wayPoint:ccp(400, 186)];
    [manager addWayPoint:1 wayPoint:ccp(481, 186)];
    
    [manager addWayPoint:2 wayPoint:ccp(-1, 226)];
    [manager addWayPoint:2 wayPoint:ccp(120, 226)];
    [manager addWayPoint:2 wayPoint:ccp(120, 165)];
    [manager addWayPoint:2 wayPoint:ccp(253, 165)];
    [manager addWayPoint:2 wayPoint:ccp(253, 229)];
    [manager addWayPoint:2 wayPoint:ccp(380, 229)];
    [manager addWayPoint:2 wayPoint:ccp(380, 170)];
    [manager addWayPoint:2 wayPoint:ccp(481, 170)];
    
    [manager addWayPoint:3 wayPoint:ccp(-1, 207)];
    [manager addWayPoint:3 wayPoint:ccp(105, 207)];
    [manager addWayPoint:3 wayPoint:ccp(105, 148)];
    [manager addWayPoint:3 wayPoint:ccp(268, 148)];
    [manager addWayPoint:3 wayPoint:ccp(268, 212)];
    [manager addWayPoint:3 wayPoint:ccp(365, 212)];
    [manager addWayPoint:3 wayPoint:ccp(365, 150)];
    [manager addWayPoint:3 wayPoint:ccp(481, 150)];
    
    [manager addWayPoint:4 wayPoint:ccp(-1, 112)];
    [manager addWayPoint:4 wayPoint:ccp(105, 112)];
    [manager addWayPoint:4 wayPoint:ccp(105, 181)];
    [manager addWayPoint:4 wayPoint:ccp(268, 181)];
    [manager addWayPoint:4 wayPoint:ccp(268, 114)];
    [manager addWayPoint:4 wayPoint:ccp(365, 114)];
    [manager addWayPoint:4 wayPoint:ccp(365, 186)];
    [manager addWayPoint:4 wayPoint:ccp(481, 186)];
    
    [manager addWayPoint:5 wayPoint:ccp(-1, 95)];
    [manager addWayPoint:5 wayPoint:ccp(120, 95)];
    [manager addWayPoint:5 wayPoint:ccp(120, 165)];
    [manager addWayPoint:5 wayPoint:ccp(253, 165)];
    [manager addWayPoint:5 wayPoint:ccp(253, 100)];
    [manager addWayPoint:5 wayPoint:ccp(380, 100)];
    [manager addWayPoint:5 wayPoint:ccp(380, 170)];
    [manager addWayPoint:5 wayPoint:ccp(481, 170)];
    
    [manager addWayPoint:6 wayPoint:ccp(-1, 79)];
    [manager addWayPoint:6 wayPoint:ccp(133, 79)];
    [manager addWayPoint:6 wayPoint:ccp(133, 149)];
    [manager addWayPoint:6 wayPoint:ccp(240, 149)];
    [manager addWayPoint:6 wayPoint:ccp(240, 85)];
    [manager addWayPoint:6 wayPoint:ccp(393, 85)];
    [manager addWayPoint:6 wayPoint:ccp(393, 150)];
    [manager addWayPoint:6 wayPoint:ccp(481, 150)];
}

- (void) initFriendly:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (BOOL) isWhite:(CGPoint)point
{
    if (point.x > 0 && point.x < 154 && point.y > 201 && point.y < 259) {
        return YES;
    }
    
    if (point.x > 0 && point.x < 154 && point.y > 74 && point.y < 132) {
        return YES;
    }
    
    if (point.x > 96 && point.x < 154 && point.y > 74 && point.y < 259) {
        return YES;
    }
    
    if (point.x > 96 && point.x < 282 && point.y > 141 && point.y < 198) {
        return YES;
    }
    
    if (point.x > 225 && point.x < 282 && point.y > 76 && point.y < 262) {
        return YES;
    }
    
    if (point.x > 225 && point.x < 410 && point.y > 203 && point.y < 262) {
        return YES;
    }
    
    if (point.x > 225 && point.x < 410 && point.y > 76 && point.y < 134) {
        return YES;
    }
    
    if (point.x > 352 && point.x < 410 && point.y > 144 && point.y < 201) {
        return YES;
    }
    
    if (point.x > 352 && point.x < 410 && point.y > 76 && point.y < 262) {
        return YES;
    }
    
    return NO;
}

@end
