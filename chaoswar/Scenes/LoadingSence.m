//
//  LoadingSence.m
//  chaoswar
//
//  Created by apple on 11-10-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "LoadingSence.h"
#import "GameBackgroundScene.h"
#import "SceneManager.h"

@implementation LoadingSence

@synthesize pointNum;

+(CCScene *) scene:(int)pn;
{
	CCScene *scene = [CCScene node];
	LoadingSence *layer = [LoadingSence node];
    layer.pointNum = pn;
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
        CGSize size = [[CCDirector sharedDirector] winSize];
        //加载背景图片
		bgImg = [CCSprite spriteWithFile:@"loadingBg.png"];
		bgImg.position = CGPointMake(size.width /2 , size.height/2);
		bgImg.scale = 1;
		[self addChild:bgImg z:1];
        
        //加载Loading动画
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"LoadingSheet.plist"];
		spritebatchLoading = [CCSpriteBatchNode batchNodeWithFile:@"LoadingSheet.png"];
		[self addChild:spritebatchLoading z:3];
		
		NSMutableArray *animFramesLoading = [NSMutableArray array];
		for(int i = 1; i < 11; i++) {
			CCSpriteFrame *frameLoading = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"1%04d.png",i]];
			if (i==1) {
				spriteLoading = [[CCSprite alloc] initWithSpriteFrame:frameLoading];
			}
			[animFramesLoading addObject:frameLoading];
		}
		animationLoading = [CCAnimation animationWithName:@"Loading" frames:animFramesLoading];
		[spritebatchLoading addChild:spriteLoading];
		[spriteLoading release];
		spriteLoading.position = ccp(360,60);
		[spriteLoading runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:1 animation:animationLoading restoreOriginalFrame:NO] ]];
        
        [self runAction:[CCSequence actions:
                         [CCDelayTime actionWithDuration:2],
                         [CCCallFunc actionWithTarget:self selector:@selector(goToGameSence)],
                         nil]];
	}
	return self;
}

-(void) goToGameSence
{
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransFade:0.56f scene:[GameBackgroundScene scene:pointNum]]];
}

- (void) dealloc
{
	[super dealloc];
}

@end
