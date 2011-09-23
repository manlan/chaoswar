//
//  GameController.m
//  chaoswar
//
//  Created by Mac on 11-9-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "GameController.h"


@implementation GameController

@synthesize gameBackground;
@synthesize gameImfomation;	
@synthesize gameMagic;
@synthesize gameController;
@synthesize enemyArray;
@synthesize towerArray;
@synthesize waveArray;	
@synthesize bulletArray;	
@synthesize waypointArray;
@synthesize magicArray;
@synthesize frientlyArray;
@synthesize gestureRecognizer;

static GameController *_sharedController = nil;

+ (GameController*) getGameController
{
	if (!_sharedController) {
		_sharedController = [[self alloc] init];
	}
	return _sharedController;
}

- (void) initController:(id*)pointer {

}

-(void)encodeWithCoder:(NSCoder *)coder {
    
}

-(id)initWithCoder:(NSCoder *)coder {
    
	return self;
}

- (id) init
{
	if ((self = [super init])) {
        enemyArray = [[NSMutableArray alloc] init];
        towerArray = [[NSMutableArray alloc] init];
        waveArray = [[NSMutableArray alloc] init];
        bulletArray = [[NSMutableArray alloc] init];
        waypointArray = [[NSMutableArray alloc] init];
        magicArray = [[NSMutableArray alloc] init];
        frientlyArray = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)dealloc {
    self.gameBackground = nil;
	self.gameImfomation = nil;	
	self.gameMagic = nil;
    self.gameController = nil;
	self.gestureRecognizer = nil;
    [enemyArray release];
    [towerArray release];
    [waveArray release];
    [bulletArray release];
    [waypointArray release];
    [magicArray release];
    [frientlyArray release];
    enemyArray = nil;
    towerArray = nil;
    waveArray = nil;
    bulletArray = nil;
    waypointArray = nil;
    magicArray = nil;
    frientlyArray = nil;
	[super dealloc];
}

@end
