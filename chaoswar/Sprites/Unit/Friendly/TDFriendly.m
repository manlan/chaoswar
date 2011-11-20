#import "TDFriendly.h"
#import "TDDefenceTower.h"
#import "TDFlyEnemy.h"

@implementation TDFriendly

@synthesize enemy = _enemy;
@synthesize shootBulletArray = _shootBulletArray;
@synthesize enemyBulletArray = _enemyBulletArray;
@synthesize attactEnemyArray = _attactEnemyArray;
@synthesize mvAniName = _mvAniName;
@synthesize searchPoint = _searchPoint;

-(id) init
{
	if( (self=[super init])) {
        _shootBulletArray = [[NSMutableArray alloc] init];
        _enemyBulletArray = [[NSMutableArray alloc] init];
        _attactEnemyArray = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void) dealloc
{
    self.enemy = nil;
    [_shootBulletArray removeAllObjects];
    [_enemyBulletArray removeAllObjects];
    [_attactEnemyArray removeAllObjects];
    [_shootBulletArray release];
    [_enemyBulletArray release];
    [_attactEnemyArray release];
    [_mvAniName release];
	[super dealloc];
}

- (void) setEnemy:(TDEnemy *)enemy
{
    if (_enemy) {
        [_enemy delFriendly:self];
        _enemy.unitStatus = US_NORMAL;
    }
    _enemy = enemy;
    if (_enemy) {
    } else {
        [self doUnitLogic];
    }
}

- (void) clearSpriteData
{
    [TDEnemy unregFriendly:self];
    [super clearSpriteData];
    NSMutableArray *tmpArray = nil;
    //攻击的敌人清空
    self.enemy = nil;
    //发射的子弹清空
    tmpArray = [NSMutableArray arrayWithArray:_shootBulletArray];
    for (TDFriendlyBullet *t in tmpArray) t.shooter = nil;
    [tmpArray removeAllObjects];
    //攻击的子弹清空
    tmpArray = [NSMutableArray arrayWithArray:_enemyBulletArray];
    for (TDEnemyBullet *t in tmpArray) t.enemy = nil;
    [tmpArray removeAllObjects];
    //被攻击的敌军清空
    tmpArray = [NSMutableArray arrayWithArray:_attactEnemyArray];
    for (TDEnemy *t in tmpArray) [t delFriendly:self];
    [tmpArray removeAllObjects];
}

- (BOOL) run
{
    if ([super run] == NO) return NO;
    [TDEnemy regFriendly:self];
    return YES;
}

- (void) doUnitLogic {
    if (!_enemy) {
        [self goToSearchPoint];
    }
}

//回聚集点（搜索点）
- (void) goToSearchPoint {
    [self stopAllActions];
    [self setFlipX:NO];
    if ((self.searchPoint.x != self.position.x)
        || (self.searchPoint.y != self.position.y)) {
        double curDistance = ccpDistance(self.position, self.searchPoint);
        ccTime speed = curDistance / self.moveSpeed;
        if (self.position.x > self.searchPoint.x) {
            [self setFlipX:YES];
        }
        [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:[self getAnimate:self.mvAniName] restoreOriginalFrame:NO]]];
        id actionMove = [CCMoveTo actionWithDuration:speed position:self.searchPoint];
        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(afterToSearchPoint:)];
        [self runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
    }
}

-(void) afterToSearchPoint:(id)sender {
    [self doUnitLogic];
}

- (void) AttactEnemy:(TDEnemy*)e
{
    if (e == _enemy) {
        return;
    }
    if (![self canAttactEnemy:e]) {
        return;
    }
    
    if (!_enemy) {
        [self doAttactEnemy:e];
        return;
    }
    
    if ([_enemy.friendlyArray count] > 1) {
        if ([e.friendlyArray count] == 0) {
            [self doAttactEnemy:e];
            return;
        }
    }
}

- (void) doAttactEnemy:(TDEnemy*)e
{
    [self stopAllActions];
    [self setFlipX:NO];
    self.enemy = e;
    _enemy.unitStatus = US_WAITING;
    CGPoint position = _enemy.position;
    ccTime speed = 0;
    if (CCRANDOM_0_1() < 0.5f) {
        position.x = position.x - 10;
        double curDistance = ccpDistance(self.position, position);
        speed = curDistance / self.moveSpeed;
        position = [_enemy getPositionAfterTime:speed];
    } else {
        position.x = position.x + 10;
        double curDistance = ccpDistance(self.position, position);
        speed = curDistance / self.moveSpeed;
        position = [_enemy getPositionAfterTime:speed];
    }
    
    if (self.position.x > position.x) {
        [self setFlipX:YES];
    }
    
    [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:[self getAnimate:self.mvAniName] restoreOriginalFrame:NO]]];
    id actionMove = [CCMoveTo actionWithDuration:speed position:position];
    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(afterMove:)];
    [self runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

- (BOOL) canAttactEnemy:(TDEnemy*)e
{
    if ([e isKindOfClass:[TDFlyEnemy class]]) {
        return NO;
    }
	return YES;
}

-(void) afterMove:(id)sender {
    _enemy.unitStatus = US_ATTACT;
    [self doAttact:0];
    [self schedule:@selector(doAttact:) interval:self.attacttime];
}

- (void) doAttact:(ccTime)dt {
    [self stopAllActions];
    [self setFlipX:NO];
    CGPoint position = self.enemy.position;
    if (self.position.x > position.x) {
        [self setFlipX:YES];
    }
    
    id actionAttact = [CCAnimate actionWithAnimation:[self getAnimate:self.atAniName] restoreOriginalFrame:NO];
	id actionAttactDone = [CCCallFuncN actionWithTarget:self selector:@selector(afterAttact:)];
	[self runAction:[CCSequence actions:actionAttact, actionAttactDone, nil]];
}

-(void) afterAttact:(id)sender {
    [_enemy beAttact:self an:self.attact at:self.attactMode];
    if (!_enemy) {
        [self cleanup];
        [self doUnitLogic];
    }
}

@end
