//
//  GameData.h
//  FiveElement-IP
//
//  Created by Mac on 11-7-31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GameData : NSObject {

}

+ (GameData*) currentGameData;

- (void) saveData;

- (void) loadData;

@end
