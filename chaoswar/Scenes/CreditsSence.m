//
//  CreditsSence.m
//  chaoswar
//
//  Created by apple on 11-10-7.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "CreditsSence.h"
#import "SceneManager.h"
#import "MainMenuSence.h"

@implementation CreditsSence

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	CreditsSence *layer = [CreditsSence node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
        CGSize size = [[CCDirector sharedDirector] winSize];
        //加载背景图片
		bgImg = [CCSprite spriteWithFile:@"creditsBg.png"];
		bgImg.position = CGPointMake(size.width /2 , size.height/2);
		bgImg.scale = 1;
		[self addChild:bgImg z:1];
        
        //加载返回按钮
		btnBack = [[CCMenuItemImage alloc] initFromNormalImage:@"btnBack.png" selectedImage:@"btnBackDown.png" disabledImage:@"btnBack.png" target:self selector:@selector(goToMainMenuSence:)];		
        CCMenu *btnBackMenu = [CCMenu menuWithItems:btnBack, nil];
		btnBackMenu.position = CGPointMake(415 , 40);
		[self addChild:btnBackMenu z:2];
		[btnBack release];
	}
	return self;
}

-(void) goToMainMenuSence:(id) sender 
{
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransFadeDown:0.56f layer:[MainMenuSence node]]];
}

- (void) dealloc
{
	[super dealloc];
}

@end
