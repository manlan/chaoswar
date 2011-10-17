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
