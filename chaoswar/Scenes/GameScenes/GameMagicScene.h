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
    
}

- (void) setMagic:(int)JN1 JN2:(int)JN2;

- (void) addButton:(int)magicNum selector:(SEL)sel point:(CGPoint)point;

@end
