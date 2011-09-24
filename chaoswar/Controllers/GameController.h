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
	NSMutableArray *waypointArray;
    NSMutableArray *magicArray;
    NSMutableArray *frientlyArray;
	UIPanGestureRecognizer *gestureRecognizer;
    id<Pointer> *pt;
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
@property (nonatomic, retain) NSMutableArray *waypointArray;
@property (nonatomic, retain) NSMutableArray *magicArray;
@property (nonatomic, retain) NSMutableArray *frientlyArray;
@property (nonatomic, retain) UIPanGestureRecognizer *gestureRecognizer;
@property int waveLevel;

+ (GameController*) getGameController;

- (void) initController:(id<Pointer>*)pointer;

//获取当前的敌人攻击队列
- (Wave *)getCurrentWave;
//获取下一的敌人攻击队列
- (Wave *)getNextWave;

- (void) deleteUnUseSprite:(CCLayer*)scene;

- (void) showBuildButton;

- (void) spriteInfo;

@end
