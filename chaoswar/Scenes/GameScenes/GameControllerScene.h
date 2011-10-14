//
//  GameControllerScene.h
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GamePubDef.h"

@class GameController;

@interface GameControllerScene : CCLayer {
    // 箭塔
    CCMenuItemImage *btnBuild1;
    // 防御塔
	CCMenuItemImage *btnBuild2;
    // 炮塔
    CCMenuItemImage *btnBuild3;
    // 魔法塔
    CCMenuItemImage *btnBuild4;
    // 升级
    CCMenuItemImage *btnUpdate;
    // 卖掉
    CCMenuItemImage *btnSell;
    // 聚集地
    CCMenuItemImage *btnZone;
}

@property (nonatomic, assign) CCMenuItemImage *btnBuild1;
@property (nonatomic, assign) CCMenuItemImage *btnBuild2;
@property (nonatomic, assign) CCMenuItemImage *btnBuild3;
@property (nonatomic, assign) CCMenuItemImage *btnBuild4;
@property (nonatomic, assign) CCMenuItemImage *btnUpdate;
@property (nonatomic, assign) CCMenuItemImage *btnSell;
@property (nonatomic, assign) CCMenuItemImage *btnZone;

- (void) setBuild1MenuStatus;
- (void) setBuild2MenuStatus;
- (void) setBuild3MenuStatus;
- (void) setBuild4MenuStatus;
- (void) setUpdateMenuStatus;
- (void) setSellMenuStatus;
- (void) setZoneMenuStatus;

- (void) clearSceneSrpite;

@end
