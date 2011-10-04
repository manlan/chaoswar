//
//  TDSprite.h
//  chaoswar
//
//  Created by Mac on 11-10-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface TDSprite : CCSprite <CCTargetedTouchDelegate>{
    //是否已经被删除
    BOOL isDelete;
    int killNum;
    int goldNum;
}

@property BOOL isDelete;
@property int killNum;
@property int goldNum;

+ (id) getSprite;

- (BOOL) run;

- (void) spriteTouchBegan:(UITouch *)touch;

- (void) spriteTouchMoved:(UITouch *)touch;

- (void) spriteTouchEnded:(UITouch *)touch;

@end
