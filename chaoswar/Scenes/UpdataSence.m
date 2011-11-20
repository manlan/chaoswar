#import "UpdataSence.h"
#import "SelectSence.h"
#import "SceneManager.h"
#import "DataController.h"

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
        gLock = NO;
        
        //加载背景图片
		bgImg = [CCSprite spriteWithFile:@"updataBg.png"];
		bgImg.position = CGPointMake(size.width /2 , size.height/2);
		bgImg.scale = 1;
		[self addChild:bgImg z:1];
        
        //加载tip图片
		tipImg = [CCSprite spriteWithFile:@"updataTip.png"];
		tipImg.position = CGPointMake(170 , 70);
		tipImg.scale = 1;
		[self addChild:tipImg z:2];
        
        //加载分数前缀
		scoreTip = [CCSprite spriteWithFile:@"jinBi.png"];
		scoreTip.position = CGPointMake(360 , 280);
		[self addChild:scoreTip z:2];
        
        //加载分数
        labelScore = [CCLabelTTF labelWithString:@"0" fontName:@"Georgia-Bold" fontSize:38];
		labelScore.position = CGPointMake(380 ,283);
		labelScore.anchorPoint = CGPointMake(0 ,0.5);
        labelScore.color = ccc3(255, 204, 0);
		[self addChild: labelScore z:2];
        
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
		spriteXz.position = ccp(65,230);
		[spriteXz runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:1.5 animation:animationXz restoreOriginalFrame:NO] ]];
        
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
		btnBack = [[CCMenuItemImage alloc] initFromNormalImage:@"btnBack.png" selectedImage:@"btnBackDown.png" disabledImage:@"btnBack.png" target:self selector:@selector(goToSelectSence:)];		
        CCMenu *btnBackMenu = [CCMenu menuWithItems:btnBack, nil];
		btnBackMenu.position = CGPointMake(420 , 50);
		[self addChild:btnBackMenu z:2];
        
        //加载升级按钮
        btnUpdata = [[CCMenuItemImage alloc] initFromNormalImage:@"btnUpdateLv.png" selectedImage:@"btnUpdateLvDown.png" disabledImage:@"btnUpdataHui.png" target:self selector:@selector(updataLevel:)];		
        CCMenu *btnUpdataMenu = [CCMenu menuWithItems:btnUpdata, nil];
		btnUpdataMenu.position = CGPointMake(348 , 50);
        btnUpdata.visible = NO;
		[self addChild:btnUpdataMenu z:2];
        
        //加载初始化按钮
		btnReset = [[CCMenuItemImage alloc] initFromNormalImage:@"btnUpdate.png" selectedImage:@"btnUpdateDown.png" disabledImage:@"btnUpdate.png" target:self selector:@selector(resetScore:)];		
        CCMenu *btnResetMenu = [CCMenu menuWithItems:btnReset, nil];
		btnResetMenu.position = CGPointMake(50 , 290);
		[self addChild:btnResetMenu z:2];
		[btnReset release];
        
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
        
        [self updataJnById:0];
	}
	return self;
}

-(void) goToSelectSence:(id) sender 
{
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransZoomFlipX:0.56f layer:[SelectSence node]]];
}

