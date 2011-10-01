//
//  Tower.h
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Enemy.h"
#import "Bullet.h"
#import "GameController.h"

@interface Tower : CCMenuItemImage {
    int range;
	Enemy *enemy;
    Bullet *bullet;
	CCSprite *spriteRange;
	NSMutableArray *bullets;
    int isdelete;
}
@property int isdelete;
@property (nonatomic, assign) int range;
@property (nonatomic, retain) Enemy *enemy;
@property (nonatomic, retain) Bullet *bullet;
@property (nonatomic, retain) CCSprite *spriteRange;
@property (nonatomic, retain) NSMutableArray *bullets;


+ (id) tower;
- (BOOL) run;

- (Enemy*) getClosestEnemy;

@end

@interface EmptyTower : Tower {
    
}

@end

@interface ArrowTower : Tower {
    
}

@end

@interface ArrowTower1 : ArrowTower {
    
}

@end
