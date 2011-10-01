//
//  LoadingSence.h
//  chaoswar
//
//  Created by apple on 11-10-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@interface LoadingSence : CCLayer {
    CCSprite *bgImg;
    CCSpriteBatchNode *spritebatchLoading;
	CCSprite *spriteLoading;
	CCAnimation *animationLoading;
    int pointNum;
}

@property int pointNum;

+(CCScene *) scene:(int)pn;;
-(void) goToGameSence;


@end
