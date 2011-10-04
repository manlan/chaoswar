//
//  WayPoint.h
//  chaoswar
//
//  Created by Mac on 11-9-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@interface WayPoint : CCNode {
    CGPoint point;
}

@property CGPoint point;

+ (WayPoint*) getWayPoint:(CGPoint)pt;

- (CGPoint) getPoint;;

@end
