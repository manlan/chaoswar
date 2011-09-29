//
//  SelectSence.h
//  Defend
//
//  Created by apple on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@interface SelectSence : CCLayer {
    CCSprite *bgImg;
    CCMenuItemImage *btnBack;
	CCMenuItemImage *btnUpdata;
    NSMutableDictionary *wavesInfo;
}

+(CCScene *) scene;
@end
