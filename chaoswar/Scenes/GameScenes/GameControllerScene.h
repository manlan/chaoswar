#import <Foundation/Foundation.h>
#import "GamePubDef.h"

@class GameController;

@interface GameControllerScene : CCLayer {

}

@property (nonatomic, assign) CCMenuItemImage *btnBuild1;
@property (nonatomic, assign) CCMenuItemImage *btnBuild2;
@property (nonatomic, assign) CCMenuItemImage *btnBuild3;
@property (nonatomic, assign) CCMenuItemImage *btnBuild4;
@property (nonatomic, assign) CCMenuItemImage *btnUpdate;
@property (nonatomic, assign) CCMenuItemImage *btnSell;
@property (nonatomic, assign) CCMenuItemImage *btnZone;

- (void) setBuild1MenuStatus;
- (void) setBuild2MenuStatus;
- (void) setBuild3MenuStatus;
- (void) setBuild4MenuStatus;
- (void) setUpdateMenuStatus;
- (void) setSellMenuStatus;
- (void) setZoneMenuStatus;

- (void) clearSceneSrpite;

@end
