//
//  WayPoint.m
//  chaoswar
//
//  Created by Mac on 11-9-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "WayPoint.h"


@implementation WayPoint

@synthesize point;
@synthesize z;

+ (WayPoint*) getWayPoint:(CGPoint)pt z:(int)z
{
    WayPoint *wayPoint = [[[WayPoint alloc] init] autorelease];
    wayPoint.point = pt;
    wayPoint.z = z;
    return wayPoint;
}

- (CGPoint) getPoint;
{
    return self.point;
}

- (int) getZ
{
    return self.z;
}

@end
