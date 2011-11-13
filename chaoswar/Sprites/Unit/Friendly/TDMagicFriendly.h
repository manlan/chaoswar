//
//  TDMagicFriendly.h
//  chaoswar
//
//  Created by Mac on 11-10-27.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "TDFriendly.h"

@interface TDMagicFriendly : TDFriendly {
    
}

@property ccTime deadTime;

- (CCAnimation*) getAnimation:(int)level kind:(NSString*)kind;

@end

@interface TDMagicFriendly1 : TDMagicFriendly {
    
}

@end

@interface TDMagicFriendly2 : TDMagicFriendly {
    
}

@end
