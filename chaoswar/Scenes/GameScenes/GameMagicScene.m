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
//		CCMenuItemImage *btnMagic1 = [CCMenuItemImage itemFromNormalImage:@"magic05.png" selectedImage:@"magic05.png"  
//										  disabledImage:@"magic05.png"  target:self selector:@selector(Magic1:)];
//		CCMenu *btnMagicMenu1 = [CCMenu menuWithItems:btnMagic1, nil];
//		btnMagicMenu1.position = ccp(44 , 28);
//		[self addChild:btnMagicMenu1 z:2];
//		
//		//下一波
//		CCMenuItemImage *btnMagic2 = [CCMenuItemImage itemFromNormalImage:@"magic06.png" selectedImage:@"magic06.png"  
//										  disabledImage:@"magic06.png"  target:self selector:@selector(Magic2:)];
//		CCMenu *btnMagicMenu2 = [CCMenu menuWithItems:btnMagic2, nil];
//		btnMagicMenu2.position = ccp(106 , 28);
//		[self addChild:btnMagicMenu2 z:2];
	}
	return self;
}

- (void) setMagic:(int)JN1 JN2:(int)JN2
{
    switch (JN1) {
        case 1:
            [self addButton:JN1 selector:@selector(Magic1:) point:ccp(44 , 28)];
            break;
        case 2:
            [self addButton:JN1 selector:@selector(Magic2:) point:ccp(44 , 28)];
            break;
        case 3:
            [self addButton:JN1 selector:@selector(Magic3:) point:ccp(44 , 28)];
            break;
        case 4:
            [self addButton:JN1 selector:@selector(Magic4:) point:ccp(44 , 28)];
            break;
        default:
            break;
    }
    
    switch (JN2) {
        case 1:
            [self addButton:JN2 selector:@selector(Magic1:) point:ccp(106 , 28)];
            break;
        case 2:
            [self addButton:JN2 selector:@selector(Magic2:) point:ccp(106 , 28)];
            break;
        case 3:
            [self addButton:JN2 selector:@selector(Magic3:) point:ccp(106 , 28)];
            break;
        case 4:
            [self addButton:JN2 selector:@selector(Magic4:) point:ccp(106 , 28)];
            break;
        default:
            break;
    }
}

- (void) addButton:(int)magicNum selector:(SEL)sel point:(CGPoint)point
{
    NSString * jn = [NSString stringWithFormat:@"jN%03d.png", magicNum];
    NSString * jnHUI = [NSString stringWithFormat:@"jN%03dHui.png", magicNum];
    CCMenuItemImage *btnMagic = [CCMenuItemImage itemFromNormalImage:jn selectedImage:jn disabledImage:jnHUI target:self selector:sel];
    [btnMagic setScale:0.75];
    CCMenu *btnMagicMenu = [CCMenu menuWithItems:btnMagic, nil];
    btnMagicMenu.position = point;
    [self addChild:btnMagicMenu z:4];
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

@end
