//
//  Tower.m
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Tower.h"


@implementation Tower

@synthesize range;
@synthesize enemy;
@synthesize bullet;
@synthesize spriteRange;
@synthesize bullets;

- (Enemy*) getClosestEnemy {
	Enemy *nextEnemy = nil;
	double maxDistant = 99999;
	GameController *gc = [GameController getGameController];
	
	for (CCSprite *enemy in gc.enemyArray) {	
		Enemy *creep = (Enemy*) enemy;
		double curDistance = ccpDistance(self.position, creep.position);
		if (curDistance < maxDistant) {
			nextEnemy = creep;
			maxDistant = curDistance;
		}
	}
	
	if (maxDistant < self.range)
		return nextEnemy;
	return nil;
}

@end

@implementation MachineGunTower

+ (id)tower {
	
    MachineGunTower *tower = nil;
    if ((tower = [[[super alloc] initWithFile:@"MachineGunTurret.png"] autorelease])) {
		tower.range = 200;
		tower.enemy = nil;
		[tower schedule:@selector(towerLogic:) interval:0.2];
    }
    return tower;
}

-(id) init
{
	if ((self=[super init]) ) {
		//[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
	}
	return self;
}


- (void) setClosestEnemy:(Enemy*)closestEnemy {
	self.enemy = closestEnemy;
}

-(void)towerLogic:(ccTime)dt {
	
	self.enemy = [self getClosestEnemy];
	
	if (self.enemy != nil) {
		CGPoint shootVector = ccpSub(self.enemy.position, self.position);
		CGFloat shootAngle = ccpToAngle(shootVector);
		CGFloat cocosAngle = CC_RADIANS_TO_DEGREES(-1 * shootAngle);
		
		float rotateSpeed = 0.5 / M_PI; // 1/2 second to roate 180 degrees
		float rotateDuration = fabs(shootAngle * rotateSpeed);    
		
		[self runAction:[CCSequence actions:
						 [CCRotateTo actionWithDuration:rotateDuration angle:cocosAngle],
						 [CCCallFunc actionWithTarget:self selector:@selector(finishFiring)],
						 nil]];		
	}
}

-(void)creepMoveFinished:(id)sender {
    
	GameController *gc = [GameController getGameController];
	
	CCSprite *sprite = (CCSprite *)sender;
	[self.parent removeChild:sprite cleanup:YES];
	
	[gc.enemyArray removeObject:sprite];
	
}

- (void)finishFiring {
	
	GameController *gc = [GameController getGameController];
	
	self.bullet = [Bullet bullet];
	self.bullet.position = self.position;
	
    [self.parent addChild:self.bullet z:1];
    [gc.enemyArray addObject:self.bullet];
    
	ccTime delta = 1.0;
	CGPoint shootVector = ccpSub(self.bullet.position, self.position);
	CGPoint normalizedShootVector = ccpNormalize(shootVector);
	CGPoint overshotVector = ccpMult(normalizedShootVector, 320);
	CGPoint offscreenPoint = ccpAdd(self.position, overshotVector);
	
	[self.bullet runAction:[CCSequence actions:
                                    [CCMoveTo actionWithDuration:delta position:offscreenPoint],
                                    [CCCallFuncN actionWithTarget:self selector:@selector(creepMoveFinished:)],
                                    nil]];
	
	self.bullet.tag = 2;		
	
    self.bullet = nil;
    
}

@end
