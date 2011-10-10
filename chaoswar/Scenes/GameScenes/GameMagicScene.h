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
    CCMenu *btnRestartMenu;
	CCMenu *btnMagic1Menu;
	CCMenu *btnMagic2Menu;
}

@property (nonatomic, assign) CCMenu *btnRestartMenu;
@property (nonatomic, assign) CCMenu *btnMagic1Menu;
@property (nonatomic, assign) CCMenu *btnMagic2Menu;

- (void) setMagic:(int)JN1 JN2:(int)JN2;

- (CCMenu*) addButton:(int)magicNum selector:(SEL)sel point:(CGPoint)point;

@end
