//
//  GameBackgroundScene.h
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Wave.h"
#import "Enemy.h"
#import "Tower.h"

@interface GameBackgroundScene : CCLayer {
    CCTMXTiledMap *map;
    CCTMXLayer *background;
    int waveLevel;
}

@property (nonatomic, retain) CCTMXTiledMap *map;
@property (nonatomic, retain) CCTMXLayer *background;	
@property int waveLevel;

+ (id) scene;

- (BOOL) canBuildOnTilePosition:(CGPoint) pos;

@end
