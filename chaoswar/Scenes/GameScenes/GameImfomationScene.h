//
//  GameImfomationScene.h
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//
//  显示基本信息，和


#import <Foundation/Foundation.h>
#import "GamePubDef.h"

@class GameController;

@interface GameImfomationScene : CCLayer {
	CCMenuItemImage *btnPause;
    CCLabelTTF *lblEnemyNum;
    CCLabelTTF *lblWave;
    CCLabelTTF *lblGold;
}

@property (nonatomic, assign) CCMenuItemImage *btnPause;
@property (nonatomic, assign) CCLabelTTF *lblEnemyNum;
@property (nonatomic, assign) CCLabelTTF *lblWave;
@property (nonatomic, assign) CCLabelTTF *lblGold;

- (void) setPauseMenuStatus;
- (void) setEnemyNumValue;
- (void) setWaveValue;
- (void) setGoldValue;

@end
