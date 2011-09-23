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
}

@property (nonatomic, retain) CCTMXTiledMap *map;
@property (nonatomic, retain) CCTMXLayer *background;	

+ (id) scene;

- (void) initGame;

- (void) initWaypoint;
- (void) initTower: (CGPoint)pos;
- (BOOL) canBuildOnTilePosition:(CGPoint) pos;

@end
