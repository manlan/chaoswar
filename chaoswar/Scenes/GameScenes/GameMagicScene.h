//
//  GameMagicScene.h
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GamePubDef.h"

@class GameController;

@interface GameMagicScene : CCLayer {
    CCMenuItemImage *btnGo;
	CCMenuItemImage *btnMagic1;
	CCMenuItemImage *btnMagic2;
    CCMenuItemImage *btnMagic3;
    CCMenuItemImage *btnMagic4;
}

@property (nonatomic, assign) CCMenuItemImage *btnGo;
@property (nonatomic, assign) CCMenuItemImage *btnMagic1;
@property (nonatomic, assign) CCMenuItemImage *btnMagic2;
@property (nonatomic, assign) CCMenuItemImage *btnMagic3;
@property (nonatomic, assign) CCMenuItemImage *btnMagic4;

- (void) setMagic:(int)JN1 JN2:(int)JN2;

- (CCMenuItemImage*) addButton:(int)magicNum selector:(SEL)sel point:(CGPoint)point;

- (void) setGoMenuStatus;
- (void) setMagic1MenuStatus;
- (void) setMagic2MenuStatus;
- (void) setMagic3MenuStatus;
- (void) setMagic4MenuStatus;

@end
