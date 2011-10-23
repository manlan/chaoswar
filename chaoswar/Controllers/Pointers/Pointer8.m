#import "Pointer8.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer8

- (void) initController
{
    GameController *gc = [GameController getGameController];
	gc.maxWave = 6;
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
			[self runWave:1 e:ET_FOOT9 s:1 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT9 s:1.1 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT10 s:1.2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT10 s:1 t:5 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT11 s:1.1 t:5 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT10 s:1.2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:22];
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
    [manager addWayPoint:1 wayPoint:ccp(-1, 249) z:15];
    [manager addWayPoint:1 wayPoint:ccp(133, 249) z:15];
    [manager addWayPoint:1 wayPoint:ccp(133, 187) z:15];
    [manager addWayPoint:1 wayPoint:ccp(240, 187) z:15];
    [manager addWayPoint:1 wayPoint:ccp(240, 251) z:15];
    [manager addWayPoint:1 wayPoint:ccp(400, 251) z:15];
    [manager addWayPoint:1 wayPoint:ccp(400, 192) z:15];
    [manager addWayPoint:1 wayPoint:ccp(481, 192) z:15];
    
    [manager addWayPoint:2 wayPoint:ccp(-1, 232) z:16];
    [manager addWayPoint:2 wayPoint:ccp(120, 232) z:16];
    [manager addWayPoint:2 wayPoint:ccp(120, 171) z:16];
    [manager addWayPoint:2 wayPoint:ccp(253, 171) z:16];
    [manager addWayPoint:2 wayPoint:ccp(253, 235) z:16];
    [manager addWayPoint:2 wayPoint:ccp(380, 235) z:16];
    [manager addWayPoint:2 wayPoint:ccp(380, 176) z:16];
    [manager addWayPoint:2 wayPoint:ccp(481, 176) z:16];
    
    [manager addWayPoint:3 wayPoint:ccp(-1, 220) z:17];
    [manager addWayPoint:3 wayPoint:ccp(105, 220) z:17];
    [manager addWayPoint:3 wayPoint:ccp(105, 157) z:17];
    [manager addWayPoint:3 wayPoint:ccp(268, 157) z:17];
    [manager addWayPoint:3 wayPoint:ccp(268, 221) z:17];
    [manager addWayPoint:3 wayPoint:ccp(365, 221) z:17];
    [manager addWayPoint:3 wayPoint:ccp(365, 165) z:17];
    [manager addWayPoint:3 wayPoint:ccp(481, 165) z:17];
    
    [manager addWayPoint:4 wayPoint:ccp(-1, 118) z:15];
    [manager addWayPoint:4 wayPoint:ccp(105, 118) z:15];
    [manager addWayPoint:4 wayPoint:ccp(105, 187) z:15];
    [manager addWayPoint:4 wayPoint:ccp(268, 187) z:15];
    [manager addWayPoint:4 wayPoint:ccp(268, 120) z:15];
    [manager addWayPoint:4 wayPoint:ccp(365, 120) z:15];
    [manager addWayPoint:4 wayPoint:ccp(365, 192) z:15];
    [manager addWayPoint:4 wayPoint:ccp(481, 192) z:15];
    
    [manager addWayPoint:5 wayPoint:ccp(-1, 101) z:16];
    [manager addWayPoint:5 wayPoint:ccp(120, 101) z:16];
    [manager addWayPoint:5 wayPoint:ccp(120, 171) z:16];
    [manager addWayPoint:5 wayPoint:ccp(253, 171) z:16];
    [manager addWayPoint:5 wayPoint:ccp(253, 106) z:16];
    [manager addWayPoint:5 wayPoint:ccp(380, 106) z:16];
    [manager addWayPoint:5 wayPoint:ccp(380, 176) z:16];
    [manager addWayPoint:5 wayPoint:ccp(481, 176) z:16];
    
    [manager addWayPoint:6 wayPoint:ccp(-1, 88) z:17];
    [manager addWayPoint:6 wayPoint:ccp(133, 88) z:17];
    [manager addWayPoint:6 wayPoint:ccp(133, 158) z:17];
    [manager addWayPoint:6 wayPoint:ccp(240, 158) z:17];
    [manager addWayPoint:6 wayPoint:ccp(240, 94) z:17];
    [manager addWayPoint:6 wayPoint:ccp(393, 94) z:17];
    [manager addWayPoint:6 wayPoint:ccp(393, 165) z:17];
    [manager addWayPoint:6 wayPoint:ccp(481, 165) z:17];
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
