#import "GameMagicScene.h"
#import "GameHintScene.h"
#import "GameController.h"

@implementation GameMagicScene

@synthesize btnGo = _btnGo;
@synthesize btnMagic1 = _btnMagic1;
@synthesize btnMagic2 = _btnMagic2;
@synthesize btnMagic3 = _btnMagic3;
@synthesize btnMagic4 = _btnMagic4;

-(id) init
{
	if( (self=[super init])) {
        _btnMagic1 = nil;
        _btnMagic2 = nil;
        _btnMagic3 = nil;
        _btnMagic4 = nil;
		//GameController *gc = [GameController getGameController];
		//下一波
		_btnGo = [CCMenuItemImage itemFromNormalImage:@"go_normal.png" selectedImage:@"go_normal.png"  
									   disabledImage:@"go_black.png"  target:self selector:@selector(GoNext:)];
		CCMenu *btnGoMenu = [CCMenu menuWithItems:_btnGo, nil];
		btnGoMenu.position = ccp(448 , 20);
		[self addChild:btnGoMenu z:2];
	}
	return self;
}

- (void) setMagic:(int)JN1 JN2:(int)JN2
{
    switch (JN1) {
        case 1:
            _btnMagic1 = [self addButton:JN1 selector:@selector(Magic1:) point:MAGIC1_POS];
            break;
        case 2:
            _btnMagic2 = [self addButton:JN1 selector:@selector(Magic2:) point:MAGIC1_POS];
            break;
        case 3:
            _btnMagic3 = [self addButton:JN1 selector:@selector(Magic3:) point:MAGIC1_POS];
            break;
        case 4:
            _btnMagic4 = [self addButton:JN1 selector:@selector(Magic4:) point:MAGIC1_POS];
            break;
        default:
            break;
    }
    
    switch (JN2) {
        case 1:
            _btnMagic1 = [self addButton:JN2 selector:@selector(Magic1:) point:MAGIC2_POS];
            break;
        case 2:
            _btnMagic2 = [self addButton:JN2 selector:@selector(Magic2:) point:MAGIC2_POS];
            break;
        case 3:
            _btnMagic3 = [self addButton:JN2 selector:@selector(Magic3:) point:MAGIC2_POS];
            break;
        case 4:
            _btnMagic4 = [self addButton:JN2 selector:@selector(Magic4:) point:MAGIC2_POS];
            break;
        default:
            break;
    }
}

- (CCMenuItemImage*) addButton:(int)magicNum selector:(SEL)sel point:(CGPoint)point
{
    NSString * jn = [NSString stringWithFormat:@"jN%03d.png", magicNum];
    NSString * jnHUI = [NSString stringWithFormat:@"jN%03dHui.png", magicNum];
    CCMenuItemImage *btnMagic = [CCMenuItemImage itemFromNormalImage:jn selectedImage:jn disabledImage:jnHUI target:self selector:sel];
    [btnMagic setScale:0.75];
    CCMenu *btnMagicMenu = [CCMenu menuWithItems:btnMagic, nil];
    btnMagicMenu.position = point;
    [self addChild:btnMagicMenu z:4];
	return btnMagic;
}

//==============盟军=================
-(void) Magic1:(id) sender 
{
	GameController *gc = [GameController getGameController];
    if (gc.operateType == OT_MAGIC_FRIENDLY) {
        gc.operateType = OT_NORMAL;
        gc.screenClickType = SCT_ALL;
    } else {
        gc.operateType = OT_MAGIC_FRIENDLY;
        gc.screenClickType = SCT_ONLYWHITE;
    }
    [gc setGameStatus];
}

//==============火雨=================
-(void) Magic2:(id) sender 
{
    GameController *gc = [GameController getGameController];
    if (gc.operateType == OT_MAGIC_FIRE) {
        gc.operateType = OT_NORMAL;
        gc.screenClickType = SCT_ALL;
    } else {
        gc.operateType = OT_MAGIC_FIRE;
        gc.screenClickType = SCT_ONLYWHITE;
    }
    [gc setGameStatus];
}

//==============雷电=================
-(void) Magic3:(id) sender
{
	GameController *gc = [GameController getGameController];
    if (gc.operateType == OT_MAGIC_THUNDER) {
        gc.operateType = OT_NORMAL;
        gc.screenClickType = SCT_ALL;
    } else {
        gc.operateType = OT_MAGIC_THUNDER;
        gc.screenClickType = SCT_ENEMY;
    }
    [gc setGameStatus];
}

//==============静止=================
-(void) Magic4:(id) sender 
{
	GameController *gc = [GameController getGameController];
    if (gc.operateType == OT_MAGIC_STOP) {
        gc.operateType = OT_NORMAL;
        gc.screenClickType = SCT_ALL;
    } else {
        gc.operateType = OT_MAGIC_STOP;
        gc.screenClickType = SCT_ENEMY;
    }
    [gc setGameStatus];
}

-(void) GoNext:(id) sender 
{
	GameController *gc = [GameController getGameController];
	[gc startNextWave];
    [gc setGameStatus];
}

- (void) setGoMenuStatus
{
    GameController *gc = [GameController getGameController];
    if (!gc.canNext) {
        [_btnGo setIsEnabled:NO];
        return;
    }
    
    if ([CCDirector sharedDirector].isPaused) {
        [_btnGo setIsEnabled:NO];
        return;
    }
    
    [_btnGo setIsEnabled:YES];
}

- (void) setMagic1MenuStatus
{
    if (!_btnMagic1) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL && gc.operateType != OT_MAGIC_FRIENDLY) {
        [_btnMagic1 setIsEnabled:NO];
        return;
    }
    
    if ([CCDirector sharedDirector].isPaused) {
        [_btnMagic1 setIsEnabled:NO];
        return;
    }
    
    [_btnMagic1 setIsEnabled:YES];
}

- (void) setMagic2MenuStatus
{
    if (!_btnMagic2) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL && gc.operateType != OT_MAGIC_FIRE) {
        [_btnMagic2 setIsEnabled:NO];
        return;
    }
    
    if ([CCDirector sharedDirector].isPaused) {
        [_btnMagic2 setIsEnabled:NO];
        return;
    }
    
    [_btnMagic2 setIsEnabled:YES];
}

- (void) setMagic3MenuStatus
{
    if (!_btnMagic3) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL && gc.operateType != OT_MAGIC_THUNDER) {
        [_btnMagic3 setIsEnabled:NO];
        return;
    }
    
    if ([CCDirector sharedDirector].isPaused) {
        [_btnMagic3 setIsEnabled:NO];
        return;
    }
    
    [_btnMagic3 setIsEnabled:YES];
}

- (void) setMagic4MenuStatus
{
    if (!_btnMagic4) return;
    GameController *gc = [GameController getGameController];
    if (gc.operateType != OT_NORMAL && gc.operateType != OT_MAGIC_STOP) {
        [_btnMagic4 setIsEnabled:NO];
        return;
    }
    
    if ([CCDirector sharedDirector].isPaused) {
        [_btnMagic4 setIsEnabled:NO];
        return;
    }
    
    [_btnMagic4 setIsEnabled:YES];
}

@end
