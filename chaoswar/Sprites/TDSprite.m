#import "TDSprite.h"
#import "GameController.h"
#import "GameControllerScene.h"
#import "DataController.h"
#import "SpriteInfoScene.h"
#import "TDTower.h"
#import "TDEnemy.h"
#import "TDFriendly.h"

const TDSprite *_lastSprite = nil;

@implementation TDSprite

@synthesize costGold = _costGold;
@synthesize getGold = _getGold;
@synthesize spriteStatus = _spriteStatus;
@synthesize maxHP = _maxHP;
@synthesize currentHP = _currentHP;
@synthesize killNum = _killNum;
@synthesize canClick = _canClick;
@synthesize showBlood = _showBlood;
@synthesize baseZOrder = _baseZOrder;
@synthesize bloodShowSprite = _bloodShowSprite;
@synthesize bloodBackSprite = _bloodBackSprite;
@synthesize arrowSprite = _arrowSprite;
@synthesize spritePlace = _spritePlace;
@synthesize isSelected = _isSelected;

+ (id) getSprite
{
    return nil;
}

+ (id) getCurrentSprite
{
    return _lastSprite;
}

+ (void) delCurrentSprite
{
    if (_lastSprite) {
        
        [_lastSprite doUnSelect];
        _lastSprite = nil;
    }
}

- (BOOL) run
{
    [_bloodShowSprite setScaleY:TDS_BLOOD_SCALE];
    [_bloodBackSprite setScaleY:TDS_BLOOD_SCALE];
    _bloodShowSprite.position = ccp(0, self.textureRect.size.height + 10);
    _bloodBackSprite.position = ccp(0, self.textureRect.size.height + 10);
    [_bloodShowSprite setVisible:_showBlood];
    [_bloodBackSprite setVisible:_showBlood];
    return YES;
}

- (BOOL) stop
{
    [self cleanup];
    return YES;
}

-(id) init
{
	if( (self=[super init])) {
        [DataController setNewEnemyAddOne:[NSString stringWithUTF8String:object_getClassName(self)]];
        _isSelected = NO;
        //初始化属性
        _costGold = 0;
        _getGold = 0;
        _spriteStatus = TSS_NORMAL;
        _maxHP = 0;
        _currentHP = 0;
        _killNum = 0;
        _canClick = YES;
        _showBlood = NO;
        _baseZOrder = 100;
        _spritePlace = SP_FOOT;
        //初始化血条，选择标记，魔法动画等
        _bloodShowSprite = [CCSprite spriteWithFile:@"showProgress.png"];
        _bloodShowSprite.anchorPoint = ccp(0, 0);
        [self addChild:_bloodShowSprite z:2];
        
        _bloodBackSprite = [CCSprite spriteWithFile:@"lifeProgressBG.png"];
        _bloodBackSprite.anchorPoint = ccp(0, 0);
        [self addChild:_bloodBackSprite z:1];
        
        _arrowSprite = [CCSprite spriteWithFile:@"spSel.png"];
        //[CCSprite spriteWithSpriteFrameName:@"spSel0001.png"];
        _arrowSprite.anchorPoint = ccp(0.5, 0.5);
        

//        [_arrowSprite runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:arrowAni restoreOriginalFrame:NO]]];
        [self addChild:_arrowSprite z:3];
        
        _effectSprite = [CCSprite spriteWithFile:@"spSel.png"];
        _effectSprite.anchorPoint = ccp(0.5, 0);
        [self addChild:_effectSprite z:10];
        
        [_effectSprite setVisible:NO];
        [_bloodShowSprite setVisible:_showBlood];
        [_bloodBackSprite setVisible:_showBlood];
        [_arrowSprite setVisible:NO];
        [self initAnimate];
	}
	return self;
}

- (void) setShowBlood:(BOOL)showBlood
{
    _showBlood = showBlood;
    if (_bloodShowSprite) {
        [_bloodShowSprite setVisible:_showBlood];
    }
    if (_bloodBackSprite) {
        [_bloodBackSprite setVisible:_showBlood];
    }
}

