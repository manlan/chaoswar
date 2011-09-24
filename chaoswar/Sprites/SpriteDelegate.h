//
//  SpriteDelegate.h
//  chaoswar
//
//  Created by Mac on 11-9-19.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

@protocol BulletDelegate <NSObject>
@optional


+ (id) bullet;
- (BOOL) run;

@end

@protocol TowerDelegate <NSObject>
@optional

+ (id) tower;
- (BOOL) run;

@end

@protocol EnemyDelegate <NSObject>
@optional

+ (id) enemy;
- (BOOL) run;

@end

@protocol FriendlyDelegate <NSObject>
@optional

+ (id) friendly;
- (BOOL) run;

@end
