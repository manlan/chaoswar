//
//  TDSprite.m
//  chaoswar
//
//  Created by Mac on 11-10-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "TDSprite.h"
#import "GameController.h"
#import "GameControllerScene.h"
#import "TDTower.h"
#import "TDEnemy.h"
#import "TDFriendly.h"

@implementation TDSprite

@synthesize costGold = _costGold;
@synthesize getGold = _getGold;
@synthesize isDelete = _isDelete;
@synthesize maxHP = _maxHP;
@synthesize currentHP = _currentHP;
@synthesize killNum = _killNum;
@synthesize canClick = _canClick;
@synthesize showBlood = _showBlood;
@synthesize bloodShowSprite = _bloodShowSprite;
@synthesize bloodBackSprite = _bloodBackSprite;
@synthesize arrowSprite = _arrowSprite;

+ (id) getSprite
{
    return nil;
}

- (BOOL) run
{
    return YES;
}

-(id) init
{
	if( (self=[super init])) {
        _costGold = 0;
        _getGold = 0;
        _isDelete = NO;
        _maxHP = 0;
        _currentHP = 0;
        _killNum = 0;
        _showBlood = NO;
        _canClick = YES;
        _bloodShowSprite = [CCSprite spriteWithFile:@"liftprogress.png"];
        _bloodShowSprite.position = ccp(-1,  -1);
        _bloodShowSprite.anchorPoint = ccp(0, 0);
        [_bloodShowSprite setScaleX:0.5];
        [self addChild:_bloodShowSprite z:1];
        
        
        _arrowSprite = [CCSprite spriteWithFile:@"selected.png"];
        _arrowSprite.position = ccp(80,  80);
        [self addChild:_arrowSprite z:1];
        
        [_bloodShowSprite setVisible:YES];
        [_arrowSprite setVisible:YES];
        [self initAnimate];
	}
	return self;
}

- (void) dealloc
{
//    [bloodSprite release];
//    [arrowSprite release];
	[super dealloc];
}

- (void) initAnimate
{
    
}

- (void) onClick
{
}

- (CGRect)rect
{
	return CGRectMake(-rect_.size.width / 2, -rect_.size.height / 2, rect_.size.width, rect_.size.height);
}

- (void) onEnter
{
    if (_canClick) {
        [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
        if (_arrowSprite) {
            [_arrowSprite setVisible:YES];
        }
    }
	[super onEnter];
}

- (void) onExit
{
    if (_canClick) {
        [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
        if (_arrowSprite) {
            [_arrowSprite setVisible:NO];
        }
    }
	[super onExit];
}	

- (BOOL) containsTouchLocation:(UITouch *)touch
{
	return CGRectContainsPoint(self.rect, [self convertTouchToNodeSpaceAR:touch]);
}

- (BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	if ( ![self containsTouchLocation:touch] ) return NO;
	switch ([GameController getGameController].screenClickType) {
		case SCT_ALL:
            [self spriteTouchBegan:touch operateType:[GameController getGameController].operateType];
			break;
		case SCT_ALLSPRITE:
			if ([self isMemberOfClass:[TDSprite class]]) {
				[self spriteTouchBegan:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_TOWER:
			if ([self isMemberOfClass:[TDTower class]]) {
				[self spriteTouchBegan:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_UNIT:
			if ([self isMemberOfClass:[TDUnit class]]) {
				[self spriteTouchBegan:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_ENEMY:
			if ([self isMemberOfClass:[TDEnemy class]]) {
				[self spriteTouchBegan:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_FRIENDLY:
			if ([self isMemberOfClass:[TDFriendly class]]) {
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
			if ([self isMemberOfClass:[TDSprite class]]) {
				[self spriteTouchMoved:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_TOWER:
			if ([self isMemberOfClass:[TDTower class]]) {
				[self spriteTouchMoved:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_UNIT:
			if ([self isMemberOfClass:[TDUnit class]]) {
				[self spriteTouchMoved:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_ENEMY:
			if ([self isMemberOfClass:[TDEnemy class]]) {
				[self spriteTouchMoved:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_FRIENDLY:
			if ([self isMemberOfClass:[TDFriendly class]]) {
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
			if ([self isMemberOfClass:[TDSprite class]]) {
				[self spriteTouchEnded:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_TOWER:
			if ([self isMemberOfClass:[TDTower class]]) {
				[self spriteTouchEnded:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_UNIT:
			if ([self isMemberOfClass:[TDUnit class]]) {
				[self spriteTouchEnded:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_ENEMY:
			if ([self isMemberOfClass:[TDEnemy class]]) {
				[self spriteTouchEnded:touch operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_FRIENDLY:
			if ([self isMemberOfClass:[TDFriendly class]]) {
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

- (CCMenuItemImage*) addButton:(NSString*)normal selected:(NSString*)selected disabled:(NSString*)disabled sel:(SEL)sel pos:(CGPoint)pos
{
    CCMenuItemImage *menuItem = [CCMenuItemImage itemFromNormalImage:normal selectedImage:selected disabledImage:disabled target:self selector:sel];
    //[menuItem setScale:0.75];
    CCMenu *menu = [CCMenu menuWithItems:menuItem, nil];
    [menu setOpacity:MENU_OPACITY];
    menu.position = pos;
    [[GameController getGameController].gameController addChild:menu z:2];
    return menuItem;
}

@end
