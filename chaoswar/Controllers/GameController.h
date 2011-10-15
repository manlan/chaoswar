//
//  GameController.h
//  chaoswar
//
//  Created by Mac on 11-9-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GamePubDef.h"

@class GameBackgroundScene;
@class GameImfomationScene;
@class GameMagicScene;
@class GameControllerScene;
@class GameHintScene;
@class Pointer;
@class WayManager;
@class Wave;

@interface GameController : NSObject {

}

@property (nonatomic, assign) GameBackgroundScene *gameBackground;
@property (nonatomic, assign) GameImfomationScene *gameImfomation;
@property (nonatomic, assign) GameMagicScene *gameMagic;
@property (nonatomic, assign) GameControllerScene *gameController;
@property (nonatomic, assign) GameHintScene *gameHint;
@property (nonatomic, retain) NSMutableArray *enemyArray;
@property (nonatomic, retain) NSMutableArray *towerArray;
@property (nonatomic, retain) NSMutableArray *bulletArray;
@property (nonatomic, retain) NSMutableArray *frientlyArray;
@property (nonatomic, retain) WayManager *wayManager;
@property (nonatomic, retain) Pointer *pt;
@property int maxWave;
@property int currentWave;
@property int currentHealth;
@property int currentGold;
@property TScreenClickType screenClickType;
@property TOperateType operateType;
@property TMapType mapType;
@property BOOL canNext;

+ (GameController*) getGameController;

+ (void) delGameController;

- (void) initController:(Pointer*)pointer;

- (void) start;

- (void) deleteUnUseSprite:(CCLayer*)scene;

- (void) setGameStatus;

- (void) restart;

- (void) startNextWave;

@end
