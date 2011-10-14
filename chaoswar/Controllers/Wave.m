//
//  Wave.m
//  chaoswar
//
//  Created by Mac on 11-9-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Wave.h"
#import "GameController.h"
#import "SpritesImp.h"
#import "WayPoint.h"
#import "GameBackgroundScene.h"
#import "GameImfomationScene.h"
#import "GameMagicScene.h"
#import "GameControllerScene.h"
#import "GameHintScene.h"

@implementation Wave

@synthesize beginRate;
@synthesize spawnRate;
@synthesize totalEnemy;
@synthesize enemyType;
@synthesize way;

+ (void)runWave:(float)b e:(TEnemyType)e s:(float)s t:(int)t wy:(NSMutableArray*)wy
{
    Wave *wave = [[[Wave alloc] init] autorelease];
    wave.enemyType = e;
    wave.spawnRate = s;
    wave.totalEnemy = t;
    wave.way = wy;
    wave.beginRate = b;
    [wave start];
}

- (void) start
{
    [[CCScheduler sharedScheduler] scheduleSelector:@selector(startRunEnemy:) forTarget:self interval:beginRate paused:NO];
}

- (void) startRunEnemy:(ccTime)dt
{
    [[CCScheduler sharedScheduler] scheduleSelector:@selector(runEnemy:) forTarget:self interval:spawnRate paused:NO];
}

- (TDEnemy*) getEnemy
{
    switch (self.enemyType) {
        case ET_FOOT1:
            return [TDFootEnemy1 getSprite];
            break;
        case ET_FOOT2:
            return [TDFootEnemy2 getSprite];
            break;
        case ET_FOOT3:
            return [TDFootEnemy3 getSprite];
            break; 
        case ET_FOOT4:
            return [TDFootEnemy4 getSprite];
            break; 
        case ET_FOOT5:
            return [TDFootEnemy5 getSprite];
            break; 
        case ET_FOOT6:
            return [TDFootEnemy6 getSprite];
            break; 
        case ET_FOOT7:
            return [TDFootEnemy7 getSprite];
            break; 
        case ET_FOOT8:
            return [TDFootEnemy8 getSprite];
            break; 
        case ET_FOOT9:
            return [TDFootEnemy9 getSprite];
            break; 
        case ET_FOOT10:
            return [TDFootEnemy10 getSprite];
            break; 
        case ET_FOOT11:
            return [TDFootEnemy11 getSprite];
            break; 
        case ET_FOOT12:
            return [TDFootEnemy12 getSprite];
            break; 
        case ET_FOOT13:
            return [TDFootEnemy13 getSprite];
            break; 
        case ET_FOOT14:
            return [TDFootEnemy14 getSprite];
            break; 
        case ET_FOOT15:
            return [TDFootEnemy15 getSprite];
            break; 
        case ET_FOOT16:
            return [TDFootEnemy16 getSprite];
            break; 
        case ET_FLY1:
            return [TDFlyEnemy1 getSprite];
            break; 
        case ET_FLY2:
            return [TDFlyEnemy2 getSprite];
            break; 
        case ET_MAGIC1:
            return [TDMagicEnemy1 getSprite];
            break; 
        case ET_MAGIC2:
            return [TDMagicEnemy2 getSprite];
            break; 
        case ET_BOSS1:
            return [TDBossEnemy1 getSprite];
            break; 
        case ET_BOSS2:
            return [TDBossEnemy1 getSprite];
            break; 
        case ET_SHOOT:
            //return [TDShootEnemy1 getSprite];
            break; 
        default:
            break;
    }
    return nil;
}

- (void) runEnemy:(ccTime)dt {
    if (totalEnemy <= 0) {
        [[CCScheduler sharedScheduler] unscheduleSelector:@selector(runEnemy:) forTarget:self]; 
        return;
    }
    GameController *gc = [GameController getGameController];
    TDEnemy *enemy = [self getEnemy];
    enemy.nextWayPoint = 1;
    enemy.position = ccp(-1,  -1);
    enemy.way = self.way;
    WayPoint *wayPoint = [enemy.way objectAtIndex:0];
    if (wayPoint) {
        CGPoint position = [wayPoint getPoint];
        enemy.position = ccp(position.x, position.y);
    }
    [gc.gameBackground addChild:enemy z:5];
    [gc.enemyArray addObject:enemy];
    [enemy run];
    totalEnemy--;
}

-(id) init
{
	if( (self=[super init]) ) {
		
	}
	
	return self;
}

@end
