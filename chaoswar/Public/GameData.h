#import <Foundation/Foundation.h>


@interface GameData : NSObject {

}

+ (GameData*) currentGameData;

- (void) saveData;

- (void) loadData;

@end
