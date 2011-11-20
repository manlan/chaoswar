#import <Foundation/Foundation.h>
#import "GameTypeDef.h"
#import "TDBullet.h"

@interface TDArrowBullet1 : TDTowerBullet {
    
}

@end

@interface TDArrowBullet2 : TDTowerBullet {
    
}

@end

@interface TDArrowBullet3 : TDTowerBullet {
    
}

@end

@interface TDTurretBullet : TDTowerBullet {

}

@property int attactRange;
@property (nonatomic, retain) NSString *aniBoomName;

-(void) afterRepeat:(id)sender;

@end

@interface TDTurretBullet1 : TDTurretBullet {
    
}

@end

@interface TDTurretBullet2 : TDTurretBullet {
    
}

@end

@interface TDTurretBullet3 : TDTurretBullet {
    
}

@end

@interface TDMagicBullet1 : TDTowerBullet {
    
}

@end

@interface TDMagicBullet2 : TDTowerBullet {
    
}

@end

@interface TDMagicBullet3 : TDTowerBullet {
    
}

@end
