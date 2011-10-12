//
//  GameMagicScene.m
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "GameMagicScene.h"
#import "GameHintScene.h"
#import "GameController.h"

@implementation GameMagicScene

@synthesize btnGoMenu;
@synthesize btnMagic1Menu;
@synthesize btnMagic2Menu;
@synthesize btnMagic3Menu;
@synthesize btnMagic4Menu;

-(id) init
{
	if( (self=[super init])) {
        btnMagic1Menu = nil;
        btnMagic2Menu = nil;
        btnMagic3Menu = nil;
        btnMagic4Menu = nil;
		//GameController *gc = [GameController getGameController];
		//下一波
		CCMenuItemImage *btnGo = [CCMenuItemImage itemFromNormalImage:@"go_normal.png" selectedImage:@"go_normal.png"  
									   disabledImage:@"go_black.png"  target:self selector:@selector(GoNext:)];
		btnGoMenu = [CCMenu menuWithItems:btnGo, nil];
		btnGoMenu.position = ccp(448 , 20);
		[self addChild:btnGoMenu z:2];
	}
	return self;
}

- (void) setMagic:(int)JN1 JN2:(int)JN2
{
    switch (JN1) {
        case 1:
            btnMagic1Menu = [self addButton:JN1 selector:@selector(Magic1:) point:MAGIC1_POS];
            break;
        case 2:
            btnMagic2Menu = [self addButton:JN1 selector:@selector(Magic2:) point:MAGIC1_POS];
            break;
        case 3:
            btnMagic3Menu = [self addButton:JN1 selector:@selector(Magic3:) point:MAGIC1_POS];
            break;
        case 4:
            btnMagic4Menu = [self addButton:JN1 selector:@selector(Magic4:) point:MAGIC1_POS];
            break;
        default:
            break;
    }
    
    switch (JN2) {
        case 1:
            btnMagic1Menu = [self addButton:JN2 selector:@selector(Magic1:) point:MAGIC2_POS];
            break;
        case 2:
            btnMagic2Menu = [self addButton:JN2 selector:@selector(Magic2:) point:MAGIC2_POS];
            break;
        case 3:
            btnMagic3Menu = [self addButton:JN2 selector:@selector(Magic3:) point:MAGIC2_POS];
            break;
        case 4:
            btnMagic4Menu = [self addButton:JN2 selector:@selector(Magic4:) point:MAGIC2_POS];
            break;
        default:
            break;
    }
}

- (CCMenu*) addButton:(int)magicNum selector:(SEL)sel point:(CGPoint)point
{
    NSString * jn = [NSString stringWithFormat:@"jN%03d.png", magicNum];
    NSString * jnHUI = [NSString stringWithFormat:@"jN%03dHui.png", magicNum];
    CCMenuItemImage *btnMagic = [CCMenuItemImage itemFromNormalImage:jn selectedImage:jn disabledImage:jnHUI target:self selector:sel];
    [btnMagic setScale:0.75];
    CCMenu *btnMagicMenu = [CCMenu menuWithItems:btnMagic, nil];
    btnMagicMenu.position = point;
    [self addChild:btnMagicMenu z:4];
	return btnMagicMenu;
}

//==============火雨=================
-(void) Magic1:(id) sender 
{
    GameController *gc = [GameController getGameController];
    if (gc.operateType == OT_MAGIC_FIRE) {
        gc.operateType = OT_NORMAL;
        gc.screenClickType = SCT_ALL;
    } else {
        gc.operateType = OT_MAGIC_FIRE;
        gc.screenClickType = SCT_ONLYWHITE;
    }
}

//==============盟军=================
-(void) Magic2:(id) sender 
{
	GameController *gc = [GameController getGameController];
    if (gc.operateType == OT_MAGIC_FRIENDLY) {
        gc.operateType = OT_NORMAL;
        gc.screenClickType = SCT_ALL;
    } else {
        gc.operateType = OT_MAGIC_FRIENDLY;
        gc.screenClickType = SCT_ONLYWHITE;
    }
}

//==============静止=================
-(void) Magic3:(id) sender 
{
	GameController *gc = [GameController getGameController];
    if (gc.operateType == OT_MAGIC_STOP) {
        gc.operateType = OT_NORMAL;
        gc.screenClickType = SCT_ALL;
    } else {
        gc.operateType = OT_MAGIC_STOP;
        gc.screenClickType = SCT_ENEMY;
    }
}

//==============雷电=================
-(void) Magic4:(id) sender
{
	GameController *gc = [GameController getGameController];
    if (gc.operateType == OT_MAGIC_THUNDER) {
        gc.operateType = OT_NORMAL;
        gc.screenClickType = SCT_ALL;
    } else {
        gc.operateType = OT_MAGIC_THUNDER;
        gc.screenClickType = SCT_ENEMY;
    }
}

-(void) GoNext:(id) sender 
{
	GameController *gc = [GameController getGameController];
	[gc startNextWave];
}

- (void) setGoMenuStatus
{
    if ([CCDirector sharedDirector].isPaused) {
        [btnGoMenu setIsTouchEnabled:NO];
        return;
    }
    
    [btnGoMenu setIsTouchEnabled:YES];
}

- (void) setMagic1MenuStatus
{
    if (!btnMagic1Menu) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL && gc.operateType != OT_MAGIC_FIRE) {
        [btnMagic1Menu setIsTouchEnabled:NO];
        return;
    }
    
    if ([CCDirector sharedDirector].isPaused) {
        [btnMagic1Menu setIsTouchEnabled:NO];
        return;
    }
    
    [btnMagic1Menu setIsTouchEnabled:YES];
}

- (void) setMagic2MenuStatus
{
    if (!btnMagic2Menu) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL && gc.operateType != OT_MAGIC_FRIENDLY) {
        [btnMagic2Menu setIsTouchEnabled:NO];
        return;
    }
    
    if ([CCDirector sharedDirector].isPaused) {
        [btnMagic2Menu setIsTouchEnabled:NO];
        return;
    }
    
    [btnMagic2Menu setIsTouchEnabled:YES];
}

- (void) setMagic3MenuStatus
{
    if (!btnMagic3Menu) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL && gc.operateType != OT_MAGIC_STOP) {
        [btnMagic3Menu setIsTouchEnabled:NO];
        return;
    }
    
    if ([CCDirector sharedDirector].isPaused) {
        [btnMagic3Menu setIsTouchEnabled:NO];
        return;
    }
    
    [btnMagic3Menu setIsTouchEnabled:YES];
}

- (void) setMagic4MenuStatus
{
    if (!btnMagic4Menu) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL && gc.operateType != OT_MAGIC_THUNDER) {
        [btnMagic4Menu setIsTouchEnabled:NO];
        return;
    }
    
    if ([CCDirector sharedDirector].isPaused) {
        [btnMagic4Menu setIsTouchEnabled:NO];
        return;
    }
    
    [btnMagic4Menu setIsTouchEnabled:YES];
}

@end
