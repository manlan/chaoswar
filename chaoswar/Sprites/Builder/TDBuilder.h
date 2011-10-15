//
//  TDBuilder.h
//  chaoswar
//
//  Created by Mac on 11-10-9.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TDSprite.h"

@interface TDBuilder : TDSprite {

}

@property int maxMP;
@property int currentMP;
@property float attacttime;
@property int attactRange;
@property int attact;
@property TAcctactType attactMode;
@property CGPoint bottomPoint;

@end
