//
//  HelpSence.m
//  chaoswar
//
//  Created by apple on 11-10-6.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "HelpSence.h"
#import "SceneManager.h"
#import "MainMenuSence.h"

@implementation HelpSence

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	HelpSence *layer = [HelpSence node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
        CGSize size = [[CCDirector sharedDirector] winSize];
        //加载背景图片
		bgImg = [CCSprite spriteWithFile:@"helpBg.png"];
		bgImg.position = CGPointMake(size.width /2 , size.height/2);
		bgImg.scale = 1;
		[self addChild:bgImg z:1];
        
        //加载返回按钮
		btnBack = [[CCMenuItemImage alloc] initFromNormalImage:@"btnBack.png" selectedImage:@"btnBackDown.png" disabledImage:@"btnBack.png" target:self selector:@selector(goToMainMenuSence:)];		
        CCMenu *btnBackMenu = [CCMenu menuWithItems:btnBack, nil];
		btnBackMenu.position = CGPointMake(415 , 275);
		[self addChild:btnBackMenu z:2];
		[btnBack release];
        
        //加载选中动画
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"XzSheet.plist"];
		spritebatchXz = [CCSpriteBatchNode batchNodeWithFile:@"XzSheet.png"];
		[self addChild:spritebatchXz z:3];
		
		NSMutableArray *animFramesXz = [NSMutableArray array];
		for(int i = 1; i < 10; i++) {
			CCSpriteFrame *frameXz = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"1%04d.png",i]];
			if (i==1) {
				spriteXz = [[CCSprite alloc] initWithSpriteFrame:frameXz];
			}
			[animFramesXz addObject:frameXz];
		}
		animationXz = [CCAnimation animationWithName:@"Xz" frames:animFramesXz];
		[spritebatchXz addChild:spriteXz];
		[spriteXz release];
		spriteXz.position = ccp(85,230);
		[spriteXz runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:1.5 animation:animationXz restoreOriginalFrame:NO] ]];
        
        //加载升级
        NSString *fristExplain;
        NSString *errorDesc = nil;
        NSPropertyListFormat format;
        NSString *plistPath = [CCFileUtils fullPathFromRelativePath:@"helpList.plist"];
        if ([[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
			//NSLog(@"Not exsit");
            NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
            NSMutableDictionary *helpInfo = (NSMutableDictionary *)[NSPropertyListSerialization
                                                                      propertyListFromData:plistXML
                                                                      mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                                                      format:&format
                                                                      errorDescription:&errorDesc];
            
            if (!helpInfo) {
                NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
            }
            
            NSMutableDictionary* items = [helpInfo objectForKey:@"Items" ];
            NSMutableDictionary *item;
            CGPoint itemPo;
            CCMenuItemImage *btnItem;
            NSString *picUrl;
            
            for (id key in items) {
                item = [items objectForKey:key];
                itemPo = CGPointFromString([item objectForKey:@"position"]);
                picUrl = [item objectForKey:@"picName"];
                
                btnItem = [[CCMenuItemImage alloc] initFromNormalImage:picUrl selectedImage:picUrl disabledImage:picUrl target:self  selector:@selector(getJieshao:)];
                btnItem.tag = [(NSNumber*)[item objectForKey:@"id"] intValue];
                if (btnItem.tag == 0) {
                    fristExplain = [item objectForKey:@"Explain"];
                }
                
                CCMenu *btnItemMenu = [CCMenu menuWithItems:btnItem, nil];
                btnItemMenu.position = itemPo;
                [self addChild:btnItemMenu z:2];
                [btnItem release];
            }
        }
        
        //加载介绍
        labelExplain = [CCLabelTTF labelWithString:fristExplain dimensions:CGSizeMake(185,200) alignment:UITextAlignmentLeft fontName:@"Georgia" fontSize:16];
        //[CCLabelTTF labelWithString:Explain dimensions:CGSizeMake(300,300) fontName:@"Marker Felt" fontSize:18];
		labelExplain.position = CGPointMake(250 ,30);
		labelExplain.anchorPoint = CGPointMake(0 ,0);
        labelExplain.color = ccc3(255, 204, 0);
		[self addChild: labelExplain z:2];
	}
	return self;
}

-(void) getJieshao:(id) sender 
{
    CCMenuItemImage *button = (CCMenuItemImage*) sender;
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *plistPath = [CCFileUtils fullPathFromRelativePath:@"helpList.plist"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        //NSLog(@"Not exsit");
        NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
        NSMutableDictionary *helpInfo = (NSMutableDictionary *)[NSPropertyListSerialization
                                                                  propertyListFromData:plistXML
                                                                  mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                                                  format:&format
                                                                  errorDescription:&errorDesc];
        
        if (!helpInfo) {
            NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
        }
        
        NSMutableDictionary* items = [helpInfo objectForKey:@"Items"];
        NSMutableDictionary *item = [items objectForKey:[NSString stringWithFormat:@"Item%d", button.tag]];
        
        NSString *Explain = [item objectForKey:@"Explain"];
        
        CGPoint itemPo = CGPointFromString([item objectForKey:@"position"]);
        spriteXz.position = itemPo;
        [labelExplain setString:Explain];
    }
}

-(void) goToMainMenuSence:(id) sender 
{
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransFadeDown:0.56f layer:[MainMenuSence node]]];
}

- (void) dealloc
{
	[super dealloc];
}

@end
