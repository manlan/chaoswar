//
//  AnimateManager.h
//  chaoswar
//
//  Created by Mac on 11-10-7.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GamePubDef.h"

@class GameController;
@class GameBackgroundScene;

@interface AnimateManager : NSObject {
    
}

+ (void) initAnimate:(NSString*)fileName;

+ (void) initBoss01;

+ (void) initBoss02;

+ (void) initFly01;

+ (void) initFly02;

+ (void) initFly03;

+ (void) initShooter01;

+ (void) initMagic01;

+ (void) initMagic02;

+ (void) initFoot01;

+ (void) initFoot02;

+ (void) initFoot03;

+ (void) initFoot04;

+ (void) initFoot05;

+ (void) initFoot06;

+ (void) initFoot07;

+ (void) initFoot08;

+ (void) initFoot09;

+ (void) initFoot10;

+ (void) initFoot11;

+ (void) initFoot12;

+ (void) initFoot13;

+ (void) initFoot14;

+ (void) initFoot15;

+ (void) initFoot16;

+ (void) initDefenceTower01;

+ (void) initDefenceTower02;

+ (void) initDefenceTower03;

+ (void) initTurretTower01;

+ (void) initTurretTower02;

+ (void) initTurretTower03;

+ (void) initMagicTower01;

+ (void) initMagicTower02;

+ (void) initMagicTower03;

@end
