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

@synthesize btnGo;
@synthesize btnMagic1;
@synthesize btnMagic2;
@synthesize btnMagic3;
@synthesize btnMagic4;

-(id) init
{
	if( (self=[super init])) {
        btnMagic1 = nil;
        btnMagic2 = nil;
        btnMagic3 = nil;
        btnMagic4 = nil;
		//GameController *gc = [GameController getGameController];
		//下一波
		btnGo = [CCMenuItemImage itemFromNormalImage:@"go_normal.png" selectedImage:@"go_normal.png"  
									   disabledImage:@"go_black.png"  target:self selector:@selector(GoNext:)];
		CCMenu *btnGoMenu = [CCMenu menuWithItems:btnGo, nil];
		btnGoMenu.position = ccp(448 , 20);
		[self addChild:btnGoMenu z:2];
	}
	return self;
}

- (void) setMagic:(int)JN1 JN2:(int)JN2
{
    switch (JN1) {
        case 1:
            btnMagic1 = [self addButton:JN1 selector:@selector(Magic1:) point:MAGIC1_POS];
            break;
        case 2:
            btnMagic2 = [self addButton:JN1 selector:@selector(Magic2:) point:MAGIC1_POS];
            break;
        case 3:
            btnMagic3 = [self addButton:JN1 selector:@selector(Magic3:) point:MAGIC1_POS];
            break;
        case 4:
            btnMagic4 = [self addButton:JN1 selector:@selector(Magic4:) point:MAGIC1_POS];
            break;
        default:
            break;
    }
    
    switch (JN2) {
        case 1:
            btnMagic1 = [self addButton:JN2 selector:@selector(Magic1:) point:MAGIC2_POS];
            break;
        case 2:
            btnMagic2 = [self addButton:JN2 selector:@selector(Magic2:) point:MAGIC2_POS];
            break;
        case 3:
            btnMagic3 = [self addButton:JN2 selector:@selector(Magic3:) point:MAGIC2_POS];
            break;
        case 4:
            btnMagic4 = [self addButton:JN2 selector:@selector(Magic4:) point:MAGIC2_POS];
            break;
        default:
            break;
    }
}

- (CCMenuItemImage*) addButton:(int)magicNum selector:(SEL)sel point:(CGPoint)point
{
    NSString * jn = [NSString stringWithFormat:@"jN%03d.png", magicNum];
    NSString * jnHUI = [NSString stringWithFormat:@"jN%03dHui.png", magicNum];
    CCMenuItemImage *btnMagic = [CCMenuItemImage itemFromNormalImage:jn selectedImage:jn disabledImage:jnHUI target:self selector:sel];
    [btnMagic setScale:0.75];
    CCMenu *btnMagicMenu = [CCMenu menuWithItems:btnMagic, nil];
    btnMagicMenu.position = point;
    [self addChild:btnMagicMenu z:4];
	return btnMagic;
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
    [gc setGameStatus];
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
    [gc setGameStatus];
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
    [gc setGameStatus];
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
    [gc setGameStatus];
}

- (void) setGoMenuStatus
{
    GameController *gc = [GameController getGameController];
    if (!gc.canNext) {
        [btnGo setIsEnabled:NO];
        return;
    }
    
    if ([CCDirector sharedDirector].isPaused) {
        [btnGo setIsEnabled:NO];
        return;
    }
    
    [btnGo setIsEnabled:YES];
}

- (void) setMagic1MenuStatus
{
    if (!btnMagic1) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL && gc.operateType != OT_MAGIC_FIRE) {
        [btnMagic1 setIsEnabled:NO];
        return;
    }
    
    if ([CCDirector sharedDirector].isPaused) {
        [btnMagic1 setIsEnabled:NO];
        return;
    }
    
    [btnMagic1 setIsEnabled:YES];
}

- (void) setMagic2MenuStatus
{
    if (!btnMagic2) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL && gc.operateType != OT_MAGIC_FRIENDLY) {
        [btnMagic2 setIsEnabled:NO];
        return;
    }
    
    if ([CCDirector sharedDirector].isPaused) {
        [btnMagic2 setIsEnabled:NO];
        return;
    }
    
    [btnMagic2 setIsEnabled:YES];
}

- (void) setMagic3MenuStatus
{
    if (!btnMagic3) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL && gc.operateType != OT_MAGIC_STOP) {
        [btnMagic3 setIsEnabled:NO];
        return;
    }
    
    if ([CCDirector sharedDirector].isPaused) {
        [btnMagic3 setIsEnabled:NO];
        return;
    }
    
    [btnMagic3 setIsEnabled:YES];
}

- (void) setMagic4MenuStatus
{
    if (!btnMagic4) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL && gc.operateType != OT_MAGIC_THUNDER) {
        [btnMagic4 setIsEnabled:NO];
        return;
    }
    
    if ([CCDirector sharedDirector].isPaused) {
        [btnMagic4 setIsEnabled:NO];
        return;
    }
    
    [btnMagic4 setIsEnabled:YES];
}

@end
