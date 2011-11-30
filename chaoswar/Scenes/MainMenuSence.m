#import "MainMenuSence.h"
#import "SelectSence.h"
#import "GameBackgroundScene.h"
#import "SceneManager.h"
#import "HelpSence.h"
#import "CreditsSence.h"
#import "SimpleAudioEngine.h"

@implementation MainMenuSence

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	MainMenuSence *layer = [MainMenuSence node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"mainBg.mp3"];
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        //加载背景图片
		bgImg = [CCSprite spriteWithFile:@"mainMenuBg.png"];
		bgImg.position = CGPointMake(size.width /2 , size.height/2);
		bgImg.scale = 1;
		[self addChild:bgImg z:1];
        
        //加载logo图片
		logoImg = [CCSprite spriteWithFile:@"logo.png"];
		logoImg.position = CGPointMake(size.width /2 , 255);
		logoImg.scale = 1;
		[self addChild:logoImg z:2];

        //加载开始按钮
		btnPlay = [CCMenuItemImage itemFromNormalImage:@"btnPlay.png" selectedImage:@"btnPlay.png" disabledImage:@"btnPlay.png" target:self selector:@selector(goToSelectSence:)];		
		CCMenu *btnPlayMenu = [CCMenu menuWithItems:btnPlay, nil];
		btnPlayMenu.position = CGPointMake(size.width /2 , 170);
		[self addChild:btnPlayMenu z:2];
		
		//加载开发团队介绍
		btnCredits = [CCMenuItemImage itemFromNormalImage:@"btnCredit.png" selectedImage:@"btnCredit.png" disabledImage:@"btnCredit.png" target:self selector:@selector(goToCreditsSence:)];		
		CCMenu *btnCreditsMenu = [CCMenu menuWithItems:btnCredits, nil];
		btnCreditsMenu.position = CGPointMake(size.width /2 , 40);
		[self addChild:btnCreditsMenu z:2];
        
        //加载帮助介绍
		btnHelp = [CCMenuItemImage itemFromNormalImage:@"btnHelp.png" selectedImage:@"btnHelp.png" disabledImage:@"btnHelp.png" target:self selector:@selector(goToHelpSence:)];		
        CCMenu *btnHelpMenu = [CCMenu menuWithItems:btnHelp, nil];
		btnHelpMenu.position = CGPointMake(size.width /2 , 105);
		[self addChild:btnHelpMenu z:2];
	}
	return self;
}

-(void) goToSelectSence:(id) sender 
{
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransFadeUp:0.56f layer:[SelectSence node]]];
    //[[CCDirector sharedDirector] replaceScene: [SceneManager TransFade:0.56f scene:[GameBackgroundScene scene:0 JN1:1 JN2:2]]];
}

-(void) goToHelpSence:(id) sender 
{
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransFadeUp:0.56f layer:[HelpSence node]]];
}

-(void) goToCreditsSence:(id) sender 
{
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransFadeUp:0.56f layer:[CreditsSence node]]];
}

- (void) dealloc
{
	[super dealloc];
}

@end
