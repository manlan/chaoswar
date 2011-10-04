//
//  GameImfomationScene.m
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "GameImfomationScene.h"
#import "GameHintScene.h"
#import "GameController.h"

@implementation GameImfomationScene

-(id) init
{
	if( (self=[super init])) {
        //CGSize size = [[CCDirector sharedDirector] winSize];
		//暂停
		btnPause = [CCMenuItemImage itemFromNormalImage:@"pause_black.png" selectedImage:@"pause_normal.png"  
										  disabledImage:@"pause_black.png"  target:self selector:@selector(pauseGame:)];
		CCMenu *btnPauseMenu = [CCMenu menuWithItems:btnPause, nil];
		btnPauseMenu.position = ccp(446 , 300);
		[self addChild:btnPauseMenu z:2];
		
		//下一波
		btnGo = [CCMenuItemImage itemFromNormalImage:@"go_normal.png" selectedImage:@"go_normal.png"  
									   disabledImage:@"go_black.png"  target:self selector:@selector(GoNext:)];
		CCMenu *btnGoMenu = [CCMenu menuWithItems:btnGo, nil];
		btnGoMenu.position = ccp(448 , 20);
		[self addChild:btnGoMenu z:2];
		
		//背景
		CCSprite *bottom = [CCSprite spriteWithFile:@"bottom_bg.png"];
		bottom.position = ccp(240 , 15);
		[self addChild:bottom z:1];
		
		//防御漏兵
		CCSprite *xueTip = [CCSprite spriteWithFile:@"xueTip.png"];
		xueTip.position = ccp(260 , 300);
		[self addChild:xueTip z:1];
		
		//金额
		CCSprite *qianTip = [CCSprite spriteWithFile:@"qianTip.png"];
		qianTip.position = ccp(316 , 300);
		[self addChild:qianTip z:1];
		
		//波数
		CCSprite *wavesTip = [CCSprite spriteWithFile:@"wavesTip.png"];
		wavesTip.position = ccp(370 , 300);
		[self addChild:wavesTip z:1];

		//技能背景
		CCSprite *jiNengBg = [CCSprite spriteWithFile:@"jiNengBg.png"];
		jiNengBg.position = ccp(75 , 20);
		[self addChild:jiNengBg z:2];
    }
	return self;
}

-(void) pauseGame:(id) sender 
{
	GameController *gc = [GameController getGameController];
	[gc.gameHint removeAllChildrenWithCleanup:YES];
	//背景
	CCSprite *pauseBg = [CCSprite spriteWithFile:@"pauseBg.png"];
	pauseBg.position = ccp(240 , 160);
	[gc.gameHint addChild:pauseBg z:1];
	
	//继续
	CCMenuItemImage *btnResume = [CCMenuItemImage itemFromNormalImage:@"btnResume.png" selectedImage:@"btnResume.png"  
									  disabledImage:@"btnResume.png"  target:self selector:@selector(GoNext:)];
	CCMenu *btnResumeMenu = [CCMenu menuWithItems:btnResume, nil];
	btnResumeMenu.position = ccp(240 , 160);
	[gc.gameHint addChild:btnResumeMenu z:2];
	
	//菜单
	CCMenuItemImage *btnMenu = [CCMenuItemImage itemFromNormalImage:@"btnMenu.png" selectedImage:@"btnMenu.png"  
														disabledImage:@"btnMenu.png"  target:self selector:@selector(GoNext:)];
	CCMenu *btnMenuMenu = [CCMenu menuWithItems:btnMenu, nil];
	btnResumeMenu.position = ccp(240 , 160);
	[gc.gameHint addChild:btnMenuMenu z:2];
	
	//重来
	CCMenuItemImage *btnRestart = [CCMenuItemImage itemFromNormalImage:@"btnRestart.png" selectedImage:@"btnRestart.png"  
													  disabledImage:@"btnRestart.png"  target:self selector:@selector(GoNext:)];
	CCMenu *btnRestartMenu = [CCMenu menuWithItems:btnRestart, nil];
	btnRestartMenu.position = ccp(240 , 160);
	[gc.gameHint addChild:btnRestartMenu z:2];
}

-(void) GoNext:(id) sender 
{
	GameController *gc = [GameController getGameController];
	[gc.gameHint removeAllChildrenWithCleanup:YES];
}

@end
