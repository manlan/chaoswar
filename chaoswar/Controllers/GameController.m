//
//  GameController.m
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "GameController.h"
#import "Wave.h"

@implementation GameController

@synthesize gameBackground;
@synthesize gameImfomation;
@synthesize gameMagic;
@synthesize gameController;
@synthesize bulletArray;
@synthesize towerArray;
@synthesize enemyArray;
@synthesize friendlyArray;
@synthesize waypointArray;
@synthesize waveArray;
@synthesize gestureRecognizer;

static GameController *_gameController = nil;

+ (GameController*) getGameController;
{
	if (!_gameController) {
		_gameController = [[self alloc] init];
	}
	
	return _gameController;
}

- (void) initController
{

}

-(void)encodeWithCoder:(NSCoder *)coder {
    
}

-(id)initWithCoder:(NSCoder *)coder {
    
	return self;
}

- (id) init
{
	if ((self = [super init])) {
        bulletArray = [[NSMutableArray alloc] init];
        towerArray = [[NSMutableArray alloc] init];
        enemyArray = [[NSMutableArray alloc] init];
        friendlyArray = [[NSMutableArray alloc] init];
        waypointArray = [[NSMutableArray alloc] init];
        waveArray = [[NSMutableArray alloc] init];
	}
	return self;
}

//-(void)addWaves {
//	GameController *gc = [GameController getGameController];
//	Wave *wave = nil;
//    for (int i = 0; i < 5; i++) {
//        wave = [[Wave alloc] initWithEnemy:[EnemyOne enemy] SpawnRate:1.0 TotalEnemy:5];
//        [gc.waveArray addObject:wave];
//        wave = nil;	
//    }
//}
//
//-(void)addWaypoint {
//	GameController *gc = [GameController getGameController];
//	
//	CCTMXObjectGroup *objects = [self.map objectGroupNamed:@"Objects"];
//	WayPoint *wp = nil;
//	
//	int wayPointCounter = 0;
//	NSMutableDictionary *wayPoint;
//	while ((wayPoint = [objects objectNamed:[NSString stringWithFormat:@"Waypoint%d", wayPointCounter]])) {
//		int x = [[wayPoint valueForKey:@"x"] intValue];
//		int y = [[wayPoint valueForKey:@"y"] intValue];
//		
//		wp = [WayPoint node];
//		wp.position = ccp(x, y);
//		[gc.waypoints addObject:wp];
//		wayPointCounter++;
//	}
//	
//	NSAssert([gc.waypoints count] > 0, @"Waypoint objects missing");
//	wp = nil;
//}

- (void)dealloc {
    self.gameBackground = nil;
	self.gameImfomation = nil;
    self.gameMagic = nil;
    self.gameController = nil;
    [bulletArray release];
    [towerArray release];
    [enemyArray release];
    [friendlyArray release];
    [waypointArray release];
    [waveArray release];
    bulletArray = nil;
    towerArray = nil;
    enemyArray = nil;
    friendlyArray = nil;
    waypointArray = nil;
    waveArray = nil;
	[super dealloc];
}

@end
