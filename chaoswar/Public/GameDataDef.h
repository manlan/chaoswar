#import "cocos2d.h"
#import <CoreGraphics/CGGeometry.h>

// 按钮的Alpha值，255为不透明
#define MENU_OPACITY 255

// 建造按钮位置

#define BUTTON1_POS CGPointMake(260, 21)
#define BUTTON2_POS CGPointMake(306, 21)
#define BUTTON3_POS CGPointMake(352, 21)
#define BUTTON4_POS CGPointMake(398, 21)

// 魔法按钮位置

#define MAGIC1_POS CGPointMake(44, 28)
#define MAGIC2_POS CGPointMake(106, 28)

// 升级按钮位置

#define SELL_POS CGPointMake(186, 18)

// 塔的建造时间
#define TOWER_BUILDING_TIME 0.8f
// 塔的建造层次
#define TOWER_BUILDING_Z 6
// 塔的背景层次
#define TOWER_BACKGROUND_Z 5
// 塔的层次
#define TOWER_Z 6