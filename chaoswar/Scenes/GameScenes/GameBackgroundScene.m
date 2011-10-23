#import "GameBackgroundScene.h"
#import "GameController.h"
#import "GameImfomationScene.h"
#import "GameMagicScene.h"
#import "GameControllerScene.h"
#import "GameHintScene.h"
#import "Pointer.h"

@implementation GameBackgroundScene

@synthesize background = _background;
@synthesize showground = _showground;
@synthesize waveLevel = _waveLevel;
@synthesize pointNum = _pointNum;

+ (id) scene:(int)gk JN1:(int)JN1 JN2:(int)JN2
{
	CCScene *scene = [CCScene node];
    
	GameBackgroundScene *gameBackgroundScene = [GameBackgroundScene node];
    [gameBackgroundScene initMap:gk];
	[scene addChild:gameBackgroundScene z:1];
    GameImfomationScene *gameImfomationScene = [GameImfomationScene node];
    [scene addChild:gameImfomationScene z:2];
    GameMagicScene *gameMagicScene = [GameMagicScene node];
    [gameMagicScene setMagic:JN1 JN2:JN2];
    [scene addChild:gameMagicScene z:3];
    GameControllerScene *gameControllerScene = [GameControllerScene node];
    [scene addChild:gameControllerScene z:4];
    GameHintScene *gameHintScene = [GameHintScene node];
    [scene addChild:gameHintScene z:5];
    
	GameController *gc = [GameController getGameController];
	gc.gameBackground = gameBackgroundScene;
    gc.gameImfomation = gameImfomationScene;
    gc.gameMagic = gameMagicScene;
    gc.gameController = gameControllerScene;
    gc.gameHint = gameHintScene;
    //==================初始化配置=================
    [gc initController:gk];
    [gc start];
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
        [self setIsTouchEnabled:YES];
	}
	return self;
}

- (void) initMap:(int)pn
{
    self.pointNum = pn + 1;
    //================读取地图文件=================
    CGSize size = [[CCDirector sharedDirector] winSize];
    //背景，表示是否可以通过的
    _background = [CCSprite spriteWithFile:[NSString stringWithFormat:@"map%04db.png", self.pointNum]];
    _background.position = CGPointMake(size.width /2 , size.height/2);
    _background.scale = 1;
    [self addChild:_background z:1];
    //前景，显示用的
    _showground = [CCSprite spriteWithFile:[NSString stringWithFormat:@"map%04ds.png", self.pointNum]];
    _showground.position = CGPointMake(size.width /2 , size.height/2);
    _showground.scale = 1;
    [self addChild:_showground z:2];
}

- (CGPoint)boundLayerPos:(CGPoint)newPos {
    CGPoint retval = newPos;
    retval.x = MIN(retval.x, 0);
    retval.y = MIN(0, retval.y);
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

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [self convertTouchToNodeSpace:[touches anyObject]];
    NSLog(@"click pos is (x:%f,y:%f)",point.x, point.y);
    GameController *gc = [GameController getGameController];
	switch (gc.screenClickType) {
		case SCT_ALL:
			[self sceneTouchBegan:touches operateType:[GameController getGameController].operateType];
			break;
		case SCT_ONLYWHITE:
			if ([gc.pt isWhite:point]) {
				[self sceneTouchBegan:touches operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_NOTWHITE:
			if (![gc.pt isWhite:point]) {
				[self sceneTouchBegan:touches operateType:[GameController getGameController].operateType];
			}
			break;
		default:
			break;
	}
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [self convertTouchToNodeSpace:[touches anyObject]];
    GameController *gc = [GameController getGameController];
	switch (gc.screenClickType) {
		case SCT_ALL:
			[self sceneTouchMoved:touches operateType:[GameController getGameController].operateType];
			break;
		case SCT_ONLYWHITE:
			if ([gc.pt isWhite:point]) {
				[self sceneTouchMoved:touches operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_NOTWHITE:
			if (![gc.pt isWhite:point]) {
				[self sceneTouchMoved:touches operateType:[GameController getGameController].operateType];
			}
			break;
		default:
			break;
	}
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [self convertTouchToNodeSpace:[touches anyObject]];
    GameController *gc = [GameController getGameController];
	switch (gc.screenClickType) {
		case SCT_ALL:
			[self sceneTouchEnded:touches operateType:[GameController getGameController].operateType];
			break;
		case SCT_ONLYWHITE:
			if ([gc.pt isWhite:point]) {
				[self sceneTouchEnded:touches operateType:[GameController getGameController].operateType];
			}
			break;
		case SCT_NOTWHITE:
			if (![gc.pt isWhite:point]) {
				[self sceneTouchEnded:touches operateType:[GameController getGameController].operateType];
			}
			break;
		default:
			break;
	}
}

- (void) sceneTouchBegan:(NSSet*)touches operateType:(TOperateType)operateType
{
	
}

- (void) sceneTouchMoved:(NSSet*)touches operateType:(TOperateType)operateType
{

}

- (void) sceneTouchEnded:(NSSet*)touches operateType:(TOperateType)operateType
{

}

- (void) dealloc
{
    [GameController delGameController];
	[super dealloc];
}

@end
