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