-(void) updataLevel:(id) sender 
{
    if (gLock == YES) {
        return;
    }
    
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
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
        if(scoreVal <=0 )
        {
             [labelScore runAction:[CCBlink actionWithDuration:0.5 blinks:2]];
            return;
        }
        scoreVal--;
        [publicInfo setObject:[NSString stringWithFormat:@"%d", scoreVal] forKey:@"GameScore" ];
        [publicInfo writeToFile:publicPlistPath atomically:YES ];
        
        //[scoreAtlas setString:[NSString stringWithFormat:@"%d", scoreVal]];
        [labelScore setString:[NSString stringWithFormat:@"%d",scoreVal]];
    }
    
    
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
        
        CGPoint itemPo = CGPointFromString([item objectForKey:@"position"]);
        spriteXz.position = itemPo;
        
        
        [self removeChild:itemIcon cleanup:NO];
        [self removeChild:labelLevel cleanup:NO];
        [self removeChild:labelExplain cleanup:NO];
        
        //加载升级动画
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"SjSheet.plist"];
		spritebatchSj = [CCSpriteBatchNode batchNodeWithFile:@"SjSheet.png"];
		[self addChild:spritebatchSj z:3];
		
		NSMutableArray *animFramesSj = [NSMutableArray array];
		for(int i = 1; i < 18; i++) {
			CCSpriteFrame *frameSj = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"1%04d.png",i]];
			if (i==1) {
				spriteSj = [[CCSprite alloc] initWithSpriteFrame:frameSj];
			}
			[animFramesSj addObject:frameSj];
		}
		animationSj = [CCAnimation animationWithName:@"Sj" frames:animFramesSj];
		[spritebatchSj addChild:spriteSj];
		[spriteSj release];
        spriteSj.position = itemPo;
		[spriteSj runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:1 animation:animationSj  restoreOriginalFrame:NO]]];
        
        //加载默认的图标
        itemIcon = [CCSprite spriteWithFile:picUrl];
		itemIcon.position = CGPointMake(70 , 70);
		itemIcon.scale = 0.75;
		[self addChild:itemIcon z:2];
        //加载等级
        labelLevel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Level:%d/3", level] fontName:@"Georgia-Bold" fontSize:22];
		labelLevel.position = CGPointMake(315 ,95);
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
        labelExplain = [CCLabelTTF labelWithString:Explain dimensions:CGSizeMake(200,100) alignment:UITextAlignmentLeft fontName:@"Georgia" fontSize:16];
        //[CCLabelTTF labelWithString:Explain dimensions:CGSizeMake(300,300) fontName:@"Marker Felt" fontSize:18];
		labelExplain.position = CGPointMake(100 ,50);
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

    
    
    gLock = YES;
    [self runAction:[CCSequence actions:
                     [CCDelayTime actionWithDuration:1],
                     [CCCallFunc actionWithTarget:self selector:@selector(clearSj)],
                     nil]];
}

-(void) clearSj
{
    gLock = NO;
    [self removeChild:spritebatchSj cleanup:NO];
    [self removeChild:spriteSj cleanup:NO];
    //[self removeChild:animationSj cleanup:NO];
}

-(void) updataJnById:(int) jnId
{
    if (gLock == YES) {
        return;
    }
    int intId = jnId;
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
        
        CGPoint itemPo = CGPointFromString([item objectForKey:@"position"]);
        spriteXz.position = itemPo;
        spriteSj.position = itemPo;
        
        [self removeChild:itemIcon cleanup:NO];
        [self removeChild:labelLevel cleanup:NO];
        [self removeChild:labelExplain cleanup:NO];
        
        //加载默认的图标
        itemIcon = [CCSprite spriteWithFile:picUrl];
		itemIcon.position = CGPointMake(70 , 70);
		itemIcon.scale = 0.75;
		[self addChild:itemIcon z:2];
        
        //加载等级
        labelLevel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Level:%d/3", level] fontName:@"Georgia-Bold" fontSize:22];
		labelLevel.position = CGPointMake(315 ,95);
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
        labelExplain = [CCLabelTTF labelWithString:Explain dimensions:CGSizeMake(200,100) alignment:UITextAlignmentLeft fontName:@"Georgia" fontSize:16];
        //[CCLabelTTF labelWithString:Explain dimensions:CGSizeMake(300,300) fontName:@"Marker Felt" fontSize:18];
		labelExplain.position = CGPointMake(100 ,50);
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

-(void) updataJN:(id) sender 
{
    if (gLock == YES) {
        return;
    }
    CCMenuItemImage *button = sender;
    int intId = button.tag;
    itemId = intId;
    [self updataJnById:intId];  
}

-(void) resetScore:(id) sender 
{
    [DataController resetGameScore];
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
}

- (void) dealloc
{
	[super dealloc];
}

@end
