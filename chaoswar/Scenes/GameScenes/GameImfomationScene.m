//
//  GameImfomationScene.m
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "GameImfomationScene.h"


@implementation GameImfomationScene

-(id) init
{
	if( (self=[super init])) {
        //CGSize size = [[CCDirector sharedDirector] winSize];
        //加载暂停按钮
        [CCMenuItemFont setFontSize:12];
		btnPause = [CCMenuItemFont itemFromString:@"暂停" target:self selector:@selector(pauseGame:)];	
        CCMenu *btnPauseMenu = [CCMenu menuWithItems:btnPause, nil];
		btnPauseMenu.position = CGPointMake(420 , 300);
		[self addChild:btnPauseMenu z:1];
    }
	return self;
}

-(void) pauseGame:(id) sender 
{
    NSLog(@"click pauseGame");
}

@end
