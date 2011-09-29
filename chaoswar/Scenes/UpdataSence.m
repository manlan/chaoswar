//
//  UpdataSence.m
//  Defend
//
//  Created by apple on 11-9-14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "UpdataSence.h"
#import "SelectSence.h"
#import "SceneManager.h"

@implementation UpdataSence

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	UpdataSence *layer = [UpdataSence node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
        CGSize size = [[CCDirector sharedDirector] winSize];
        //初始化参数
        itemId = -1;
        
        //加载背景图片
		bgImg = [CCSprite spriteWithFile:@"updataBg.png"];
		bgImg.position = CGPointMake(size.width /2 , size.height/2);
		bgImg.scale = 1;
		[self addChild:bgImg z:1];
        
        //加载分数前缀
		scoreTip = [CCSprite spriteWithFile:@"starLight.png"];
		scoreTip.position = CGPointMake(375 , 260);
		scoreTip.scale = 3;
		[self addChild:scoreTip z:2];
        
        //加载分数
        labelScore = [CCLabelTTF labelWithString:@"0" fontName:@"Georgia-Bold" fontSize:28];
		labelScore.position = CGPointMake(400 ,260);
		labelScore.anchorPoint = CGPointMake(0 ,0.5);
        labelScore.color = ccc3(255, 204, 0);
		[self addChild: labelScore z:2];
        
        //加载分数读取数据
        NSString *errorDesc = nil;
        NSPropertyListFormat format;
        NSString *publicPlistPath = [CCFileUtils fullPathFromRelativePath:@"PublicList.plist"];
        if ([[NSFileManager defaultManager] fileExistsAtPath:publicPlistPath]) {
			//NSLog(@"Not exsit");
            NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:publicPlistPath];
            NSMutableDictionary *publicInfo = (NSMutableDictionary *)[NSPropertyListSerialization
                                                 propertyListFromData:plistXML
                                                 mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                                 format:&format
                                                 errorDescription:&errorDesc];
            
            if (!publicInfo) {
                NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
            }
            
            int scoreVal = [(NSNumber*)[publicInfo objectForKey:@"GameScore"] intValue];
            
            [labelScore setString:[NSString stringWithFormat:@"%d",scoreVal]];
        }
        
        //加载返回按钮
		btnBack = [[CCMenuItemImage alloc] initFromNormalImage:@"btnBack.png" selectedImage:@"btnBack.png" disabledImage:@"btnBack.png" target:self selector:@selector(goToSelectSence:)];		
        CCMenu *btnBackMenu = [CCMenu menuWithItems:btnBack, nil];
		btnBackMenu.position = CGPointMake(450 , 30);
		[self addChild:btnBackMenu z:2];
        
        //加载升级按钮
        btnUpdata = [[CCMenuItemImage alloc] initFromNormalImage:@"btnUpdata.png" selectedImage:@"btnUpdata.png" disabledImage:@"btnBack.png" target:self selector:@selector(updataLevel:)];		
        CCMenu *btnUpdataMenu = [CCMenu menuWithItems:btnUpdata, nil];
		btnUpdataMenu.position = CGPointMake(380 , 30);
        btnUpdata.visible = NO;
		[self addChild:btnUpdataMenu z:2];
        
        //加载升级
        //NSString *errorDesc = nil;
        //NSPropertyListFormat format;
        NSString *plistPath = [CCFileUtils fullPathFromRelativePath:@"updataList.plist"];
        if ([[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
			//NSLog(@"Not exsit");
            NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
            NSMutableDictionary *updataInfo = (NSMutableDictionary *)[NSPropertyListSerialization
                                                propertyListFromData:plistXML
                                                mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                                format:&format
                                                errorDescription:&errorDesc];
            
            if (!updataInfo) {
                NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
            }
            
            NSMutableDictionary* items = [updataInfo objectForKey:@"Items" ];
            NSMutableDictionary *item;
            CGPoint itemPo;
            CCMenuItemImage *btnItem;
            NSString *picUrl;
            
            for (id key in items) {
                item = [items objectForKey:key];
                itemPo = CGPointFromString([item objectForKey:@"position"]);
                picUrl = [item objectForKey:@"picName"];
                
                btnItem = [[CCMenuItemImage alloc] initFromNormalImage:picUrl selectedImage:picUrl disabledImage:picUrl target:self  selector:@selector(updataJN:)];
                btnItem.tag = [(NSNumber*)[item objectForKey:@"id"] intValue];
                CCMenu *btnItemMenu = [CCMenu menuWithItems:btnItem, nil];
                btnItemMenu.position = itemPo;
                [self addChild:btnItemMenu z:2];
                [btnItem release];
            }
        }
	}
	return self;
}

