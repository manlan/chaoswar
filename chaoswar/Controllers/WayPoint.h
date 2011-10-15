//
//  WayPoint.h
//  chaoswar
//
//  Created by Mac on 11-9-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "GamePubDef.h"

@interface WayPoint : CCNode {

}

@property (readonly) CGPoint point;
@property (readonly) int z;

+ (WayPoint*) getWayPoint:(CGPoint)pt z:(int)z;

- (void) setValue:(CGPoint)pt z:(int)z;

@end
