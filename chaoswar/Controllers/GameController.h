//
//  GameController.h
//  chaoswar
//
//  Created by Mac on 11-9-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Pointer.h"

@class GameBackgroundScene;
@class GameImfomationScene;
@class GameMagicScene;
@class GameControllerScene;
@class WayPointManager;
@class Wave;

@interface GameController : NSObject {
    GameBackgroundScene *gameBackground;
	GameImfomationScene *gameImfomation;	
	GameMagicScene *gameMagic;
    GameControllerScene *gameController;
	NSMutableArray *enemyArray;
	NSMutableArray *towerArray;
	NSMutableArray *waveArray;	
	NSMutableArray *bulletArray;	
	WayPointManager *waypointManager;
    NSMutableArray *magicArray;
    NSMutableArray *frientlyArray;
	UIPanGestureRecognizer *gestureRecognizer;
    Pointer *pt;
    int waveLevel;
}

@property (nonatomic, retain) GameBackgroundScene *gameBackground;
@property (nonatomic, retain) GameImfomationScene *gameImfomation;	
@property (nonatomic, retain) GameMagicScene *gameMagic;
@property (nonatomic, retain) GameControllerScene *gameController;
@property (nonatomic, retain) NSMutableArray *enemyArray;
@property (nonatomic, retain) NSMutableArray *towerArray;
@property (nonatomic, retain) NSMutableArray *waveArray;	
@property (nonatomic, retain) NSMutableArray *bulletArray;	
@property (nonatomic, retain) WayPointManager *waypointManager;
@property (nonatomic, retain) NSMutableArray *magicArray;
@property (nonatomic, retain) NSMutableArray *frientlyArray;
@property (nonatomic, retain) UIPanGestureRecognizer *gestureRecognizer;
@property (nonatomic, retain) Pointer *pt;
@property int waveLevel;

+ (GameController*) getGameController;

- (void) initController:(Pointer*)pointer;

- (void) start;

//获取当前的敌人攻击队列
- (Wave *)getCurrentWave;
//获取下一的敌人攻击队列
- (Wave *)getNextWave;

- (void) deleteUnUseSprite:(CCLayer*)scene;

- (void) showBuildButton;

- (void) spriteInfo;

@end
