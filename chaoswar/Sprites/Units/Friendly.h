//
//  Friendly.h
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Friendly : CCSprite {
    int isdelete;
}

@property int isdelete;

+ (id) friendly;
- (BOOL) run;

@end


@interface Friendly1 : Friendly {

}

@end
