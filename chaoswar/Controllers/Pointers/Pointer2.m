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
	gc.currentGold = 120;
	gc.screenClickType = SCT_ALL;
	gc.operateType = OT_NORMAL;
	gc.mapType = MT_GREEN;
	gc.canNext = YES;
}

- (void) initEnemy:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (void) initTower:(NSMutableArray*)array
{
    [array removeAllObjects];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(191, 146) s:CGPointZero];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(248, 146) s:CGPointZero];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(248, 205) s:CGPointZero];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(70, 110) s:CGPointZero];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(88, 230) s:CGPointZero];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(372, 153) s:CGPointZero];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(372, 100) s:CGPointZero];
}

- (BOOL) runWaves:(int)wave
{
    GameController *gc = [GameController getGameController];
	switch (wave) {
		case 1:
            [self runWave:1 e:ET_FOOT2 s:2 t:3 wy:[gc.wayManager getWay:3]];
            [self runWave:1.5 e:ET_FOOT2 s:2 t:2 wy:[gc.wayManager getWay:1]];
            [self prepareNextWave:15];
			break;
        case 2:
            [self runWave:1 e:ET_FOOT2 s:2 t:3 wy:[gc.wayManager getWay:1]];
            [self runWave:1.5 e:ET_FOOT3 s:2 t:2 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:22];
			break;
        case 3:
            [self runWave:1.5 e:ET_FOOT2 s:2 t:3 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT3 s:2 t:4 wy:[gc.wayManager getWay:2]];
            [self runWave:1.5 e:ET_FOOT2 s:2 t:3 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:22];
			break;
        case 4:
            //new enemy
            [self runWave:1 e:ET_FOOT4 s:2 t:5 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:22];
			break;
        case 5:
            [self runWave:2 e:ET_FOOT2 s:2 t:3 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT4 s:2 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT2 s:2 t:3 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:22];
			break;
        case 6:
            //new enemy
            [self runWave:1 e:ET_FOOT5 s:2 t:5 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:22];
			break;
        case 7:
            [self runWave:2 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT5 s:2 t:5 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:22];
			break;
        case 8:
            //new enemy
            [self runWave:2 e:ET_FOOT5 s:2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_MAGIC1 s:4 t:2 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:22];
			break;
        case 9:
            [self runWave:2 e:ET_FOOT5 s:2 t:3 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_MAGIC1 s:4 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT5 s:2 t:3 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:22];
			break;
        case 10:
            [self runWave:2 e:ET_FOOT4 s:2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT5 s:2 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT4 s:2 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:22];
			break;
        case 11:
            [self runWave:2 e:ET_FOOT5 s:2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_MAGIC1 s:4 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT5 s:2 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:22];
			break;
        case 12:
            [self runWave:2 e:ET_FOOT4 s:2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_MAGIC1 s:4 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT5 s:2 t:5 wy:[gc.wayManager getWay:3]];
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
    [manager addWayPoint:1 wayPoint:ccp(-1, 208)];
    [manager addWayPoint:1 wayPoint:ccp(143, 208)];
    [manager addWayPoint:1 wayPoint:ccp(143, 122)];
    [manager addWayPoint:1 wayPoint:ccp(293, 122)];
    [manager addWayPoint:1 wayPoint:ccp(293, 256)];
    [manager addWayPoint:1 wayPoint:ccp(481, 256)];
    
    [manager addWayPoint:2 wayPoint:ccp(-1, 193)];
    [manager addWayPoint:2 wayPoint:ccp(128, 193)];
    [manager addWayPoint:2 wayPoint:ccp(128, 107)];
    [manager addWayPoint:2 wayPoint:ccp(308, 107)];
    [manager addWayPoint:2 wayPoint:ccp(308, 241)];
    [manager addWayPoint:2 wayPoint:ccp(481, 241)];
    
    [manager addWayPoint:3 wayPoint:ccp(-1, 178)];
    [manager addWayPoint:3 wayPoint:ccp(113, 178)];
    [manager addWayPoint:3 wayPoint:ccp(113, 92)];
    [manager addWayPoint:3 wayPoint:ccp(323, 92)];
    [manager addWayPoint:3 wayPoint:ccp(323, 226)];
    [manager addWayPoint:3 wayPoint:ccp(481, 226)];
}

- (void) initFriendly:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (BOOL) isWhite:(CGPoint)point
{
    if (point.x > 0 && point.x < 160 && point.y > 168 && point.y < 222) {
        return YES;
    }
    
    if (point.x > 104 && point.x < 160 && point.y > 80 && point.y < 222) {
        return YES;
    }
    
    if (point.x > 104 && point.x < 338 && point.y > 80 && point.y < 136) {
        return YES;
    }
    
    if (point.x > 282 && point.x < 338 && point.y > 80 && point.y < 270) {
        return YES;
    }
    
    if (point.x > 282 && point.x < 480 && point.y > 216 && point.y < 270) {
        return YES;
    }
    
    return NO;
}

- (void) doAutoNextWave
{
    [super doAutoNextWave];
    switch ([GameController getGameController].currentWave) {
		case 1:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 197)];
			break;
        case 2:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 197)];
			break;
        case 3:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 197)];
			break;
        case 4:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 197)];
			break;
        case 5:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 197)];
			break;
        case 6:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 197)];
			break;
        case 7:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 197)];
			break;
        case 8:
			[self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 197)];
			break;
        case 9:
			[self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 197)];
			break;
        case 10:
			[self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 197)];
			break;
        case 11:
			[self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 197)];
			break;
        case 12:

			break;
		default:
            //[self prepareNextWave:10];
			break;
	}
}

@end
