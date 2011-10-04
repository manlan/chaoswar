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
    CCSprite *background;
    CCSprite *showground;
    int waveLevel;
    int pointNum;
}

@property (nonatomic, retain) CCSprite *background;
@property (nonatomic, retain) CCSprite *showground;	
@property int waveLevel;
@property int pointNum;

+ (id) scene:(int)pn;

- (void) initMap:(int)pn;

@end
