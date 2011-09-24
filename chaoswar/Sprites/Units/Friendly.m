//
//  Friendly.m
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Friendly.h"


@implementation Friendly

@synthesize isdelete;

@end

@implementation Friendly1

+ (id) friendly {
    Friendly1 *friendly = [Friendly1 alloc];
    if ((friendly = [[friendly initWithFile:@"Enemy2.png"] autorelease])) {
        //        enemy.hp = 10;
        //        enemy.moveDuration = 4;
        //		enemy.curWaypoint = 0;
    }
    return friendly;
}

- (BOOL) run
{
    [self schedule:@selector(startSearch:)];
    return YES;
}

//搜索敌人
- (void) startSearch:(ccTime)dt {
    //找到敌人
    if (1 == 1) {
        [self unschedule:@selector(startSearch:)];
        [self schedule:@selector(startMove:)];
    }
}

- (void) startMove:(ccTime)dt {
    [self unschedule:@selector(startMove:)];
    [self schedule:@selector(move:)];
}

- (void) move:(ccTime)dt {
    //遇敌
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
    //攻击敌人完毕
    if (1 == 1) {
        [self unschedule:@selector(attact:)];
        [self schedule:@selector(startSearch:)];
        return;
    }
    
    return;
}

- (void) dealloc
{  
    [super dealloc];
}


@end

