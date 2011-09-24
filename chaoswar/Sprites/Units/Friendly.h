//
//  Friendly.h
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SpriteDelegate.h"

@interface Friendly : CCSprite <BulletDelegate> {
    int isdelete;
}

@property int isdelete;

@end


@interface Friendly1 : Friendly {

}

@end
