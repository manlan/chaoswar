//
//  UpdataSence.h
//  Defend
//
//  Created by apple on 11-9-14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@interface UpdataSence : CCLayer {
    CCSprite *bgImg;
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
}

+(CCScene *) scene;
@end
