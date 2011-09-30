//
//  WayPointManager.h
//  chaoswar
//
//  Created by Mac on 11-9-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WayPointManager : NSObject {
    NSMutableDictionary *dicWayPoint;
}

- (void) removeAllWayPoint;

- (void) addWayPoint:(int)roadNum wayPoint:(CGPoint)wayPoint;

@end
