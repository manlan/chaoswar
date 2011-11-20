#import "cocos2d.h"

@interface UpdataSence : CCLayer {
    CCSprite *bgImg;
    CCSprite *tipImg;
    CCMenuItemImage *btnBack;
    CCMenuItemImage *btnUpdata;
    CCMenuItemImage *btnReset;
    int itemId;
    //NSMutableDictionary *updataInfo;
    //NSMutableDictionary *publicInfo;
    CCSprite *scoreTip;
    //CCLabelAtlas *scoreAtlas;
    CCSprite *itemIcon;
    
    CCLabelTTF *labelLevel;
    CCLabelTTF *labelExplain;
    CCLabelTTF *labelScore;
    
    CCSpriteBatchNode *spritebatchXz;
	CCSprite *spriteXz;
	CCAnimation *animationXz;
    
    CCSpriteBatchNode *spritebatchSj;
	CCSprite *spriteSj;
	CCAnimation *animationSj;
    
    BOOL gLock;
}

+(CCScene *) scene;
-(void) updataJnById:(int) jnId;
@end
