//
//  MainGameScene.h
//  chaoswar
//
//  Created by Mac on 11-9-4.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface MainGameScene : CCLayer {
    CCTMXTiledMap *tileMap;
    CCTMXLayer *backGround;	
}

@property (nonatomic, retain) CCTMXTiledMap *tileMap;
@property (nonatomic, retain) CCTMXLayer *backGround;

+(CCScene *) scene;

@end