- (void) dealloc
{
    if (_lastSprite == self) {
        _isSelected = NO;
        _lastSprite = nil;
        [[GameController getGameController].spriteInfo removeAllChildrenWithCleanup:YES];
    }
//    [_bloodShowSprite removeFromParentAndCleanup:YES];
//    [_bloodBackSprite removeFromParentAndCleanup:YES];
//    [_arrowSprite removeFromParentAndCleanup:YES];
	[super dealloc];
}

- (void) initAnimate
{
    
}

- (void) onClick
{
    
}

- (void) doSelect
{
    _isSelected = YES;
    _arrowSprite.position = ccp(self.textureRect.size.width / 2, self.textureRect.size.height + 20);
    _arrowSprite.scale = 0.35;
    [_arrowSprite setVisible:YES];
    [_arrowSprite runAction:[CCRepeatForever actionWithAction:[CCBlink actionWithDuration:0.5 blinks:1]]];
    _isSelected = YES;
    _lastSprite = self;
    [[GameController getGameController].spriteInfo removeAllChildrenWithCleanup:YES];
    [self showImformation];
}

- (void) doUnSelect
{
    _isSelected = NO;
    [[GameController getGameController].spriteInfo removeAllChildrenWithCleanup:YES];
    [_arrowSprite stopAllActions];
    [_arrowSprite setVisible:NO];
    if ([GameController getGameController]) {
        if ([GameController getGameController].gameController) {
            [[GameController getGameController].gameController clearSceneSrpite];
        }
    }
}

- (CGRect) tdTouchRect
{
	return CGRectMake(-self.textureRect.size.width * self.anchorPoint.x, -self.textureRect.size.height * self.anchorPoint.y, self.textureRect.size.width, self.textureRect.size.height);
}

