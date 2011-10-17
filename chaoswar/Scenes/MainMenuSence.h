#import "cocos2d.h"

@interface MainMenuSence : CCLayer {
    CCSprite *bgImg;
    CCSprite *logoImg;
	CCMenuItemImage *btnHelp;
	CCMenuItemImage *btnPlay;
	CCMenuItemImage *btnCredits;
}

+(CCScene *) scene;

@end
