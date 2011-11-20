#import <Foundation/Foundation.h>
#import "GamePubDef.h"

@class GameController;

//显示永远不会变化位置的信息

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
