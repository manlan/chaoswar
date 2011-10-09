//
//  LoadingSence.h
//  chaoswar
//
//  Created by apple on 11-10-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "GamePubDef.h"

@interface LoadingSence : CCLayer {
    CCSprite *bgImg;
    CCSpriteBatchNode *spritebatchLoading;
	CCSprite *spriteLoading;
	CCAnimation *animationLoading;
	int intJN001;
	int intJN002;
	int guanKa;
}

@property int intJN001;
@property int intJN002;
@property int guanKa;

+(CCScene *) scene:(int)gk JN1:(int)JN1 JN2:(int)JN2;
-(void) goToGameSence;


@end
