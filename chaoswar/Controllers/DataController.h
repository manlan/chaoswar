//
//  DataController.h
//  chaoswar
//
//  Created by apple on 11-11-8.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface DataController : NSObject {
    
}

+ (int) getUpdataLevelByTagName:(int) index;
+ (void) setFirst;
+ (void) resetGameScore;


+(int) getMagicFireLevel;
+(int) getMagicFriendlyLevel;
+(int) getMagicThunderLevel;
+(int) getMagicStoneLevel;

+(int) getArrowTowerLevel;
+(int) getDefenceTowerLevel;
+(int) getMagicTowerLevel;
+(int) getTurretTowerLevel;

@end
