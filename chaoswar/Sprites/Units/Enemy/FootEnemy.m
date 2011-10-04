//
//  FootEnemy.m
//  chaoswar
//
//  Created by Mac on 11-10-4.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "FootEnemy.h"


@implementation FootEnemy

@end

@implementation FootEnemy1

+ (id) getSprite {
    FootEnemy1 *enemy = [FootEnemy1 spriteWithFile:@"emptyTower.png"];
    if (enemy) {
        [enemy setScale:0.4];
        [enemy setOpacity:180];
        enemy.maxHP = 100;
        enemy.currentHP = enemy.maxHP;
        enemy.moveSpeed = 20;
        enemy.attacttime = 1.2;
        enemy.range = 0;     
        enemy.attact = 8;
        enemy.attactMode = 0;
        enemy.defenceMode = 0;
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation FootEnemy2

+ (id) getSprite {
    FootEnemy1 *enemy = [FootEnemy1 spriteWithFile:@"emptyTower.png"];
    if (enemy) {
        [enemy setScale:0.5];
        [enemy setOpacity:120];
        enemy.maxHP = 60;
        enemy.currentHP = enemy.maxHP;
        enemy.moveSpeed = 40;
        enemy.attacttime = 1.2;
        enemy.range = 0;     
        enemy.attact = 8;
        enemy.attactMode = 0;
        enemy.defenceMode = 0;
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end
