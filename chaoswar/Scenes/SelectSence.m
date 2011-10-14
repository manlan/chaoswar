//
//  SelectSence.m
//  Defend
//
//  Created by apple on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "SelectSence.h"
#import "MainMenuSence.h"
#import "UpdataSence.h"
#import "SceneManager.h"
#import "GameBackgroundScene.h"
#import "LoadingSence.h"

@implementation SelectSence

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	SelectSence *layer = [SelectSence node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
		//初始化参数
		intJN001 = 10;
		intJN002 = 10;
		guanKa = 0;
		
        CGSize size = [[CCDirector sharedDirector] winSize];
        //加载背景图片
        bgImg = [CCSprite spriteWithFile:@"selectWaveBg.png"];
		bgImg.position = CGPointMake(size.width /2 , size.height/2);
		bgImg.scale = 1;
		[self addChild:bgImg z:1];
		
		//加载魔法背景图片
        btnWaveStationLight = [CCSprite spriteWithFile:@"waveStationLight.png"];
		btnWaveStationLight.position = CGPointMake(size.width /2 , size.height/2);
		btnWaveStationLight.scale = 1;
        btnWaveStationLight.visible = NO;
		[self addChild:btnWaveStationLight z:5];
        
        //加载魔法背景图片
        selectMagicBg = [CCSprite spriteWithFile:@"selectMagicBg.png"];
		selectMagicBg.position = CGPointMake(size.width /2 , size.height/2);
		selectMagicBg.scale = 1;
		[self addChild:selectMagicBg z:13];
        
        //加载透明按钮
        btnTouMing = [[CCMenuItemImage alloc] initFromNormalImage:@"touMingBg.png" selectedImage:@"touMingBg.png" disabledImage:@"touMingBg.png" target:self selector:@selector(doNothing:)];		
        CCMenu *btnTouMingMenu = [CCMenu menuWithItems:btnTouMing, nil];
		btnTouMingMenu.position = CGPointMake(size.width /2 , size.height/2);
        btnTouMing.visible = NO;
		[self addChild:btnTouMingMenu z:3];
		[btnTouMing release];
		
		//加载技能1按钮
		btnJN001 = [[CCMenuItemImage alloc] initFromNormalImage:@"jN001.png" selectedImage:@"jN001.png" disabledImage:@"jN001Hui.png" target:self selector:@selector(addJn:)];		
        CCMenu *btnJN001Menu = [CCMenu menuWithItems:btnJN001, nil];
		btnJN001Menu.position = CGPointMake(144 , 175);
		btnJN001.tag = 1;
		[self addChild:btnJN001Menu z:14];
		[btnJN001 release];
		
		//加载技能2按钮
		btnJN002 = [[CCMenuItemImage alloc] initFromNormalImage:@"jN002.png" selectedImage:@"jN002.png" disabledImage:@"jN002Hui.png" target:self selector:@selector(addJn:)];		
        CCMenu *btnJN002Menu = [CCMenu menuWithItems:btnJN002, nil];
		btnJN002Menu.position = CGPointMake(215 , 175);
		btnJN002.tag = 2;
		[self addChild:btnJN002Menu z:14];
		[btnJN002 release];
		
		//加载技能3按钮
		btnJN003 = [[CCMenuItemImage alloc] initFromNormalImage:@"jN003.png" selectedImage:@"jN003.png" disabledImage:@"jN003Hui.png" target:self selector:@selector(addJn:)];		
        CCMenu *btnJN003Menu = [CCMenu menuWithItems:btnJN003, nil];
		btnJN003Menu.position = CGPointMake(286 , 175);
		btnJN003.tag = 3;
		[self addChild:btnJN003Menu z:14];
		[btnJN003 release];
		
		//加载技能4按钮
		btnJN004 = [[CCMenuItemImage alloc] initFromNormalImage:@"jN004.png" selectedImage:@"jN004.png" disabledImage:@"jN004Hui.png" target:self selector:@selector(addJn:)];		
        CCMenu *btnJN004Menu = [CCMenu menuWithItems:btnJN004, nil];
		btnJN004Menu.position = CGPointMake(357 , 175);
		btnJN004.tag = 4;
		[self addChild:btnJN004Menu z:14];
		[btnJN004 release];
		
		//加载技能1边框按钮
		btnselectJn1 = [[CCMenuItemImage alloc] initFromNormalImage:@"selectJn.png" selectedImage:@"selectJn.png" disabledImage:@"selectJn.png" target:self selector:@selector(removeJn1:)];		
        CCMenu *btnselectJn1Menu = [CCMenu menuWithItems:btnselectJn1, nil];
		btnselectJn1Menu.position = CGPointMake(144 , 115);
		[self addChild:btnselectJn1Menu z:14];
		[btnselectJn1 release];
		
		//加载技能2边框按钮
		btnselectJn2 = [[CCMenuItemImage alloc] initFromNormalImage:@"selectJn.png" selectedImage:@"selectJn.png" disabledImage:@"selectJn.png" target:self selector:@selector(removeJn2:)];		
        CCMenu *btnselectJn2Menu = [CCMenu menuWithItems:btnselectJn2, nil];
		btnselectJn2Menu.position = CGPointMake(214 , 115);
		[self addChild:btnselectJn2Menu z:14];
		[btnselectJn2 release];
		
        //加载关闭按钮
		btnClose = [[CCMenuItemImage alloc] initFromNormalImage:@"close.png" selectedImage:@"closeDown.png" disabledImage:@"close.png" target:self selector:@selector(closeMagic:)];		
        CCMenu *btnCloseMenu = [CCMenu menuWithItems:btnClose, nil];
		btnCloseMenu.position = CGPointMake(385 , 224);
		[self addChild:btnCloseMenu z:15];
        btnClose.visible = NO;
		[btnClose release];
        
		//加载开始 按钮
		btnPlay = [[CCMenuItemImage alloc] initFromNormalImage:@"btnPlay.png" selectedImage:@"btnPlay.png" disabledImage:@"btnPlayHui.png" target:self selector:@selector(goToLoadingSence:)];		
        CCMenu *btnPlayMenu = [CCMenu menuWithItems:btnPlay, nil];
		btnPlayMenu.position = CGPointMake(322 , 115);
		[self addChild:btnPlayMenu z:14];
		btnPlay.scale = 0.7;
		btnPlay.isEnabled = NO;
		[btnPlay release];
        
        //加载返回按钮
		btnBack = [[CCMenuItemImage alloc] initFromNormalImage:@"btnBack.png" selectedImage:@"btnBackDown.png" disabledImage:@"btnBack.png" target:self selector:@selector(goToMainMenuSence:)];		
        CCMenu *btnBackMenu = [CCMenu menuWithItems:btnBack, nil];
		btnBackMenu.position = CGPointMake(450 , 30);
		[self addChild:btnBackMenu z:2];
		[btnBack release];
        
        //加载升级按钮
		btnUpdata = [[CCMenuItemImage alloc] initFromNormalImage:@"btnUpdate.png" selectedImage:@"btnUpdateDown.png" disabledImage:@"btnUpdate.png" target:self selector:@selector(goToUpdataSence:)];		
        CCMenu *btnUpdataMenu = [CCMenu menuWithItems:btnUpdata, nil];
		btnUpdataMenu.position = CGPointMake(375 , 30);
		[self addChild:btnUpdataMenu z:2];
		[btnUpdata release];
        
        //加载关卡及分数
        NSString *errorDesc = nil;
        NSPropertyListFormat format;
        NSString *plistPath = [CCFileUtils fullPathFromRelativePath:@"WaveSelectList.plist"];
        if ([[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
			//NSLog(@"Not exsit");
            NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
            wavesInfo = (NSMutableDictionary *)[NSPropertyListSerialization
                                                propertyListFromData:plistXML
                                                mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                                format:&format
                                                errorDescription:&errorDesc];
            
            if (!wavesInfo) {
                NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
            }

            NSDictionary* waves = [wavesInfo objectForKey:@"Waves" ];
            NSDictionary *wave;
            CGPoint waveStationPo;
            CCMenuItemImage *btnWaveStation;
            CCSprite *waveScore;
            int score;
            int isCanPLay;
            
            for (id key in waves) {
                wave = [waves objectForKey:key];
                waveStationPo = CGPointFromString([wave objectForKey:@"position"]);
                isCanPLay = [(NSNumber*)[wave objectForKey:@"open"] intValue];
                
                if (isCanPLay == 1) {
                    btnWaveStation = [[CCMenuItemImage alloc] initFromNormalImage:@"btnWaveStation.png" selectedImage:@"btnWaveStation.png" disabledImage:@"btnWaveStation.png" target:self  selector:@selector(setMagic:)];
                    btnWaveStation.scale = 0.85;
                    btnWaveStation.tag = [(NSNumber*)[wave objectForKey:@"id"] intValue];
                    CCMenu *btnWaveStationMenu = [CCMenu menuWithItems:btnWaveStation, nil];
                    btnWaveStationMenu.position = waveStationPo;
                    //btnWaveStation.position = waveStationPo;
                    [self addChild:btnWaveStationMenu z:2];
                    [btnWaveStation release];
                    
                    score = [(NSNumber*)[wave objectForKey:@"score"] intValue];
                    
                    for (int i=0; i < score; i++) {
                        waveScore = [CCSprite spriteWithFile:@"starLight.png"];
                        waveScore.position = CGPointMake(waveStationPo.x - 15 + (i * 15), waveStationPo.y + 35);
                        [self addChild:waveScore z:2];
                    }
                    
                    for (int i=score; i < 3; i++) {
                        waveScore = [CCSprite spriteWithFile:@"starLightHui.png"];
                        waveScore.position = CGPointMake(waveStationPo.x - 15 + (i * 15), waveStationPo.y + 35);
                        [self addChild:waveScore z:2];
                    }
                }        
            }
        }
		
		[self setMagicHidden];
	}
	return self;
}

-(void) addJn:(id) sender 
{
    CCMenuItemImage *button = sender;
    NSString *picUrl = [NSString stringWithFormat:@"jN00%d.png", button.tag];
	if (intJN001 == 10) {
		select1 = [CCSprite spriteWithFile:picUrl];
		select1.position = CGPointMake(144 , 115);
		select1.scale = 1;
		[self addChild:select1 z:16];
		intJN001 = button.tag;
		button.isEnabled = NO;
	}
	else if(intJN002 == 10){
		select2 = [CCSprite spriteWithFile:picUrl];
		select2.position = CGPointMake(214 , 115);
		select2.scale = 1;
		[self addChild:select2 z:16];
		intJN002 = button.tag;
		button.isEnabled = NO;
	}
	
	if (intJN002 != 10 && intJN001 != 10) {
		btnPlay.isEnabled = YES;
	}
	else {
		btnPlay.isEnabled = NO;
	}

}

-(void) removeJn1:(id) sender 
{
	[self removeChild:select1 cleanup:NO];
	
	if (intJN001 == 1) {
		btnJN001.isEnabled = YES;
	}
	
	if (intJN001 == 2) {
		btnJN002.isEnabled = YES;
	}
	
	if (intJN001 == 3) {
		btnJN003.isEnabled = YES;
	}
	
	if (intJN001 == 4) {
		btnJN004.isEnabled = YES;
	}
	intJN001 = 10;
	
	if (intJN002 != 10 && intJN001 != 10) {
		btnPlay.isEnabled = YES;
	}
	else {
		btnPlay.isEnabled = NO;
	}
}

-(void) removeJn2:(id) sender 
{
	[self removeChild:select2 cleanup:NO];
	if (intJN002 == 1) {
		btnJN001.isEnabled = YES;
	}
	
	if (intJN002 == 2) {
		btnJN002.isEnabled = YES;
	}
	
	if (intJN002 == 3) {
		btnJN003.isEnabled = YES;
	}
	
	if (intJN002 == 4) {
		btnJN004.isEnabled = YES;
	}
	intJN002 = 10;
	
	if (intJN002 != 10 && intJN001 != 10) {
		btnPlay.isEnabled = YES;
	}
	else {
		btnPlay.isEnabled = NO;
	}
}

-(void) closeMagic:(id) sender 
{
	[self setMagicHidden];
}

-(void) setMagicShow
{
	selectMagicBg.visible = YES;
	btnPlay.visible = YES;
	btnJN001.visible = YES;
	btnJN002.visible = YES;
	btnJN003.visible = YES;
	btnJN004.visible = YES;
	btnselectJn1.visible = YES;
	btnselectJn2.visible = YES;
	//select1.visible = YES;
	//select2.visible = YES;
    btnClose.visible = YES;
    btnTouMing.visible = YES;
}

-(void) setMagicHidden
{
	selectMagicBg.visible = NO;
	btnPlay.visible = NO;
	btnJN001.visible = NO;
	btnJN002.visible = NO;
	btnJN003.visible = NO;
	btnJN004.visible = NO;
	btnselectJn1.visible = NO;
	btnselectJn2.visible = NO;
	//select1.visible = NO;
	//select2.visible = NO;
    [self removeChild:select1 cleanup:NO];
    [self removeChild:select2 cleanup:NO];
    btnJN001.isEnabled = YES;
	btnJN002.isEnabled = YES;
	btnJN003.isEnabled = YES;
	btnJN004.isEnabled = YES;
    btnPlay.isEnabled = NO;
    intJN001 = 10;
    intJN002 = 10;
    btnClose.visible = NO;
    btnTouMing.visible = NO;
}

-(void) goToLoadingSence:(id) sender 
{
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransFade:0.56f scene:[LoadingSence scene:guanKa JN1:intJN001 JN2:intJN002]]];
}

-(void) doNothing:(id) sender 
{
    NSLog(@"TOUMING");
}

-(void) setMagic:(id) sender 
{
	CCMenuItemImage *button = sender;
	guanKa = button.tag;
    CGPoint po = button.parent.position;
    btnWaveStationLight.position = po;
    btnWaveStationLight.visible = YES;
	[self setMagicShow];
}

-(void) goToMainMenuSence:(id) sender 
{
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransFadeDown:0.56f layer:[MainMenuSence node]]];
}

-(void) goToUpdataSence:(id) sender 
{
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransZoomFlipX:0.56f layer:[UpdataSence node]]];
}

- (void) dealloc
{
	[super dealloc];
}

@end
