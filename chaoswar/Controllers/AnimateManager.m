#import "AnimateManager.h"
#import "GameController.h"

@implementation AnimateManager

+ (void) initAnimate:(NSString*)fileName
{
    // 添加配置文件
    CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
    [cache addSpriteFramesWithFile:[NSString stringWithFormat:@"%@.plist", fileName]];        
    // 添加图片文件
    CCSpriteBatchNode *sheet = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"%@.png", fileName]];
    GameController *gc = [GameController getGameController];
    [gc.gameBackground addChild:sheet];
}

+ (void) initBoss01
{
    [AnimateManager initAnimate:@"bs01"];
}

+ (void) initBoss02
{
    [AnimateManager initAnimate:@"bs021"];
    [AnimateManager initAnimate:@"bs022"];
}

+ (void) initFly01
{
    [AnimateManager initAnimate:@"fl01"];
}

+ (void) initFly02
{
    [AnimateManager initAnimate:@"fl02"];
}

+ (void) initFly03
{
    [AnimateManager initAnimate:@"fl03"];
}

+ (void) initShooter01
{
    [AnimateManager initAnimate:@"st01"];
}

+ (void) initMagic01
{
    [AnimateManager initAnimate:@"mc01"];
}

+ (void) initMagic02
{
    [AnimateManager initAnimate:@"mc02"];
}

+ (void) initFoot01
{
    [AnimateManager initAnimate:@"ft01"];
}

+ (void) initFoot02
{
    [AnimateManager initAnimate:@"ft02"];
}

+ (void) initFoot03
{
    [AnimateManager initAnimate:@"ft03"];
}

+ (void) initFoot04
{
    [AnimateManager initAnimate:@"ft04"];
}

+ (void) initFoot05
{
    [AnimateManager initAnimate:@"ft05"];
}

+ (void) initFoot06
{
    [AnimateManager initAnimate:@"ft06"];
}

+ (void) initFoot07
{
    [AnimateManager initAnimate:@"ft07"];
}

+ (void) initFoot08
{
    [AnimateManager initAnimate:@"ft08"];
}

+ (void) initFoot09
{
    [AnimateManager initAnimate:@"ft09"];
}

+ (void) initFoot10
{
    [AnimateManager initAnimate:@"ft10"];
}

+ (void) initFoot11
{
    [AnimateManager initAnimate:@"ft11"];
}

+ (void) initFoot12
{
    [AnimateManager initAnimate:@"ft12"];
}

+ (void) initFoot13
{
    [AnimateManager initAnimate:@"ft13"];
}

+ (void) initFoot14
{
    [AnimateManager initAnimate:@"ft14"];
}

+ (void) initFoot15
{
    [AnimateManager initAnimate:@"ft15"];
}

+ (void) initFoot16
{
    [AnimateManager initAnimate:@"ft16"];
}

+ (void) initDefenceTower01
{
    [AnimateManager initAnimate:@"dt01"];
    [AnimateManager initAnimate:@"dtf01"];
}

+ (void) initDefenceTower02
{
    [AnimateManager initAnimate:@"dt02"];
    [AnimateManager initAnimate:@"dtf02"];
}

+ (void) initDefenceTower03
{
    [AnimateManager initAnimate:@"dt03"];
    [AnimateManager initAnimate:@"dtf03"];
}

+ (void) initTurretTower01
{
    [AnimateManager initAnimate:@"tt01"];
}

+ (void) initTurretTower02
{
    [AnimateManager initAnimate:@"tt02"];
}

+ (void) initTurretTower03
{
    [AnimateManager initAnimate:@"tt03"];
}

+ (void) initTurretBullet
{
    [AnimateManager initAnimate:@"ttat"];
}

+ (void) initMagicTower01
{
    [AnimateManager initAnimate:@"mt01"];
}

+ (void) initMagicTower02
{
    [AnimateManager initAnimate:@"mt02"];
}

+ (void) initMagicTower03
{
    [AnimateManager initAnimate:@"mt03"];
}

+ (void) initMagicFriendly01
{
    [AnimateManager initAnimate:@"mcf01"];
}

+ (void) initMagicFriendly02
{
    [AnimateManager initAnimate:@"mcf02"];
    [AnimateManager initAnimate:@"mcf02bu"];
}

+ (void) initForeverFriendly01
{
    [AnimateManager initAnimate:@"fcf01"];
}

+ (void) initMagicFire
{
    [AnimateManager initAnimate:@"mcfire"];
}

+ (void) initMagicThunder
{
    [AnimateManager initAnimate:@"mcthunder"];
}

+ (void) initMagicStone
{
    [AnimateManager initAnimate:@"mcstone"];
}

+ (void) initAllEffect
{
    //魔法效果
    [AnimateManager initAnimate:@"mcef"];
    //选择框
    [AnimateManager initAnimate:@"spSel"];
    //聚集位置
    [AnimateManager initAnimate:@"dtpo"];
}

@end
