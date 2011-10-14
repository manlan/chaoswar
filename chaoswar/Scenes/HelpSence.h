//
//  HelpSence.h
//  chaoswar
//
//  Created by apple on 11-10-6.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@interface HelpSence : CCLayer {
    CCSprite *bgImg;
    CCMenuItemImage *btnBack;
    CCSpriteBatchNode *spritebatchXz;
	CCSprite *spriteXz;
	CCAnimation *animationXz;
    CCLabelTTF *labelExplain;
}

+(CCScene *) scene;

@end