-(void) goToSelectSence:(id) sender 
{
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransZoomFlipX:0.56f layer:[SelectSence node]]];
}

-(void) updataLevel:(id) sender 
{
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *plistPath = [CCFileUtils fullPathFromRelativePath:@"updataList.plist"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        //NSLog(@"Not exsit");
        NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
        NSMutableDictionary *updataInfo = (NSMutableDictionary *)[NSPropertyListSerialization
                                             propertyListFromData:plistXML
                                             mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                             format:&format
                                             errorDescription:&errorDesc];
        
        if (!updataInfo) {
            NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
        }
        
        NSMutableDictionary* items = [updataInfo objectForKey:@"Items"];
        NSMutableDictionary *item = [items objectForKey:[NSString stringWithFormat:@"Item%d", itemId]];
        int level = [(NSNumber*)[item objectForKey:@"level"] intValue];
        level++;
        [item setObject:[NSString stringWithFormat:@"%d", level] forKey:@"level" ];
        [updataInfo writeToFile:plistPath atomically:YES ];
        
        ////刷新升级页面
        level = [(NSNumber*)[item objectForKey:@"level"] intValue];
        NSString *picUrl = [item objectForKey:@"picName"]; 
        NSString *Explain2 = [item objectForKey:@"Explain2"];
        NSString *Explain3 = [item objectForKey:@"Explain3"];
        NSString *Explain;
        
        [self removeChild:itemIcon cleanup:NO];
        [self removeChild:labelLevel cleanup:NO];
        [self removeChild:labelExplain cleanup:NO];
        
        //加载默认的图标
        itemIcon = [CCSprite spriteWithFile:picUrl];
		itemIcon.position = CGPointMake(40 , 120);
		itemIcon.scale = 0.7;
		[self addChild:itemIcon z:2];
        //加载等级
        labelLevel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Level:%d/3", level] fontName:@"Georgia-Bold" fontSize:24];
		labelLevel.position = CGPointMake(90 ,120);
		labelLevel.anchorPoint = CGPointMake(0 ,0.5);
        labelLevel.color = ccc3(255, 204, 0);
		[self addChild: labelLevel z:2];
        if (level == 1) {
            Explain = Explain2;
        }
        else if (level == 2){
            Explain = Explain3; 
        }
        else{
            Explain = @"This is Max Level,can't update!"; 
        }
    
        //加载介绍
        labelExplain = [CCLabelTTF labelWithString:Explain dimensions:CGSizeMake(300,100) alignment:UITextAlignmentLeft fontName:@"Georgia" fontSize:16];
        //[CCLabelTTF labelWithString:Explain dimensions:CGSizeMake(300,300) fontName:@"Marker Felt" fontSize:18];
		labelExplain.position = CGPointMake(20 ,40);
        labelExplain.color = ccc3(255, 204, 0);
		labelExplain.anchorPoint = CGPointMake(0 ,0.5);
		[self addChild: labelExplain z:2];
        
        btnUpdata.visible = YES;
        
        if (level == 3) {
            btnUpdata.isEnabled = NO;
        }
        else{
            btnUpdata.isEnabled = YES;
        }
    }

    ////更新分数
    NSString *publicPlistPath = [CCFileUtils fullPathFromRelativePath:@"PublicList.plist"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:publicPlistPath]) {
        //NSLog(@"Not exsit");
        NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:publicPlistPath];
        NSMutableDictionary *publicInfo = (NSMutableDictionary *)[NSPropertyListSerialization
                                             propertyListFromData:plistXML
                                             mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                             format:&format
                                             errorDescription:&errorDesc];
        
        if (!publicInfo) {
            NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
        }
        
        int scoreVal = [(NSNumber*)[publicInfo objectForKey:@"GameScore"] intValue];
        scoreVal--;
        [publicInfo setObject:[NSString stringWithFormat:@"%d", scoreVal] forKey:@"GameScore" ];
        [publicInfo writeToFile:publicPlistPath atomically:YES ];
        
        //[scoreAtlas setString:[NSString stringWithFormat:@"%d", scoreVal]];
        [labelScore setString:[NSString stringWithFormat:@"%d",scoreVal]];
    }
}

