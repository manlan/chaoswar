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
@property (nonatomic, assign) NSMutableArray *enemyArray;
@property (nonatomic, assign) NSMutableArray *towerArray;
@property (nonatomic, assign) NSMutableArray *bulletArray;
@property (nonatomic, assign) NSMutableArray *frientlyArray;
@property (nonatomic, assign) WayManager *wayManager;
@property (nonatomic, assign) Pointer *pt;
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

- (void) initController:(int)p;

- (void) start;

- (void) restart;

- (void) stopGame;

- (void) setGameStatus;

- (void) startNextWave;

@end
