#import "GameImfomationScene.h"
#import "GameHintScene.h"
#import "GameController.h"
#import "SceneManager.h"
#import "SelectSence.h"
#import "SimpleAudioEngine.h"

@implementation GameImfomationScene

@synthesize btnPause = _btnPause;
@synthesize lblEnemyNum = _lblEnemyNum;
@synthesize lblWave = _lblWave;
@synthesize lblGold = _lblGold;

-(id) init
{
	if( (self=[super init])) {
        //CGSize size = [[CCDirector sharedDirector] winSize];
		//暂停
		_btnPause = [CCMenuItemImage itemFromNormalImage:@"pause_black.png" selectedImage:@"pause_normal.png"  
										  disabledImage:@"pause_black.png"  target:self selector:@selector(pauseGame:)];
		CCMenu *btnPauseMenu = [CCMenu menuWithItems:_btnPause, nil];
		btnPauseMenu.position = ccp(446 , 300);
		[self addChild:btnPauseMenu z:2];
		
		//===============背景===============
		CCSprite *bottom = [CCSprite spriteWithFile:@"bottom_bg.png"];
		bottom.position = ccp(240 , 15);
		[self addChild:bottom z:1];
		
		//=============防御漏兵==============
		CCSprite *xueTip = [CCSprite spriteWithFile:@"xueTip.png"];
		xueTip.position = ccp(260 , 300);
		[self addChild:xueTip z:1];
		_lblEnemyNum = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:12];
		_lblEnemyNum.position = ccp(286 , 300);
        _lblEnemyNum.color = TDS_FONT_COLOR;
		[self addChild:_lblEnemyNum z:1];
		
		//===============金额===============
		CCSprite *qianTip = [CCSprite spriteWithFile:@"qianTip.png"];
		qianTip.position = ccp(315 , 300);
		[self addChild:qianTip z:1];
		_lblGold = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:12];
		_lblGold.position = ccp(342 , 300);
        _lblGold.color = TDS_FONT_COLOR;
		[self addChild:_lblGold z:1];
		
		//===============波数===============
		CCSprite *wavesTip = [CCSprite spriteWithFile:@"wavesTip.png"];
		wavesTip.position = ccp(370 , 300);
		[self addChild:wavesTip z:1];
		_lblWave = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:12];
		_lblWave.position = ccp(400 , 300);
        _lblWave.color = TDS_FONT_COLOR;
		[self addChild:_lblWave z:1];
		
		//=============技能背景===============
		CCSprite *jiNengBg = [CCSprite spriteWithFile:@"jiNengBg.png"];
		jiNengBg.position = ccp(75 , 20);
		[self addChild:jiNengBg z:2];
    }
	return self;
}

-(void) pauseGame:(id) sender 
{
    [[CCDirector sharedDirector] pause];
	GameController *gc = [GameController getGameController];
	[gc.gameHint removeAllChildrenWithCleanup:YES];
    //背景
	CCSprite *pauseBg = [CCSprite spriteWithFile:@"pauseBg.png"];
	pauseBg.position = ccp(240 , 160);
	[gc.gameHint addChild:pauseBg z:1];
	
	//继续
	CCMenuItemImage *btnResume = [CCMenuItemImage itemFromNormalImage:@"btnResume.png" selectedImage:@"btnResume.png"  
									  disabledImage:@"btnResume.png"  target:self selector:@selector(Resume:)];
	CCMenu *btnResumeMenu = [CCMenu menuWithItems:btnResume, nil];
	btnResumeMenu.position = ccp(240 , 185);
	[gc.gameHint addChild:btnResumeMenu z:2];
	
	//菜单
	CCMenuItemImage *btnMenu = [CCMenuItemImage itemFromNormalImage:@"btnMenu.png" selectedImage:@"btnMenu.png"  
														disabledImage:@"btnMenu.png"  target:self selector:@selector(Menu:)];
	CCMenu *btnMenuMenu = [CCMenu menuWithItems:btnMenu, nil];
	btnMenuMenu.position = ccp(240 , 135);
	[gc.gameHint addChild:btnMenuMenu z:2];
	
	//重来
	CCMenuItemImage *btnRestart = [CCMenuItemImage itemFromNormalImage:@"btnRestart.png" selectedImage:@"btnRestart.png"  
													  disabledImage:@"btnRestart.png"  target:self selector:@selector(Restart:)];
	CCMenu *btnRestartMenu = [CCMenu menuWithItems:btnRestart, nil];
	btnRestartMenu.position = ccp(240 , 85);
	[gc.gameHint addChild:btnRestartMenu z:2];
    
    [gc setGameStatus];
}

-(void) Resume:(id) sender 
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn.wav"];
    [[CCDirector sharedDirector] resume];
	GameController *gc = [GameController getGameController];
	[gc.gameHint removeAllChildrenWithCleanup:YES];
    [gc setGameStatus];
}

-(void) Menu:(id) sender 
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn.wav"];
    [[CCDirector sharedDirector] resume];
    [[GameController getGameController] releaseScene];
//    GameController *gc = [GameController getGameController];
//    [gc.gameHint removeAllChildrenWithCleanup:YES];
//    [gc releaseScene];
	[[CCDirector sharedDirector] replaceScene: [SceneManager TransFade:0.56f scene:[SelectSence scene]]];
}

-(void) Restart:(id) sender 
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn.wav"];
    [[CCDirector sharedDirector] resume];
	GameController *gc = [GameController getGameController];
    [gc.gameHint removeAllChildrenWithCleanup:YES];
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"mainBg.mp3"];
	[gc restart];
    [gc setGameStatus];
}

- (void) setPauseMenuStatus
{
    if ([CCDirector sharedDirector].isPaused) {
        [_btnPause setIsEnabled:NO];
        return;
    }
    
    [_btnPause setIsEnabled:YES];
}

- (void) setEnemyNumValue
{
    GameController *gc = [GameController getGameController];
    if (_lblEnemyNum) {
        [_lblEnemyNum setString:[NSString stringWithFormat:@"%d", gc.currentHealth]];
    }
}

- (void) setWaveValue
{
    GameController *gc = [GameController getGameController];
    if (_lblWave) {
        [_lblWave setString:[NSString stringWithFormat:@"%d/%d", gc.currentWave, gc.maxWave]];
    }
}

- (void) setGoldValue
{
    GameController *gc = [GameController getGameController];
    if (_lblGold) {
        [_lblGold setString:[NSString stringWithFormat:@"%d", gc.currentGold]];
    }
}

- (void) dealloc {
    [super dealloc];
}

@end
