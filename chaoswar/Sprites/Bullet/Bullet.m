//
//  Bullet.m
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Bullet.h"


@implementation Bullet

@synthesize isdelete;

- (void) dealloc
{  
    [super dealloc];
}

@end


@implementation Bullet1

+ (id) bullet {
    Bullet1 *bullet = [[[Bullet1 alloc] initWithFile:@"bullet.png"] autorelease];
    if (bullet) {
        bullet.isdelete = 0;
    }
    return bullet;
    
}

- (BOOL) run
{
    [self schedule:@selector(startMove:)];
    return YES;
}

- (void) startMove:(ccTime)dt {
    [self unschedule:@selector(startMove:)];
    [self schedule:@selector(move:)];
}

- (void) move:(ccTime)dt {
    //爆炸则产生效果，同时自身消亡
    if (1 == 1) {
        [self unschedule:@selector(move:)];
        [self schedule:@selector(startAttact:)];
        return;
    }
    
    return;
}

- (void) startAttact:(ccTime)dt {
    [self unschedule:@selector(startAttact:)];
    [self schedule:@selector(attact:)];
}


- (void) attact:(ccTime)dt {
    //爆炸则产生效果，同时自身消亡
    if (1 == 1) {
        [self unschedule:@selector(attact:)];
        self.isdelete = 1;
        return;
    }
    
    return;
}

- (void) dealloc
{  
    [super dealloc];
}

@end
