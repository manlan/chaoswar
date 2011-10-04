//
//  Tower.m
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Tower.h"
#import "GameControllerScene.h"
#import "GameBackgroundScene.h"
#import "ArrowTower.h"
#import "TurretTower.h"
#import "DefenceTower.h"
#import "MagicTower.h"

#define MENU_OPACITY 180
#define MENU_Y_POINT 26
#define MENU1_X_POINT 300
#define MENU2_X_POINT (300 + 48)
#define MENU3_X_POINT (300 + 48 + 48)
#define MENU4_X_POINT (300 + 48 + 48 + 48)

@implementation Tower

@synthesize range;
@synthesize enemy;
@synthesize attacttime;
@synthesize bgName;
@synthesize bgSprite;
@synthesize nextTower;

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

- (void) buildTower:(Tower*)tower buildBG:(NSString*)buildBG
{
    [[GameController getGameController].gameController removeAllChildrenWithCleanup:YES];
    [self runAction:[CCHide action]];
    CCSprite *bg = [CCSprite spriteWithFile:buildBG];
    bg.position = self.position;
    [[GameController getGameController].gameBackground addChild:bg z:5];
    self.nextTower = [tower retain];
    [self schedule:@selector(afterBulidTower:) interval:0.8];
}

-(void) afterBulidTower:(ccTime)dt 
{
    GameController *gc = [GameController getGameController];
    self.nextTower.position = self.position;
    self.nextTower.bgName = self.bgName;
    self.nextTower.bgSprite = [CCSprite spriteWithFile:bgName];
    self.nextTower.bgSprite.position = self.nextTower.position;
    [gc.gameBackground addChild:self.nextTower.bgSprite z:5];
    [gc.gameBackground addChild:self.nextTower z:6];
    [gc.towerArray addObject:self.nextTower];
    self.isDelete = YES;
    [self.nextTower run];
    [self removeFromParentAndCleanup:YES];
}

- (void) updateTower:(Tower*)tower
{
    
}

@end

@implementation EmptyTower

- (void) spriteTouchBegan:(UITouch *)touch
{
    [[GameController getGameController].gameController removeAllChildrenWithCleanup:YES];
    //箭塔
    CCMenuItemImage *btnArrayTower = [[CCMenuItemImage alloc] initFromNormalImage:@"magic01.png" selectedImage:@"magic01.png" disabledImage:@"magic01.png" target:self selector:@selector(bulidArrayTower:)];
    CCMenu *btnArrayTowerMenu = [CCMenu menuWithItems:btnArrayTower, nil];
    [btnArrayTowerMenu setOpacity:MENU_OPACITY];
    btnArrayTowerMenu.position   = CGPointMake(MENU1_X_POINT , MENU_Y_POINT);
    [[GameController getGameController].gameController addChild:btnArrayTowerMenu z:2];
    //防塔
    CCMenuItemImage *btnDefenceTower = [[CCMenuItemImage alloc] initFromNormalImage:@"magic02.png" selectedImage:@"magic02.png" disabledImage:@"magic02.png" target:self selector:@selector(bulidDefenceTower:)];		
    CCMenu *btnDefenceTowerMenu = [CCMenu menuWithItems:btnDefenceTower, nil];
    [btnDefenceTowerMenu setOpacity:MENU_OPACITY];
    btnDefenceTowerMenu.position = CGPointMake(MENU2_X_POINT , MENU_Y_POINT);
    [[GameController getGameController].gameController addChild:btnDefenceTowerMenu z:2];
    
    //炮塔
    CCMenuItemImage *btnTurretTower = [[CCMenuItemImage alloc] initFromNormalImage:@"magic03.png" selectedImage:@"magic03.png" disabledImage:@"magic03.png" target:self selector:@selector(bulidTurretTower:)];		
    CCMenu *btnTurretTowerMenu = [CCMenu menuWithItems:btnTurretTower, nil];
    [btnTurretTowerMenu setOpacity:MENU_OPACITY];
    btnTurretTowerMenu.position = CGPointMake(MENU3_X_POINT , MENU_Y_POINT);
    [[GameController getGameController].gameController addChild:btnTurretTowerMenu z:2];
    
    //魔塔
    CCMenuItemImage *btnMagicTower = [[CCMenuItemImage alloc] initFromNormalImage:@"magic04.png" selectedImage:@"magic04.png" disabledImage:@"magic04.png" target:self selector:@selector(bulidMagicTower:)];		
    CCMenu *btnMagicTowerMenu = [CCMenu menuWithItems:btnMagicTower, nil];
    [btnMagicTowerMenu setOpacity:MENU_OPACITY];
    btnMagicTowerMenu.position = CGPointMake(MENU4_X_POINT , MENU_Y_POINT);
    [[GameController getGameController].gameController addChild:btnMagicTowerMenu z:2];
}

-(void) bulidArrayTower:(id) sender 
{
    [self buildTower:[ArrowTower1 getSprite] buildBG:@"ArrowTowerBuilding.png"];
}

-(void) bulidDefenceTower:(id) sender 
{
    [self buildTower:[DefenceTower1 getSprite] buildBG:@"DefenceTowerBuilding.png"];
}

-(void) bulidTurretTower:(id) sender 
{
    [self buildTower:[TurretTower1 getSprite] buildBG:@"TurretTowerBuilding.png"];
}

-(void) bulidMagicTower:(id) sender 
{
    [self buildTower:[MagicTower1 getSprite] buildBG:@"MagicTowerBuilding.png"];
}

@end

@implementation EmptyTower1

+ (id) getSprite {
    EmptyTower1 *tower = [EmptyTower1 spriteWithFile:@"emptyTower1.png"];
    if (tower) {
        tower.isDelete = NO;
        tower.range = 0;
        tower.attacttime = 9999;
		tower.enemy = nil;
        tower.bgName = @"emptyTower1.png";
    }
    return tower;
}

@end

@implementation EmptyTower2

+ (id) getSprite {
    EmptyTower2 *tower = [EmptyTower2 spriteWithFile:@"emptyTower2.png"];
    if (tower) {
        tower.isDelete = NO;
        tower.range = 0;
        tower.attacttime = 9999;
		tower.enemy = nil;
        tower.bgName = @"emptyTower2.png";
    }
    return tower;
}

@end


