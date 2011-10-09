//
//  WayManager.h
//  chaoswar
//
//  Created by Mac on 11-10-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameTypeDef.h"

@interface WayManager : NSObject {
    NSMutableDictionary *dicWay;
}

- (void) removeAllWay;

- (void) addWayPoint:(int)roadNum wayPoint:(CGPoint)wayPoint;

- (NSMutableArray*) getWay:(int)roadNum;

- (CGPoint) getWayPoint:(int)roadNum num:(int)num;

@end
