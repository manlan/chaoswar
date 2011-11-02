#import <Foundation/Foundation.h>
#import "TDEnemy.h"
#import "GameController.h"
#import "TDFriendly.h"
#import "TDBullet.h"
#import "TDDefBullet.h"
#import "TDTower.h"

@implementation TDEnemy

@synthesize nextWayPoint = _nextWayPoint;
@synthesize enemyStatus = _enemyStatus;
@synthesize way = _way;
@synthesize friendly = _friendly;
@synthesize shootBulletArray = _shootBulletArray;
@synthesize towerBulletArray = _towerBulletArray;
@synthesize friendlyBulletArray = _friendlyBulletArray;
@synthesize magicBulletArray = _magicBulletArray;
@synthesize towerArray = _towerArray;
@synthesize friendlyArray = _friendlyArray;

- (BOOL) run
{
    if ([super run] == NO) return NO;
    [self schedule:@selector(doMove:)];
    return YES;
}

-(id) init
{
	if( (self=[super init])) {
        _enemyStatus = ES_NORMAL;
        _shootBulletArray = [[NSMutableArray alloc] init];
        _towerBulletArray = [[NSMutableArray alloc] init];
        _friendlyBulletArray = [[NSMutableArray alloc] init];
        _magicBulletArray = [[NSMutableArray alloc] init];
        _towerArray = [[NSMutableArray alloc] init];
        _friendlyArray = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void) statusToDeading {

}

- (void) dealloc
{
    [_shootBulletArray removeAllObjects];
    [_towerBulletArray removeAllObjects];
    [_friendlyBulletArray removeAllObjects];
    [_magicBulletArray removeAllObjects];
    [_towerArray removeAllObjects];
    [_friendlyArray removeAllObjects];
    [_shootBulletArray release];
    [_towerBulletArray release];
    [_friendlyBulletArray release];
    [_magicBulletArray release];
    [_towerArray release];
    [_friendlyArray release];
    self.friendly = nil;
    self.way = nil;
	[super dealloc];
}

- (void) doMove:(ccTime)dt {
    [self unschedule:@selector(doMove:)];
    [self setFlipX:NO];
    GameController *gc = [GameController getGameController];
    CGPoint position = self.position;
    if (_nextWayPoint >= self.way.count) {
        self.spriteStatus = TSS_DEAD;
        [self stopAllActions];
        gc.currentHealth = gc.currentHealth - 1;
        [self removeFromParentAndCleanup:YES];
    }
    WayPoint *wp = [self.way objectAtIndex:_nextWayPoint];
    position = wp.point;
    [self removeFromParentAndCleanup:NO];
    
    [gc.gameBackground addChild:self z:self.zOrder];
    //动画
    float x_plus = position.x - self.position.x;
    float y_plus = position.y - self.position.y;
    if (abs(x_plus) > abs(y_plus)) {
        //横走
        if (x_plus > 0) {
            //右
            [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:self.mvrAni restoreOriginalFrame:NO]]];
        } else {
             //左
            [self setFlipX:YES];
            [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:self.mvlAni restoreOriginalFrame:NO]]];
        }
    } else {
        //竖走
        if (y_plus > 0) {
            //上
            [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:self.mvuAni restoreOriginalFrame:NO]]];
        } else {
            //下
            [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:self.mvdAni restoreOriginalFrame:NO]]];
        }
    }
    //移动
    double curDistance = ccpDistance(self.position, position);
    ccTime speed = curDistance / self.moveSpeed;
    id actionMove = [CCMoveTo actionWithDuration:speed position:position];
	id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(afterMove:)];
	[self runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

- (CGPoint) getPositionAfterTime:(ccTime)dt
{
    CGFloat doDistance = self.moveSpeed * dt;
    CGPoint currentPos = self.position;
    CGPoint nextPos = self.position;
    int iWave = _nextWayPoint;
    while ((iWave < self.way.count)) {
        WayPoint *wp = [self.way objectAtIndex:iWave];
        nextPos = wp.point;
        CGFloat curDistance = ccpDistance(currentPos, nextPos);
        if (curDistance >= doDistance) {
            CGFloat x = nextPos.x - currentPos.x;
            x = x * doDistance;
            x = x / curDistance;
            x = currentPos.x + x;
            CGFloat y = nextPos.y - currentPos.y;
            y = y * doDistance;
            y = y / curDistance;
            y = currentPos.y + y;
            return ccp(x, y);
        }
        doDistance = doDistance - curDistance;
        currentPos = nextPos;
        iWave++;
    }
    return currentPos;
}

-(void) afterMove:(id)sender {
    _nextWayPoint++;
    [self schedule:@selector(doMove:)];
}

- (void) setFriendly:(TDFriendly *)friendly
{
    if (_friendly) {
        [_friendly.attactEnemyArray removeObject:self];
    }
    _friendly = friendly;
    if (_friendly) {
        [_friendly.attactEnemyArray addObject:self];
    }
}

- (void) clearSpriteData
{
    [super clearSpriteData];
    NSMutableArray *tmpArray = nil;
    //攻击的友军清空
    self.friendly = nil;
    //发射的子弹清空
    tmpArray = [NSMutableArray arrayWithArray:_shootBulletArray];
    for (TDEnemyBullet *t in tmpArray) t.shooter = nil;
    [tmpArray removeAllObjects];
    //被攻击的子弹清空
    tmpArray = [NSMutableArray arrayWithArray:_towerBulletArray];
    for (TDTowerBullet *t in tmpArray) t.enemy = nil;
    [tmpArray removeAllObjects];
    //被攻击的子弹清空
    tmpArray = [NSMutableArray arrayWithArray:_friendlyBulletArray];
    for (TDFriendlyBullet *t in tmpArray) t.enemy = nil;
    [tmpArray removeAllObjects];
    //被攻击的子弹清空
    tmpArray = [NSMutableArray arrayWithArray:_magicBulletArray];
    for (TDMagicBullet *t in tmpArray) t.enemy = nil;
    [tmpArray removeAllObjects];
    //被攻击的塔清空
    tmpArray = [NSMutableArray arrayWithArray:_towerArray];
    for (TDTower *t in tmpArray) t.enemy = nil;
    [tmpArray removeAllObjects];
    //被攻击的友军清空
    tmpArray = [NSMutableArray arrayWithArray:_friendlyArray];
    for (TDFriendly *t in tmpArray) t.enemy = nil;
    [tmpArray removeAllObjects];
}

- (void) spriteTouchBegan:(UITouch *)touch operateType:(TOperateType)operateType
{
    switch (operateType) {
        case OT_NORMAL:
            NSLog(@"OperateType is Nomal");
            break;
        case OT_MAGIC_FRIENDLY:
            NSLog(@"OperateType is Friendly");
            break;
        case OT_MAGIC_FIRE:
            NSLog(@"OperateType is Fire");
            break;
        case OT_MAGIC_THUNDER:
            NSLog(@"OperateType is Thunder");
            [self doMagicThunder];
            break;
        case OT_MAGIC_STOP:
            NSLog(@"OperateType is Stop");
            [self doMagicStop];
            break;
        case OT_BUILDING:
            NSLog(@"OperateType is Building");
            break;
        case OT_SELL:
            NSLog(@"OperateType is Sell");
            break;
        case OT_UPDATE:
            NSLog(@"OperateType is Update");
            break;
        case OT_SETSEARCHPOINT:
            NSLog(@"OperateType is SearchPoint");
            break;
        case OT_NONE:
            NSLog(@"OperateType is None");
            break;
        default:
            break;
    }
}

- (void) spriteTouchMoved:(UITouch *)touch operateType:(TOperateType)operateType
{
	
}

- (void) spriteTouchEnded:(UITouch *)touch operateType:(TOperateType)operateType
{
	
}

- (void) doMagicThunder
{
    GameController *gc = [GameController getGameController];
	TDThunderBullet1 *b = [TDThunderBullet1 getSprite];
    b.enemy = self;
    b.position = ccp(self.position.x, self.position.y + 100);
    [gc.gameBackground addChild:b z:60];
    [gc.bulletArray addObject:b];
    [b run];
}

- (void) doMagicStop
{
    GameController *gc = [GameController getGameController];
	TDStoneBullet1 *b = [TDStoneBullet1 getSprite];
    b.enemy = self;
    b.position = ccp(self.position.x, self.position.y + 100);
    [gc.gameBackground addChild:b z:60];
    [gc.bulletArray addObject:b];
    [b run];
}

- (void) doubleAttact:(TDFriendly*)s
{
    [self stopAllActions];
    _enemyStatus = ES_ATTACT;
    _friendly = s;
}

@end
