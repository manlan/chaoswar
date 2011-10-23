#import "Pointer1.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer1

- (void) initController
{
    //初始化控制器
    GameController *gc = [GameController getGameController];
    //波数
	gc.maxWave = 8;
	gc.currentWave = 0;
    //可以逃掉多少兵
	gc.currentHealth = 20;
    //初始金币
	gc.currentGold = 600;
    //这些不管
	gc.screenClickType = SCT_ALL;
	gc.operateType = OT_NORMAL;
	gc.mapType = MT_GREEN;
	gc.canNext = YES;
}

- (void) initAnimate
{
    //初始话动画，可以不管，为了节省内存，可以把不需要的关掉
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
}

- (void) initEnemy:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (void) initTower:(NSMutableArray*)array
{
    [array removeAllObjects];
    //初始化建塔地点，参数p是建塔地点的正下方的位置，而不是图片的中间位置
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(300, 128)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(233, 128)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(180, 50)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(432, 140)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(218, 248)];
}

- (BOOL) runWaves:(int)wave
{
    [super runWaves:wave];
    //出兵的控制
    GameController *gc = [GameController getGameController];
    //每一波的出兵数和顺序
    //runWave函数参数
    // runWave:等待几秒开始出兵
    // e:兵的种类
    // s:出兵后没间隔几秒出一次兵
    // t:出兵的数量
    // wy:路线，路线维护在下面
	switch (wave) {
		case 1:
            //			[self runWave:6 e:ET_FOOT1 s:1 t:10 wy:[gc.wayManager getWay:1]];
            //            [self runWave:4 e:ET_FOOT2 s:1.1 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT1 s:1.2 t:3 wy:[gc.wayManager getWay:2]];
            //prepareNextWave函数参数，等待多少秒之后，可以点击下一波
            [self prepareNextWave:15];
			break;
        case 2:
            [self runWave:1 e:ET_FOOT1 s:1.2 t:4 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT2 s:1.2 t:3 wy:[gc.wayManager getWay:1]];
            [self prepareNextWave:20];
			break;
        case 3:
            [self runWave:1 e:ET_FOOT2 s:1.2 t:5 wy:[gc.wayManager getWay:1]];
            [self prepareNextWave:20];
			break;
        case 4:
            [self runWave:1 e:ET_FOOT2 s:1.2 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:1.2 e:ET_FOOT2 s:1.2 t:5 wy:[gc.wayManager getWay:1]];
            [self prepareNextWave:20];
			break;
        case 5:
            [self runWave:2 e:ET_FOOT1 s:1.2 t:3 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT2 s:1.2 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT1 s:1.2 t:3 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:20];
			break;
        case 6:
            [self runWave:1.2 e:ET_FOOT2 s:1.2 t:3 wy:[gc.wayManager getWay:1]];
            [self runWave:1.2 e:ET_FOOT2 s:1.2 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT1 s:1.2 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:20];
			break;
        case 7:
            [self runWave:1.2 e:ET_FOOT2 s:1.2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT2 s:1.2 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:1.2 e:ET_FOOT1 s:1.2 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:20];
			break;
        case 8:
            [self runWave:1.2 e:ET_FOOT2 s:1.2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT1 s:1.2 t:6 wy:[gc.wayManager getWay:2]];
            [self runWave:1.2 e:ET_FOOT2 s:1.2 t:5 wy:[gc.wayManager getWay:3]];
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
    //每一波的出兵数和顺序
    //addWayPoint函数参数
    // addWayPoint:路线编号
    // addWayPoint:路线坐标，按顺序出的
    [manager addWayPoint:1 wayPoint:ccp(232, -1) z:15];
    [manager addWayPoint:1 wayPoint:ccp(232, 0) z:15];
    [manager addWayPoint:1 wayPoint:ccp(232, 111) z:15];
    [manager addWayPoint:1 wayPoint:ccp(350, 111) z:15];
    [manager addWayPoint:1 wayPoint:ccp(350, 201) z:17];
    [manager addWayPoint:1 wayPoint:ccp(142, 201) z:17];
    [manager addWayPoint:1 wayPoint:ccp(142, 320) z:15];
    [manager addWayPoint:1 wayPoint:ccp(142, 321) z:15];
    
    [manager addWayPoint:2 wayPoint:ccp(247, -1) z:15];
    [manager addWayPoint:2 wayPoint:ccp(247, 0) z:15];
    [manager addWayPoint:2 wayPoint:ccp(247, 96) z:17];
    [manager addWayPoint:2 wayPoint:ccp(365, 96) z:17];
    [manager addWayPoint:2 wayPoint:ccp(365, 216) z:16];
    [manager addWayPoint:2 wayPoint:ccp(157, 216) z:16];
    [manager addWayPoint:2 wayPoint:ccp(157, 320) z:15];
    [manager addWayPoint:2 wayPoint:ccp(157, 321) z:15];
    
    [manager addWayPoint:3 wayPoint:ccp(262, -1) z:15];
    [manager addWayPoint:3 wayPoint:ccp(262, 0) z:15];
    [manager addWayPoint:3 wayPoint:ccp(262, 81) z:17];
    [manager addWayPoint:3 wayPoint:ccp(380, 81) z:17];
    [manager addWayPoint:3 wayPoint:ccp(380, 231) z:15];
    [manager addWayPoint:3 wayPoint:ccp(172, 231) z:15];
    [manager addWayPoint:3 wayPoint:ccp(172, 320) z:15];
    [manager addWayPoint:3 wayPoint:ccp(172, 321) z:15];
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
