//
//  GameController.h
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GameBackgroundScene;
@class GameImfomationScene;
@class GameMagicScene;
@class GameControllerScene;

@interface GameController : NSObject {
    GameBackgroundScene *gameBackground;
	GameImfomationScene *gameImfomation;
    GameMagicScene *gameMagic;
    GameControllerScene *gameController;
	NSMutableArray *bulletArray;
	NSMutableArray *towerArray;
	NSMutableArray *enemyArray;
    NSMutableArray *friendlyArray;
	NSMutableArray *waypointArray;
	NSMutableArray *waveArray;
	UIPanGestureRecognizer *gestureRecognizer;
}

@property (nonatomic, retain) GameBackgroundScene *gameBackground;
@property (nonatomic, retain) GameImfomationScene *gameImfomation;
@property (nonatomic, retain) GameMagicScene *gameMagic;
@property (nonatomic, retain) GameControllerScene *gameController;
@property (nonatomic, retain) NSMutableArray *bulletArray;
@property (nonatomic, retain) NSMutableArray *towerArray;
@property (nonatomic, retain) NSMutableArray *enemyArray;
@property (nonatomic, retain) NSMutableArray *friendlyArray;
@property (nonatomic, retain) NSMutableArray *waypointArray;
@property (nonatomic, retain) NSMutableArray *waveArray;
@property (nonatomic, retain) UIPanGestureRecognizer *gestureRecognizer;

+ (GameController*) getGameController;

- (void) initController;

@end
