//
//  TDSprite.m
//  chaoswar
//
//  Created by Mac on 11-10-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "TDSprite.h"


@implementation TDSprite

@synthesize isDelete;

+ (id) getSprite
{
    return nil;
}

- (BOOL) run
{
    return YES;
}

- (void) onClick
{
}

- (CGRect)rect
{
	return CGRectMake(-rect_.size.width / 2, -rect_.size.height / 2, rect_.size.width, rect_.size.height);
}

- (void)onEnter
{
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
	[super onEnter];
}

- (void) onExit
{
	[[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
	[super onExit];
}	

- (BOOL) containsTouchLocation:(UITouch *)touch
{
	return CGRectContainsPoint(self.rect, [self convertTouchToNodeSpaceAR:touch]);
}

- (BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	if ( ![self containsTouchLocation:touch] ) return NO;
	[self spriteTouchBegan:touch];
	return YES;
}

- (void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
	[self spriteTouchMoved:touch];
}

- (void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    [self spriteTouchEnded:touch];
}

- (void) spriteTouchBegan:(UITouch *)touch
{

}

- (void) spriteTouchMoved:(UITouch *)touch
{
    
}

- (void) spriteTouchEnded:(UITouch *)touch
{
    
}

@end
