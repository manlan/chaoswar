//
//  Bullet.m
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Bullet.h"
#import "Enemy.h"
#import "Friendly.h"

@implementation Bullet

@synthesize flytime;
@synthesize attact;
@synthesize attactMode;

@end

@implementation DefBullet

@synthesize enemy;

- (BOOL) run
{
    [self move];
    return YES;
}

- (void) move {
    //爆炸则产生效果，同时自身消亡
    if (!self.enemy) {
        return;
    }
    //double curDistance = ccpDistance(self.position, self.enemy.position);
    id actionMove = [CCJumpTo actionWithDuration:flytime position:self.enemy.position height:30 jumps:1];
	id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(attact:)];
	[self runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

- (void) attact:(id)sender {
    self.isDelete = YES;
    [self removeFromParentAndCleanup:YES];
}

@end


@implementation EneBullet

@synthesize friendly;

+ (id) getSprite {
    DefBullet *bullet = [DefBullet spriteWithFile:@"ArrowBullet.png"];
    if (bullet) {
        //[bullet setScale:0.3];
        //[bullet setOpacity:180];
        bullet.isDelete = NO;
        bullet.flytime = 0.5;
    }
    return bullet;
}

- (BOOL) run
{
    [self move];
    return YES;
}

- (void) move {
    //爆炸则产生效果，同时自身消亡
    if (!self.friendly) {
        return;
    }
    //double curDistance = ccpDistance(self.position, self.enemy.position);
    id actionMove = [CCJumpTo actionWithDuration:flytime position:self.friendly.position height:30 jumps:1];
	id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(attact:)];
	[self runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

- (void) attact:(id)sender {
    self.isDelete = YES;
    [self removeFromParentAndCleanup:YES];
}

@end


