#import "GamePubDef.h"

@interface WayPoint : CCNode {

}

@property (readonly) CGPoint point;
@property (readonly) int z;

+ (WayPoint*) getWayPoint:(CGPoint)pt z:(int)z;

- (void) setValue:(CGPoint)pt z:(int)z;

@end
