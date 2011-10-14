//
//  Enemy.h
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GamePubDef.h"
#import "WayPoint.h"
#import "TDUnit.h"

@interface TDEnemy : TDUnit {
    int nextWayPoint;
    //路线
    NSMutableArray *way;
}

@property (nonatomic, assign) int nextWayPoint;
@property (nonatomic, assign) NSMutableArray *way;

- (CGPoint) getPositionAfterTime:(ccTime)dt;

@end
