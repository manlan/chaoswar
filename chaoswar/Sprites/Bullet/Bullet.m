//
//  Bullet.m
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Bullet.h"


@implementation Bullet

+ (id) bullet {
    Bullet *bullet = nil;
    if ((bullet = [[[super alloc] initWithFile:@"bullet.png"] autorelease])) {
		
    }
    return bullet;
    
}

- (void) dealloc
{  
    [super dealloc];
}

@end
