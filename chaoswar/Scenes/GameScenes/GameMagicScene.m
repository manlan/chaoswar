//
//  GameMagicScene.m
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "GameMagicScene.h"


@implementation GameMagicScene

-(id) init
{
	if( (self=[super init])) {
		CCMenuItemImage *btnMagic1 = [CCMenuItemImage itemFromNormalImage:@"magic05.png" selectedImage:@"magic05.png"  
										  disabledImage:@"magic05.png"  target:self selector:@selector(Magic1:)];
		CCMenu *btnMagicMenu1 = [CCMenu menuWithItems:btnMagic1, nil];
		btnMagicMenu1.position = ccp(44 , 28);
		[self addChild:btnMagicMenu1 z:2];
		
		//下一波
		CCMenuItemImage *btnMagic2 = [CCMenuItemImage itemFromNormalImage:@"magic06.png" selectedImage:@"magic06.png"  
										  disabledImage:@"magic06.png"  target:self selector:@selector(Magic2:)];
		CCMenu *btnMagicMenu2 = [CCMenu menuWithItems:btnMagic2, nil];
		btnMagicMenu2.position = ccp(106 , 28);
		[self addChild:btnMagicMenu2 z:2];
	}
	return self;
}

-(void) Magic1:(id) sender 
{
	
}

-(void) Magic2:(id) sender 
{
	
}

@end
