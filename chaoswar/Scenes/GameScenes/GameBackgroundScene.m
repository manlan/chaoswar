//
//  GameBackgroundScene.m
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "GameBackgroundScene.h"
#import "GameController.h"

#import "GameImfomationScene.h"
#import "GameMagicScene.h"
#import "GameControllerScene.h"
#import "Pointer1.h"

@implementation GameBackgroundScene

@synthesize background;
@synthesize showground;
@synthesize waveLevel;
@synthesize pointNum;

+(id) scene:(int)pn
{
	CCScene *scene = [CCScene node];
    
	GameBackgroundScene *gameBackgroundScene = [GameBackgroundScene node];
    [gameBackgroundScene initMap:pn];
	[scene addChild:gameBackgroundScene z:1];
    GameImfomationScene *gameImfomationScene = [GameImfomationScene node];
    [scene addChild:gameImfomationScene z:2];
    GameMagicScene *gameMagicScene = [GameMagicScene node];
    [scene addChild:gameMagicScene z:3];
    GameControllerScene *gameControllerScene = [GameControllerScene node];
    [scene addChild:gameControllerScene z:4];

	GameController *gc = [GameController getGameController];
	gc.gameBackground = gameBackgroundScene;
    gc.gameImfomation = gameImfomationScene;
    gc.gameMagic = gameMagicScene;
    gc.gameController = gameControllerScene;
    //==================初始化配置=================
    switch (pn) {
        case 1:
            [gc initController:[[[Pointer1 alloc] init] autorelease]];
            break;
        default:
            [gc initController:[[[Pointer1 alloc] init] autorelease]];
            break;
    }
    [gc start];
	return scene;
}

- (void) initMap:(int)pn
{
    self.pointNum = pn;
    self.pointNum = 1;
    //================读取地图文件=================
    CGSize size = [[CCDirector sharedDirector] winSize];
    //背景，表示是否可以通过的
    background = [CCSprite spriteWithFile:[NSString stringWithFormat:@"map%db.png", self.pointNum]];
    background.position = CGPointMake(size.width /2 , size.height/2);
    background.scale = 1;
    [self addChild:background z:1];
    //前景，显示用的
    showground = [CCSprite spriteWithFile:[NSString stringWithFormat:@"map%ds.png", self.pointNum]];
    showground.position = CGPointMake(size.width /2 , size.height/2);
    showground.scale = 1;
    [self addChild:showground z:2];
    //================循环游戏逻辑=================
    [self schedule:@selector(gameLogic:) interval:1.0];		
}

//地图块编号
- (CGPoint) tileCoordForPosition:(CGPoint) position 
{
//	int x = position.x / self.map.tileSize.width;
//	int y = ((self.map.mapSize.height * self.map.tileSize.height) - position.y) / self.map.tileSize.height;
//	return ccp(x,y);
}

//判断是否允许建塔
- (BOOL) canBuildOnTilePosition:(CGPoint) pos 
{
//	CGPoint towerLoc = [self tileCoordForPosition: pos];
//	
//	int tileGid = [self.background tileGIDAt:towerLoc];
//	NSDictionary *dics = [self.map propertiesForGID:tileGid];
//	NSString *type = [dics valueForKey:@"canbuild"];
//	if([type isEqualToString: @"1"]) {
//		return YES;
//	}
	return NO;
}

//建塔
-(void)addTower: (CGPoint)pos {
	GameController *gc = [GameController getGameController];
//	
//	Tower *tower = nil;
//	
//	CGPoint towerLoc = [self tileCoordForPosition: pos];
//	
//	int tileGid = [self.background tileGIDAt:towerLoc];
//	NSDictionary *props = [self.map propertiesForGID:tileGid];
//	NSString *type = [props valueForKey:@"buildable"];
//	
//	
//	NSLog(@"Buildable: %@", type);
//	if([type isEqualToString: @"1"]) {
//		tower = [MachineGunTower tower];
//		tower.position = ccp((towerLoc.x * 32) + 16, self.map.contentSize.height - (towerLoc.y * 32) - 16);
//		[self addChild:tower z:1];
//		
//		tower.tag = 1;
//		[gc.towerArray addObject:tower];
//		
//	} else {
//		NSLog(@"Tile Not Buildable");
//	}
//	
}

