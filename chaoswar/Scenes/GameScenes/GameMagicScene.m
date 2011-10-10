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

@synthesize btnRestartMenu;
@synthesize btnMagic1Menu;
@synthesize btnMagic2Menu;

-(id) init
{
	if( (self=[super init])) {
		GameController *gc = [GameController getGameController];
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
            btnMagic1Menu = [self addButton:JN1 selector:@selector(Magic1:) point:ccp(MAGIC_BTN1_X , MAGIC_BTN_Y)];
            break;
        case 2:
            btnMagic1Menu = [self addButton:JN1 selector:@selector(Magic2:) point:ccp(MAGIC_BTN1_X , MAGIC_BTN_Y)];
            break;
        case 3:
            btnMagic1Menu = [self addButton:JN1 selector:@selector(Magic3:) point:ccp(MAGIC_BTN1_X , MAGIC_BTN_Y)];
            break;
        case 4:
            btnMagic1Menu = [self addButton:JN1 selector:@selector(Magic4:) point:ccp(MAGIC_BTN1_X , MAGIC_BTN_Y)];
            break;
        default:
            break;
    }
    
    switch (JN2) {
        case 1:
            btnMagic2Menu = [self addButton:JN2 selector:@selector(Magic1:) point:ccp(MAGIC_BTN2_X , MAGIC_BTN_Y)];
            break;
        case 2:
            btnMagic2Menu = [self addButton:JN2 selector:@selector(Magic2:) point:ccp(MAGIC_BTN2_X , MAGIC_BTN_Y)];
            break;
        case 3:
            btnMagic2Menu = [self addButton:JN2 selector:@selector(Magic3:) point:ccp(MAGIC_BTN2_X , MAGIC_BTN_Y)];
            break;
        case 4:
            btnMagic2Menu = [self addButton:JN2 selector:@selector(Magic4:) point:ccp(MAGIC_BTN2_X , MAGIC_BTN_Y)];
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

-(void) Magic1:(id) sender 
{
	NSLog(@"Magic1");
}

-(void) Magic2:(id) sender 
{
	NSLog(@"Magic2");
}

-(void) Magic3:(id) sender 
{
	NSLog(@"Magic3");
}

-(void) Magic4:(id) sender
{
	NSLog(@"Magic4");
}

-(void) GoNext:(id) sender 
{
	GameController *gc = [GameController getGameController];
	[gc strartNextWave];
}

@end
