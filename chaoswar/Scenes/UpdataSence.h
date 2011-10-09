//
//  UpdataSence.h
//  Defend
//
//  Created by apple on 11-9-14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "GamePubDef.h"

@interface UpdataSence : CCLayer {
    CCSprite *bgImg;
    CCSprite *tipImg;
    CCMenuItemImage *btnBack;
    CCMenuItemImage *btnUpdata;
    int itemId;
    //NSMutableDictionary *updataInfo;
    //NSMutableDictionary *publicInfo;
    CCSprite *scoreTip;
    //CCLabelAtlas *scoreAtlas;
    CCSprite *itemIcon;
    
    CCLabelTTF *labelLevel;
    CCLabelTTF *labelExplain;
    CCLabelTTF *labelScore;
    
    CCSpriteBatchNode *spritebatchXz;
	CCSprite *spriteXz;
	CCAnimation *animationXz;
    
    CCSpriteBatchNode *spritebatchSj;
	CCSprite *spriteSj;
	CCAnimation *animationSj;
    
    BOOL gLock;
}

+(CCScene *) scene;
-(void) updataJnById:(int) jnId;
@end
