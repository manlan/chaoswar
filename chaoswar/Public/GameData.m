//
//  GameData.m
//  FiveElement-IP
//
//  Created by Mac on 11-7-31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameData.h"

static GameData *gameData;

@implementation GameData

+ (GameData*) currentGameData
{
	if (gameData == nil) {
		gameData = [[GameData alloc] init];
	}
	return gameData;
}

- (void) saveData
{

}

- (void) loadData
{
	
}

@end