- (void) onEnter
{
    if (_canClick) {
        [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    }
	[super onEnter];
}

- (void) onExit
{
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
	[super onExit];
}	

- (BOOL) containsTouchLocation:(UITouch *)touch
{
	return CGRectContainsPoint([self tdTouchRect], [self convertTouchToNodeSpaceAR:touch]);
}

- (BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	if ( ![self containsTouchLocation:touch] ) return NO;
    if (self.spriteStatus != TSS_NORMAL) return NO;
    if (_arrowSprite) {
        if (_lastSprite) {
            [_lastSprite doUnSelect];
        }
        if ([GameController getGameController].operateType == OT_NORMAL) {
            [self doSelect];
        }
    }
	switch ([GameController getGameController].screenClickType) {
		case SCT_ALL:
            [self spriteTouchBegan:touch operateType:[GameController getGameController].operateType];
			break;
		case SCT_ALLSPRITE:
			if ([self isKindOfClass:[TDSprite class]]) {
				[self spriteTouchBegan:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_TOWER:
			if ([self isKindOfClass:[TDTower class]]) {
				[self spriteTouchBegan:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_UNIT:
			if ([self isKindOfClass:[TDUnit class]]) {
				[self spriteTouchBegan:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_ENEMY:
			if ([self isKindOfClass:[TDEnemy class]]) {
				[self spriteTouchBegan:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_FRIENDLY:
			if ([self isKindOfClass:[TDFriendly class]]) {
				[self spriteTouchBegan:touch operateType:[GameController getGameController].operateType];
			}
			break;
		default:
			return NO;
			break;
	}
	return YES;
}

- (void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
	switch ([GameController getGameController].screenClickType) {
		case SCT_ALL:
			[self spriteTouchMoved:touch operateType:[GameController getGameController].operateType];
			break;
		case SCT_ALLSPRITE:
			if ([self isKindOfClass:[TDSprite class]]) {
				[self spriteTouchMoved:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_TOWER:
			if ([self isKindOfClass:[TDTower class]]) {
				[self spriteTouchMoved:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_UNIT:
			if ([self isKindOfClass:[TDUnit class]]) {
				[self spriteTouchMoved:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_ENEMY:
			if ([self isKindOfClass:[TDEnemy class]]) {
				[self spriteTouchMoved:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_FRIENDLY:
			if ([self isKindOfClass:[TDFriendly class]]) {
				[self spriteTouchMoved:touch operateType:[GameController getGameController].operateType];
			}
			break;
		default:
			break;
	}
}

- (void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
	switch ([GameController getGameController].screenClickType) {
		case SCT_ALL:
			[self spriteTouchEnded:touch operateType:[GameController getGameController].operateType];
			break;
		case SCT_ALLSPRITE:
			if ([self isKindOfClass:[TDSprite class]]) {
				[self spriteTouchEnded:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_TOWER:
			if ([self isKindOfClass:[TDTower class]]) {
				[self spriteTouchEnded:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_UNIT:
			if ([self isKindOfClass:[TDUnit class]]) {
				[self spriteTouchEnded:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_ENEMY:
			if ([self isKindOfClass:[TDEnemy class]]) {
				[self spriteTouchEnded:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_FRIENDLY:
			if ([self isKindOfClass:[TDFriendly class]]) {
				[self spriteTouchEnded:touch operateType:[GameController getGameController].operateType];
			}
			break;
		default:
			break;
	}
}

- (void) spriteTouchBegan:(UITouch *)touch operateType:(TOperateType)operateType
{

}

- (void) spriteTouchMoved:(UITouch *)touch operateType:(TOperateType)operateType
{
	
}

- (void) spriteTouchEnded:(UITouch *)touch operateType:(TOperateType)operateType
{
	
}

- (void) setCurrentHP:(int)currentHP
{
    _currentHP = currentHP;
    if (_spriteStatus != TSS_NORMAL) {
        return;
    }
    float scalex = self.textureRect.size.width / 100;
    [_bloodBackSprite setScaleX:scalex];
    scalex = scalex * _currentHP / _maxHP;
    [_bloodShowSprite setScaleX:scalex];    
}

- (void) statusToNormal {

}

- (void) statusToDeading {
    //[self removeAllChildrenWithCleanup:YES];
}

- (void) statusToDead {
    [self removeAllChildrenWithCleanup:YES];
    [self cleanup];
    [self removeFromParentAndCleanup:YES];
    [[GameController getGameController].enemyArray removeObject:self];
    [[GameController getGameController].towerArray removeObject:self];
    [[GameController getGameController].bulletArray removeObject:self];
    [[GameController getGameController].frientlyArray removeObject:self];
}

- (void) clearSpriteData
{

}

- (void) setSpriteStatus:(TSpriteStatus)spriteStatus
{
    if (_spriteStatus != spriteStatus) {
        _spriteStatus = spriteStatus;
        switch (_spriteStatus) {
            case TSS_NORMAL:
                [self statusToNormal];
                break;
            case TSS_DEADING:
                [self clearSpriteData];
                [self statusToDeading];
                break;
            case TSS_DEAD:
                [self clearSpriteData];
                [self statusToDead];
                break;
            default:
                break;
        }
    }
}

- (CCMenuItemImage*) addButton:(NSString*)normal selected:(NSString*)selected disabled:(NSString*)disabled sel:(SEL)sel pos:(CGPoint)pos
{
    CCMenuItemImage *menuItem = [CCMenuItemImage itemFromNormalImage:normal selectedImage:selected disabledImage:disabled target:self selector:sel];
    [menuItem setScale:TDS_MENU_SCALE];
    CCMenu *menu = [CCMenu menuWithItems:menuItem, nil];
    [menu setOpacity:MENU_OPACITY];
    menu.position = pos;
    [[GameController getGameController].gameController addChild:menu z:TDS_MENU_Z];
    return menuItem;
}

-(void) setPosition: (CGPoint)newPosition
{
    [super setPosition:newPosition];
    if (self.parent) {
        CCNode *p = self.parent;
        CGSize size = [[CCDirector sharedDirector] winSize];
        [self removeFromParentAndCleanup:NO];
        [p addChild:self z:size.height - newPosition.y + _baseZOrder];
    }
}

- (CCAnimation*) getAnimate:(NSString*)name
{
    return [[GameController getGameController] getAnimation:name];
}

- (void) showImformation {

}

- (void) unshowImformation {
    [[GameController getGameController].spriteInfo removeAllChildrenWithCleanup:YES];
}

- (CGPoint)headPoint {
    return ccp(self.position.x + self.textureRect.size.width / 2, self.position.y + self.textureRect.size.height);
}

@end
