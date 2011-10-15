//
//  WayPoint.m
//  chaoswar
//
//  Created by Mac on 11-9-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "WayPoint.h"


@implementation WayPoint

@synthesize point = _point;
@synthesize z = _z;

+ (WayPoint*) getWayPoint:(CGPoint)pt z:(int)z
{
    WayPoint *wayPoint = [[[WayPoint alloc] init] autorelease];
    [wayPoint setValue:pt z:z];
    return wayPoint;
}

- (void) setValue:(CGPoint)pt z:(int)z
{
    _point = pt;
    _z = z;
}

@end
