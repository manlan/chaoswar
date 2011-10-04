//
//  DefBullet.m
//  chaoswar
//
//  Created by Mac on 11-10-4.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DefBullet.h"


@implementation ArrowBullet1

+ (id) getSprite {
    ArrowBullet1 *bullet = [ArrowBullet1 spriteWithFile:@"ArrowBullet.png"];
    if (bullet) {
        bullet.isDelete = NO;
        bullet.flytime = 0.5;
        bullet.attact = 6;
        bullet.attactMode = 0;
    }
    return bullet;
}

@end

@implementation TurretBullet1

+ (id) getSprite {
    TurretBullet1 *bullet = [TurretBullet1 spriteWithFile:@"TurretBullet1.png"];
    if (bullet) {
        bullet.isDelete = NO;
        bullet.flytime = 0.9;
        bullet.attact = 22;
        bullet.attactMode = 0;
    }
    return bullet;
}

@end

@implementation MagicBullet1

+ (id) getSprite {
    MagicBullet1 *bullet = [MagicBullet1 spriteWithFile:@"MagicBullet.png"];
    if (bullet) {
        bullet.isDelete = NO;
        bullet.flytime = 0.5;
        bullet.attact = 10;
        bullet.attactMode = 1;
    }
    return bullet;
}

@end
