//
//  Tower.m
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Tower.h"
#import "GameControllerScene.h"
#import "ArrowTower.h"
#import "TurretTower.h"
#import "DefenceTower.h"
#import "MagicTower.h"

@implementation Tower

@synthesize range;
@synthesize enemy;
@synthesize shoottime;

- (Enemy*) searchClearEnemy {
	Enemy *nextEnemy = nil;
	double maxDistant = 99999;
	GameController *gc = [GameController getGameController];
	for (Enemy *e in gc.enemyArray) {	
		double curDistance = ccpDistance(self.position, e.position);
		if (curDistance < maxDistant) {
			nextEnemy = e;
			maxDistant = curDistance;
		}
	}
	
	if (maxDistant < self.range) {
        return nextEnemy;
    }
		
	return nil;
}

- (BOOL) canAttactEnemy
{
    if (enemy == nil) {
        return NO;
    }
    
    if (enemy.isDelete == YES) {
        return NO;
    }
    
    double distance = ccpDistance(self.position, self.enemy.position);
    
    if (distance <= self.range) {
        return YES;
    }
	return NO;
}

@end

@implementation EmptyTower

- (void) spriteTouchBegan:(UITouch *)touch
{
    [[GameController getGameController].gameController removeAllChildrenWithCleanup:YES];
    //箭塔
    CCMenuItemImage *btnArrayTower = [[CCMenuItemImage alloc] initFromNormalImage:@"magic01.png" selectedImage:@"magic01.png" disabledImage:@"magic01.png" target:self selector:@selector(bulidArrayTower:)];		
    CCMenu *btnArrayTowerMenu = [CCMenu menuWithItems:btnArrayTower, nil];
    btnArrayTowerMenu.position = CGPointMake(254 , 30);
    [[GameController getGameController].gameController addChild:btnArrayTowerMenu z:2];
    
    //防塔
    CCMenuItemImage *btnDefenceTower = [[CCMenuItemImage alloc] initFromNormalImage:@"magic02.png" selectedImage:@"magic02.png" disabledImage:@"magic02.png" target:self selector:@selector(bulidDefenceTower:)];		
    CCMenu *btnDefenceTowerMenu = [CCMenu menuWithItems:btnDefenceTower, nil];
    btnDefenceTowerMenu.position = CGPointMake(318 , 30);
    [[GameController getGameController].gameController addChild:btnDefenceTowerMenu z:2];
    
    //炮塔
    CCMenuItemImage *btnTurretTower = [[CCMenuItemImage alloc] initFromNormalImage:@"magic03.png" selectedImage:@"magic03.png" disabledImage:@"magic03.png" target:self selector:@selector(bulidTurretTower:)];		
    CCMenu *btnTurretTowerMenu = [CCMenu menuWithItems:btnTurretTower, nil];
    btnTurretTowerMenu.position = CGPointMake(382 , 30);
    [[GameController getGameController].gameController addChild:btnTurretTowerMenu z:2];
    
    //魔塔
    CCMenuItemImage *btnMagicTower = [[CCMenuItemImage alloc] initFromNormalImage:@"magic04.png" selectedImage:@"magic04.png" disabledImage:@"magic04.png" target:self selector:@selector(bulidMagicTower:)];		
    CCMenu *btnMagicTowerMenu = [CCMenu menuWithItems:btnMagicTower, nil];
    btnMagicTowerMenu.position = CGPointMake(446 , 30);
    [[GameController getGameController].gameController addChild:btnMagicTowerMenu z:2];
}

-(void) bulidArrayTower:(id) sender 
{
    self.isDelete = YES;
    GameController *gc = [GameController getGameController];
    ArrowTower1 *tower = [ArrowTower1 getSprite];
    tower.position = self.position;
    [gc.gameBackground addChild:tower z:5];
    [gc.towerArray addObject:tower];
    [[GameController getGameController].gameController removeAllChildrenWithCleanup:YES];
    [tower run];
    [self removeFromParentAndCleanup:YES];
}

-(void) bulidDefenceTower:(id) sender 
{
    self.isDelete = YES;
    GameController *gc = [GameController getGameController];
    ArrowTower1 *tower = [ArrowTower1 getSprite];
    tower.position = self.position;
    [gc.gameBackground addChild:tower z:5];
    [gc.towerArray addObject:tower];
    [[GameController getGameController].gameController removeAllChildrenWithCleanup:YES];
    [tower run];
    [self removeFromParentAndCleanup:YES];
}

-(void) bulidTurretTower:(id) sender 
{
    self.isDelete = YES;
    GameController *gc = [GameController getGameController];
    ArrowTower1 *tower = [ArrowTower1 getSprite];
    tower.position = self.position;
    [gc.gameBackground addChild:tower z:5];
    [gc.towerArray addObject:tower];
    [[GameController getGameController].gameController removeAllChildrenWithCleanup:YES];
    [tower run];
    [self removeFromParentAndCleanup:YES];
}

-(void) bulidMagicTower:(id) sender 
{
    self.isDelete = YES;
    GameController *gc = [GameController getGameController];
    ArrowTower1 *tower = [ArrowTower1 getSprite];
    tower.position = self.position;
    [gc.gameBackground addChild:tower z:5];
    [gc.towerArray addObject:tower];
    [[GameController getGameController].gameController removeAllChildrenWithCleanup:YES];
    [tower run];
    [self removeFromParentAndCleanup:YES];
}

@end

@implementation EmptyTower1

+ (id) getSprite {
    EmptyTower *tower = [EmptyTower spriteWithFile:@"emptyTower1.png"];
    if (tower) {
        tower.isDelete = NO;
        tower.range = 0;
		tower.enemy = nil;
    }
    return tower;
}

@end

@implementation EmptyTower2

+ (id) getSprite {
    EmptyTower *tower = [EmptyTower spriteWithFile:@"emptyTower2.png"];
    if (tower) {
        tower.isDelete = NO;
        tower.range = 0;
		tower.enemy = nil;
    }
    return tower;
}

@end


