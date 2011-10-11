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
    CCMenu *btnGoMenu;
	CCMenu *btnMagic1Menu;
	CCMenu *btnMagic2Menu;
    CCMenu *btnMagic3Menu;
    CCMenu *btnMagic4Menu;
}

@property (nonatomic, assign) CCMenu *btnGoMenu;
@property (nonatomic, assign) CCMenu *btnMagic1Menu;
@property (nonatomic, assign) CCMenu *btnMagic2Menu;
@property (nonatomic, assign) CCMenu *btnMagic3Menu;
@property (nonatomic, assign) CCMenu *btnMagic4Menu;

- (void) setMagic:(int)JN1 JN2:(int)JN2;

- (CCMenu*) addButton:(int)magicNum selector:(SEL)sel point:(CGPoint)point;

- (void) setGoMenuStatus;
- (void) setMagic1MenuStatus;
- (void) setMagic2MenuStatus;
- (void) setMagic3MenuStatus;
- (void) setMagic4MenuStatus;

@end
