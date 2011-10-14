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

@synthesize costGold;
@synthesize getGold;
@synthesize isDelete;
@synthesize maxHP;
@synthesize currentHP;
@synthesize killNum;
@synthesize canClick;
@synthesize showBlood;
@synthesize bloodSprite;
@synthesize arrowSprite;

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
        self.costGold = 0;
        self.getGold = 0;
        self.isDelete = NO;
        self.maxHP = 0;
        self.currentHP = 0;
        self.killNum = 0;
        self.showBlood = NO;
        self.canClick = YES;
        [self initAnimate];
	}
	return self;
}

- (void) dealloc
{
    [bloodSprite release];
    [arrowSprite release];
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
    if (canClick) {
        [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
        if (arrowSprite) {
            [arrowSprite setVisible:YES];
        }
    }
	[super onEnter];
}

- (void) onExit
{
    if (canClick) {
        [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
        if (arrowSprite) {
            [arrowSprite setVisible:NO];
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
