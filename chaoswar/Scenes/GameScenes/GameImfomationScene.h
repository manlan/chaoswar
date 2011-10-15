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

}

@property (nonatomic, readonly) CCMenuItemImage *btnPause;
@property (nonatomic, readonly) CCLabelTTF *lblEnemyNum;
@property (nonatomic, readonly) CCLabelTTF *lblWave;
@property (nonatomic, readonly) CCLabelTTF *lblGold;

- (void) setPauseMenuStatus;
- (void) setEnemyNumValue;
- (void) setWaveValue;
- (void) setGoldValue;

@end