-(void) updataJN:(id) sender 
{
    CCMenuItemImage *button = sender;
    int intId = button.tag;
    itemId = intId;
    
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *plistPath = [CCFileUtils fullPathFromRelativePath:@"updataList.plist"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        //NSLog(@"Not exsit");
        NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
        NSMutableDictionary *updataInfo = (NSMutableDictionary *)[NSPropertyListSerialization
                                             propertyListFromData:plistXML
                                             mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                             format:&format
                                             errorDescription:&errorDesc];
        
        if (!updataInfo) {
            NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
        }
        
        NSDictionary* items = [updataInfo objectForKey:@"Items"];
        NSDictionary *item = [items objectForKey:[NSString stringWithFormat:@"Item%d", intId]];
        int level = [(NSNumber*)[item objectForKey:@"level"] intValue];
        NSString *picUrl = [item objectForKey:@"picName"]; 
        NSString *Explain2 = [item objectForKey:@"Explain2"];
        NSString *Explain3 = [item objectForKey:@"Explain3"];
        NSString *Explain;
        
        [self removeChild:itemIcon cleanup:NO];
        [self removeChild:labelLevel cleanup:NO];
        [self removeChild:labelExplain cleanup:NO];
        
        //加载默认的图标
        itemIcon = [CCSprite spriteWithFile:picUrl];
		itemIcon.position = CGPointMake(40 , 120);
		itemIcon.scale = 0.7;
		[self addChild:itemIcon z:2];
        
        //加载等级
        labelLevel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Level:%d/3", level] fontName:@"Georgia-Bold" fontSize:24];
		labelLevel.position = CGPointMake(90 ,120);
		labelLevel.anchorPoint = CGPointMake(0 ,0.5);
        labelLevel.color = ccc3(255, 204, 0);
		[self addChild: labelLevel z:2];
        
        if (level == 1) {
            Explain = Explain2;
        }
        else if (level == 2){
           Explain = Explain3; 
        }
        else{
            Explain = @"This is Max Level,can't update!"; 
        }
        
        //加载介绍
        labelExplain = [CCLabelTTF labelWithString:Explain dimensions:CGSizeMake(300,100) alignment:UITextAlignmentLeft fontName:@"Georgia" fontSize:16];
        //[CCLabelTTF labelWithString:Explain dimensions:CGSizeMake(300,300) fontName:@"Marker Felt" fontSize:18];
		labelExplain.position = CGPointMake(20 ,40);
		labelExplain.anchorPoint = CGPointMake(0 ,0.5);
        labelExplain.color = ccc3(255, 204, 0);
		[self addChild: labelExplain z:2];
        
        btnUpdata.visible = YES;
        
        if (level == 3) {
            btnUpdata.isEnabled = NO;
        }
        else{
            btnUpdata.isEnabled = YES;
        }
    }
}

- (void) dealloc
{
	[super dealloc];
}

@end
