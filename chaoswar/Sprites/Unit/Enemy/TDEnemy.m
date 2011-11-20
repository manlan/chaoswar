#import <Foundation/Foundation.h>
#import "TDEnemy.h"
#import "GameController.h"
#import "GameMagicScene.h"
#import "TDFriendly.h"
#import "TDBullet.h"
#import "TDDefBullet.h"
#import "TDMagicBullet.h"
#import "TDTower.h"

const NSMutableArray* regfriendlyArray = nil;

@implementation TDEnemy

@synthesize nextWayPoint = _nextWayPoint;
@synthesize way = _way;
@synthesize shootBulletArray = _shootBulletArray;
@synthesize towerBulletArray = _towerBulletArray;
@synthesize friendlyBulletArray = _friendlyBulletArray;
@synthesize magicBulletArray = _magicBulletArray;
@synthesize towerArray = _towerArray;
@synthesize friendlyArray = _friendlyArray;

-(id) init
{
	if( (self=[super init])) {
        _shootBulletArray = [[NSMutableArray alloc] init];
        _towerBulletArray = [[NSMutableArray alloc] init];
        _friendlyBulletArray = [[NSMutableArray alloc] init];
        _magicBulletArray = [[NSMutableArray alloc] init];
        _towerArray = [[NSMutableArray alloc] init];
        _friendlyArray = [[NSMutableArray alloc] init];
	}
	return self;
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
    self.way = nil;
	[super dealloc];
}

//================主要逻辑================
- (void) doUnitLogic {
    if (!self.canSchedule) {
        [self unscheduleAllSelectors];
        return;
    }
    if ([_friendlyArray count] == 0) {
        self.unitStatus = US_NORMAL;
    }
    switch (self.unitStatus) {
        case US_NORMAL:
            [self doRunning];
            break;
        case US_WAITING:
            [self doWaiting];
            break;
        case US_ATTACT:
            [self doAttact];
            break;
        default:
            break;
    }
}

- (void) doRunning
{
    self.unitStatus = US_NORMAL;
    [self schedule:@selector(doMove:)];
}

- (void) doWaiting
{
    self.unitStatus = US_WAITING;
    [self stopAllActions];
}

- (void) doAttact
{
    self.unitStatus = US_ATTACT;
    TDFriendly *f = [self canAttactFriendly];
    if (f) {
        [self schedule:@selector(startAttact:)];
    }
}
//================主要逻辑================

//================友军的操作================
+ (void) regFriendly:(TDFriendly*)f {
    if (!regfriendlyArray) {
        regfriendlyArray = [[NSMutableArray alloc] init];
    }
    [regfriendlyArray removeObject:f];
    [regfriendlyArray addObject:f];
}

+ (void) unregFriendly:(TDFriendly*)f {
    if (!regfriendlyArray) {
        regfriendlyArray = [[NSMutableArray alloc] init];
    }
    [regfriendlyArray removeObject:f];
}

- (void) addFriendly:(TDFriendly*)f {
    if (!f) {
        return;
    }
    if (([_friendlyArray indexOfObject:f] < INT_MAX)) {
        return;
    }
    [_friendlyArray addObject:f];
    if ([_friendlyArray count] == 1) {
        //交战
    }
}

- (void) delFriendly:(TDFriendly*)f {
    if (!f) {
        return;
    }
    [_friendlyArray removeObject:f];
    if ([_friendlyArray count] == 0) {
        //行走
    }
}

- (TDFriendly *)friendly {
    if ([_friendlyArray count] == 0) {
        return nil;
    }
    return [_friendlyArray objectAtIndex:0];
}

-(void) setPosition: (CGPoint)newPosition
{
    [super setPosition:newPosition];
    if (self.spriteStatus == TSS_NORMAL) {
        if (!regfriendlyArray) {
            regfriendlyArray = [[NSMutableArray alloc] init];
        }
        for (int i = 0; i < [regfriendlyArray count]; i++) {
            TDFriendly* f = [regfriendlyArray objectAtIndex:i];
            if (f.spriteStatus == TSS_NORMAL) {
                double curDistance = ccpDistance(f.searchPoint, self.position);
                if (curDistance <= f.searchRange) {
                    [f AttactEnemy:self];
                }
            }
        }
    }
}
//================友军的操作================

- (void) statusToDeading {
    [super statusToDeading];
    GameController *gc = [GameController getGameController];
    gc.currentGold = gc.currentGold + self.getGold;
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
            [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:[self getAnimate:self.mvcAniName] restoreOriginalFrame:NO]]];
        } else {
             //左
            [self setFlipX:YES];
            [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:[self getAnimate:self.mvcAniName] restoreOriginalFrame:NO]]];
        }
    } else {
        //竖走
        if (y_plus > 0) {
            //上
            [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:[self getAnimate:self.mvuAniName] restoreOriginalFrame:NO]]];
        } else {
            //下
            [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:[self getAnimate:self.mvdAniName] restoreOriginalFrame:NO]]];
        }
    }
    //移动
    double curDistance = ccpDistance(self.position, position);
    ccTime speed = curDistance / self.moveSpeed / self.speedUPNum;
    id actionMove = [CCMoveTo actionWithDuration:speed position:position];
	id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(afterMove:)];
	[self runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

- (CGPoint) getPositionAfterTime:(ccTime)dt
{
    if (self.unitStatus != US_NORMAL) {
        return self.position;
    }
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

- (void) clearSpriteData
{
    [super clearSpriteData];
    NSMutableArray *tmpArray = nil;
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
    [super spriteTouchBegan:touch operateType:operateType];
    switch (operateType) {
        case OT_NORMAL:
            break;
        case OT_MAGIC_THUNDER:
            [self doMagicThunder];
            break;
        case OT_MAGIC_STOP:
            [self doMagicStop];
            break;
        default:
            break;
    }
}

- (void) doubleAttact:(TDFriendly*)s
{
    [self stopAllActions];
    self.unitStatus = US_ATTACT;
}

- (TDFriendly*) canAttactFriendly
{
    for (TDFriendly *t in _friendlyArray) 
    {
        if (t) {
            double curDistance = ccpDistance(self.position, t.position);
            if (curDistance < 80) {
                return t;
            }
        }
    }
    return nil;
}

- (void) startAttact:(ccTime)dt {
    [self unschedule:@selector(startAttact:)];
    [self doAttact:0];
    [self schedule:@selector(doAttact:) interval:self.attacttime];
}


- (void) doAttact:(ccTime)dt {
    TDFriendly *f = [self canAttactFriendly];
    if (f) {
        CGPoint position = f.position;
        if (self.position.x > position.x) {
            [self setFlipX:YES];
        } else {
            [self setFlipX:NO];
        }
        id actionAttact = [CCAnimate actionWithAnimation:[self getAnimate:self.atAniName] restoreOriginalFrame:NO];
        id actionAttactDone = [CCCallFuncN actionWithTarget:self selector:@selector(afterAttact:)];
        [self runAction:[CCSequence actions:actionAttact, actionAttactDone, nil]];
    }
}

-(void) afterAttact:(id)sender {
    TDFriendly *f = [self canAttactFriendly];
    if (f) {
        [f beAttact:self an:self.attact at:self.attactMode];
        if (self.friendly == nil) {
            [self unschedule:@selector(doAttact:)];
        }
    }
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
    gc.screenClickType = SCT_ALL;
    gc.operateType = OT_NORMAL;
    [gc.gameMagic restartMagicThunder];
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
    gc.screenClickType = SCT_ALL;
    gc.operateType = OT_NORMAL;
    [gc.gameMagic restartMagicStop];
    [self doMagicStopStatus];
}

@end
