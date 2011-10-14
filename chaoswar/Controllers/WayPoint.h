//
//  WayPoint.h
//  chaoswar
//
//  Created by Mac on 11-9-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "GamePubDef.h"

@interface WayPoint : CCNode {
    CGPoint point;
    int z;
}

@property CGPoint point;
@property int z;

+ (WayPoint*) getWayPoint:(CGPoint)pt z:(int)z;

- (CGPoint) getPoint;;

- (int) getZ;

@end
