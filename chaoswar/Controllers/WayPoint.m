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

+ (WayPoint*) getWayPoint:(CGPoint)pt
{
    WayPoint *wayPoint = [[[WayPoint alloc] init] autorelease];
    wayPoint.point = pt;
    return wayPoint;
}

- (CGPoint) getPoint;
{
    return self.point;
}

@end
