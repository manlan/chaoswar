//
//  SpriteDelegate.h
//  chaoswar
//
//  Created by Mac on 11-9-19.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

@protocol BulletDelegate <NSObject>
@optional

-(BOOL) run;

@end

@protocol TowerDelegate <NSObject>
@optional

-(BOOL) run;

@end

@protocol EnemyDelegate <NSObject>
@optional

-(BOOL) run;

@end

@protocol FriendlyDelegate <NSObject>
@optional

-(BOOL) run;

@end
