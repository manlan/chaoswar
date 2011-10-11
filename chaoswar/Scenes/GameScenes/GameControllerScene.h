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
    CCMenu *btnBuild1Menu;
    // 防御塔
	CCMenu *btnBuild2Menu;
    // 炮塔
    CCMenu *btnBuild3Menu;
    // 魔法塔
    CCMenu *btnBuild4Menu;
    // 升级
    CCMenu *btnUpdateMenu;
    // 卖掉
    CCMenu *btnSellMenu;
    // 聚集地
    CCMenu *btnZoneMenu;
}

@property (nonatomic, assign) CCMenu *btnBuild1Menu;
@property (nonatomic, assign) CCMenu *btnBuild2Menu;
@property (nonatomic, assign) CCMenu *btnBuild3Menu;
@property (nonatomic, assign) CCMenu *btnBuild4Menu;
@property (nonatomic, assign) CCMenu *btnUpdateMenu;
@property (nonatomic, assign) CCMenu *btnSellMenu;
@property (nonatomic, assign) CCMenu *btnZoneMenu;

- (void) setBuild1MenuStatus;
- (void) setBuild2MenuStatus;
- (void) setBuild3MenuStatus;
- (void) setBuild4MenuStatus;
- (void) setUpdateMenuStatus;
- (void) setSellMenuStatus;
- (void) setZoneMenuStatus;

- (void) clearSceneSrpite;

@end
