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

@implementation GameBackgroundScene

@synthesize map;
@synthesize background;
@synthesize waveLevel;

+(id) scene
{
	CCScene *scene = [CCScene node];
    
	GameBackgroundScene *gameBackgroundScene = [GameBackgroundScene node];
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

	return scene;
}

-(id) init {
    if((self = [super init])) {
        //================读取地图文件=================
		self.map = [CCTMXTiledMap tiledMapWithTMXFile:@"map1.tmx"];
        self.background = [self.map layerNamed:@"background"];
		self.background.anchorPoint = ccp(0, 0);
		[self addChild:self.map z:0];
        //==================初始化配置=================
        GameController *gc = [GameController getGameController];
        [gc initController];
        //================循环游戏逻辑=================
		[self schedule:@selector(gameLogic:) interval:1.0];		
		//self.currentLevel = 0;
		self.position = ccp(-228, -122);
    }
    return self;
}

//初始化游戏
- (void) initGame
{

}

//获取当前的敌人攻击队列
- (Wave *)getCurrentWave {
	GameController *gc = [GameController getGameController];
	Wave *wave = (Wave *) [gc.waveArray objectAtIndex: self.waveLevel];
	return wave;
}

//获取下一的敌人攻击队列
- (Wave *)getNextWave {
	GameController *gc = [GameController getGameController];
//	self.currentLevel++;
//	
//	if (self.currentLevel > 1)
//		self.currentLevel = 0;
    //Wave * wave = (Wave *) [gc.waves objectAtIndex:self.currentLevel];
    Wave * wave = (Wave *) [gc.waveArray objectAtIndex:1];
    return wave;
}

//地图块编号
- (CGPoint) tileCoordForPosition:(CGPoint) position 
{
	int x = position.x / self.map.tileSize.width;
	int y = ((self.map.mapSize.height * self.map.tileSize.height) - position.y) / self.map.tileSize.height;
	return ccp(x,y);
}

//判断是否允许建塔
- (BOOL) canBuildOnTilePosition:(CGPoint) pos 
{
	CGPoint towerLoc = [self tileCoordForPosition: pos];
	
	int tileGid = [self.background tileGIDAt:towerLoc];
	NSDictionary *dics = [self.map propertiesForGID:tileGid];
	NSString *type = [dics valueForKey:@"canbuild"];
	if([type isEqualToString: @"1"]) {
		return YES;
	}
	return NO;
}

//建塔
-(void)addTower: (CGPoint)pos {
	GameController *gc = [GameController getGameController];
	
	Tower *tower = nil;
	
	CGPoint towerLoc = [self tileCoordForPosition: pos];
	
	int tileGid = [self.background tileGIDAt:towerLoc];
	NSDictionary *props = [self.map propertiesForGID:tileGid];
	NSString *type = [props valueForKey:@"buildable"];
	
	
	NSLog(@"Buildable: %@", type);
	if([type isEqualToString: @"1"]) {
		tower = [MachineGunTower tower];
		tower.position = ccp((towerLoc.x * 32) + 16, self.map.contentSize.height - (towerLoc.y * 32) - 16);
		[self addChild:tower z:1];
		
		tower.tag = 1;
		[gc.towerArray addObject:tower];
		
	} else {
		NSLog(@"Tile Not Buildable");
	}
	
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
	
	//GameController *gc = [GameController getGameController];
	Wave * wave = [self getCurrentWave];
	static double lastTimeTargetAdded = 0;
    double now = [[NSDate date] timeIntervalSince1970];
    if(lastTimeTargetAdded == 0 || now - lastTimeTargetAdded >= wave.spawnRate) {
        [self addEnemy];
        lastTimeTargetAdded = now;
    }
	
    
	GameController *gc = [GameController getGameController];
	NSMutableArray *projectilesToDelete = [[NSMutableArray alloc] init];
    
	for (Bullet *bullet in gc.bulletArray) {
		
		CGRect projectileRect = CGRectMake(bullet.position.x - (bullet.contentSize.width/2), 
										   bullet.position.y - (bullet.contentSize.height/2), 
										   bullet.contentSize.width, 
										   bullet.contentSize.height);
        
		NSMutableArray *targetsToDelete = [[NSMutableArray alloc] init];
		
		for (CCSprite *enemy in gc.enemyArray) {
			CGRect targetRect = CGRectMake(enemy.position.x - (enemy.contentSize.width/2), 
										   enemy.position.y - (enemy.contentSize.height/2), 
										   enemy.contentSize.width, 
										   enemy.contentSize.height);
            
			if (CGRectIntersectsRect(projectileRect, targetRect)) {
                
				[projectilesToDelete addObject:bullet];
				
                //Enemy *creep = (Enemy*) enemy;
                //creep.hp--;
				
                //                if (creep.hp <= 0) {
                //                    [targetsToDelete addObject:target];
                //                }
                break;
                
			}						
		}
		
		for (CCSprite *target in targetsToDelete) {
			[gc.enemyArray removeObject:target];
			[self removeChild:target cleanup:YES];									
		}
		
		[targetsToDelete release];
	}
	
	for (CCSprite *bullet in projectilesToDelete) {
		[gc.bulletArray removeObject:bullet];
		[self removeChild:bullet cleanup:YES];
	}
	[projectilesToDelete release];
}

//
- (void)update:(ccTime)dt {
    
}


- (CGPoint)boundLayerPos:(CGPoint)newPos {
    CGSize winSize = [CCDirector sharedDirector].winSize;
    CGPoint retval = newPos;
    retval.x = MIN(retval.x, 0);
    retval.x = MAX(retval.x, -map.contentSize.width+winSize.width); 
    retval.y = MIN(0, retval.y);
    retval.y = MAX(-map.contentSize.height+winSize.height, retval.y); 
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

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	[super dealloc];
}

@end