//添加敌军
-(void)addEnemy {
    
	GameController *gc = [GameController getGameController];
	Wave * wave = [self getCurrentWave];
	if (wave.totalEnemy < 0) {
		return; //[self getNextWave];
	}
	
	wave.totalEnemy--;
	
    Enemy *enemy = nil;
    if ((arc4random() % 2) == 0) {
        enemy = [EnemyOne enemy];
    } else {
        enemy = [EnemyTwo enemy];
    }	
	
	WayPoint *waypoint = [enemy getCurrentWaypoint];
	enemy.position = waypoint.position;	
	waypoint = [enemy getNextWaypoint];
	
	[self addChild:enemy z:1];
	
	int moveDuration = enemy.scale;	
	id actionMove = [CCMoveTo actionWithDuration:moveDuration position:waypoint.position];
	id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(FollowPath:)];
	[enemy runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
	
	// Add to targets array
	enemy.tag = 1;
	[gc.enemyArray addObject:enemy];
	
}

//敌人的行动（循环）
-(void) FollowPath:(id)sender {
    
	Enemy *enemy = (Enemy *)sender;
	
	WayPoint *waypoint = [enemy getNextWaypoint];
    
	int moveDuration = enemy.scale;
	id actionMove = [CCMoveTo actionWithDuration:moveDuration position:waypoint.position];
	id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(FollowPath:)];
	[enemy stopAllActions];
	[enemy runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

//游戏逻辑（循环）
-(void)gameLogic:(ccTime)dt {
	//增加敌军＝＝＝＝暂时
	GameController *gc = [GameController getGameController];
	Wave * wave = [gc getCurrentWave];
	static double lastTimeTargetAdded = 0;
    double now = [[NSDate date] timeIntervalSince1970];
    if(lastTimeTargetAdded == 0 || now - lastTimeTargetAdded >= wave.spawnRate) {
        [self addEnemy];
        lastTimeTargetAdded = now;
    }
	
    //删除无用信息
    [gc deleteUnUseSprite:self];
}


- (CGPoint)boundLayerPos:(CGPoint)newPos {
    CGSize winSize = [CCDirector sharedDirector].winSize;
    CGPoint retval = newPos;
    retval.x = MIN(retval.x, 0);
    //retval.x = MAX(retval.x, -map.contentSize.width+winSize.width); 
    retval.y = MIN(0, retval.y);
    //retval.y = MAX(-map.contentSize.height+winSize.height, retval.y); 
    return retval;
}

- (void)handlePanFrom:(UIPanGestureRecognizer *)recognizer {
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {    
        CGPoint touchLocation = [recognizer locationInView:recognizer.view];
        touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
        touchLocation = [self convertToNodeSpace:touchLocation];                
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {    
        CGPoint translation = [recognizer translationInView:recognizer.view];
        translation = ccp(translation.x, -translation.y);
        CGPoint newPos = ccpAdd(self.position, translation);
        self.position = [self boundLayerPos:newPos];  
        [recognizer setTranslation:CGPointZero inView:recognizer.view];    
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
		float scrollDuration = 0.2;
		CGPoint velocity = [recognizer velocityInView:recognizer.view];
		CGPoint newPos = ccpAdd(self.position, ccpMult(ccp(velocity.x, velocity.y * -1), scrollDuration));
		newPos = [self boundLayerPos:newPos];
		[self stopAllActions];
		CCMoveTo *moveTo = [CCMoveTo actionWithDuration:scrollDuration position:newPos];            
		[self runAction:[CCEaseOut actionWithAction:moveTo rate:1]];            
    }        
}

- (BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocationInGameLayer = [self convertTouchToNodeSpace:touch];
    BOOL isBuildable = [self canBuildOnTilePosition: touchLocationInGameLayer];
    GameController *gc = [GameController getGameController];
    if (isBuildable) {
        //显示建造按钮
        [gc showBuildButton];
    } else {
        //显示信息或者升级按钮
        [gc spriteInfo];
    }
	return YES;
}

- (void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    
}

- (void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {  

}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	[super dealloc];
}

@end
