//
//  DataController.m
//  chaoswar
//
//  Created by apple on 11-11-8.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DataController.h"
#import "GameController.h"

@implementation DataController

+(int) getUpdataLevelByTagName:(int) index
{
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *plistPath = [CCFileUtils fullPathFromRelativePath:@"UpdataList.plist"];
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
        NSMutableDictionary *item = [items objectForKey:[NSString stringWithFormat:@"Item%d", index]];
        int level = [(NSNumber*)[item objectForKey:@"level"] intValue];
        //NSLog(@"%d", level);
        
        return  level;
    }
    
    return 0;
}

+(void) setScore:(int) score 
{
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
        scoreVal = scoreVal + score;
        [publicInfo setObject:[NSString stringWithFormat:@"%d", scoreVal] forKey:@"GameScore" ];
        [publicInfo writeToFile:publicPlistPath atomically:YES ];
    }
}

+(void) setNewEnemyAddOne:(NSString*) keyName
{
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *publicPlistPath = [CCFileUtils fullPathFromRelativePath:@"AchievementList.plist"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:publicPlistPath]) {
        NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:publicPlistPath];
        NSMutableDictionary *publicInfo = (NSMutableDictionary *)[NSPropertyListSerialization
                                                                  propertyListFromData:plistXML
                                                                  mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                                                  format:&format
                                                                  errorDescription:&errorDesc];
        
        if (!publicInfo) {
            NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
        }
        
        int enemyCount = [(NSNumber*)[publicInfo objectForKey:keyName] intValue];
        if (enemyCount == 0) {
            GameController *gc = [GameController getGameController];
            NSString *str = [self getDecOfEnemyByEnemyName:keyName];
            if (str) {
                [gc ArchieveHint:str];
            }
        }
        
        [publicInfo setObject:[NSString stringWithFormat:@"%d", enemyCount+1] forKey:keyName];
        [publicInfo writeToFile:publicPlistPath atomically:YES ];
    }
}

+(NSString*) getDecOfEnemyByEnemyName:(NSString*) keyName
{
    if ([keyName isEqualToString:@"TDFootEnemy1"]) {
        return @"New enemy! Very slow speed and very weak.";
    }
    
    if ([keyName isEqualToString:@"TDFootEnemy2"]) {
        return @"New enemy! Slow speed,very weak.";
    }
    
    if ([keyName isEqualToString:@"TDFootEnemy3"]) {
        return @"New enemy! Normal speed,weak.";
    }
    
    if ([keyName isEqualToString:@"TDFootEnemy4"]) {
        return @"New enemy! Normal speed,attack weak,normal health.";
    }
    
    if ([keyName isEqualToString:@"TDFootEnemy5"]) {
        return @"New enemy! Normal speed,attack weak,normal health.";
    }
    
    if ([keyName isEqualToString:@"TDFootEnemy6"]) {
        return @"New enemy! Fast speed,attack weak,normal health.";
    }
    
    if ([keyName isEqualToString:@"TDFootEnemy7"]) {
        return @"New enemy! Normal speed,attack weak,strong.";
    }
    
    if ([keyName isEqualToString:@"TDFootEnemy8"]) {
        return @"New enemy! Fast speed,attack weak,strong.";
    }
    
    if ([keyName isEqualToString:@"TDFootEnemy9"]) {
        return @"New enemy! Normal speed,attack normal,more strong.";
    }
    
    if ([keyName isEqualToString:@"TDFootEnemy10"]) {
        return @"New enemy! Slow speed,attack normal,more strong.";
    }
    
    if ([keyName isEqualToString:@"TDFootEnemy11"]) {
        return @"New enemy! Slow speed,more attack,more strong.";
    }
    
    if ([keyName isEqualToString:@"TDFootEnemy12"]) {
        return @"New enemy! Slow speed,more attack,more stronger.";
    }
    
    if ([keyName isEqualToString:@"TDFootEnemy13"]) {
        return @"New enemy! Slow speed,more attack,more stronger.";
    }
    
    if ([keyName isEqualToString:@"TDFootEnemy14"]) {
        return @"New enemy! Slow speed,more attack,more stronger.";
    }
    
    if ([keyName isEqualToString:@"TDFootEnemy15"]) {
        return @"New enemy! Slow speed,attack high,very strong,high defend.";
    }
    
    if ([keyName isEqualToString:@"TDFootEnemy16"]) {
        return @"New enemy! Slow speed,attack high,very strong,high defend.";
    }
    
    if ([keyName isEqualToString:@"TDFlyEnemy1"]) {
        return @"New enemy! Fly enemy,normal speed.";
    }
    
    if ([keyName isEqualToString:@"TDFlyEnemy2"]) {
        return @"New enemy! Fly enemy,normal speed,strong.";
    }
    
    if ([keyName isEqualToString:@"TDFlyEnemy3"]) {
        return @"New enemy! Fly enemy,Very fast speed.";
    }
    
    if ([keyName isEqualToString:@"TDFlyEnemy3"]) {
        return @"New enemy! Fly enemy,Very fast speed.";
    }
    
    if ([keyName isEqualToString: @"TDMagicEnemy1"]) {
        return @"New enemy! Improve move speed of enemy.Magic defend.";
    }
    
    if ([keyName isEqualToString:@"TDMagicEnemy2"]) {
        return @"New enemy! Increase health of enemy.Magic defend.";
    }
    
    if ([keyName isEqualToString:@"TDBossEnemy1"]) {
        return @"New enemy! Boss,very strong,Careful.";
    }
    
    if ([keyName isEqualToString:@"TDBossEnemy2"]) {
        return @"New enemy! Boss,very strong,Careful.";
    }
    
    return nil;
}

+(void) setSelect:(int) selectIndex s:(int)s
{
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *publicPlistPath = [CCFileUtils fullPathFromRelativePath:@"WaveSelectList.plist"];
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
        
        
        NSMutableDictionary* items = [publicInfo objectForKey:@"Waves" ];
        
        if (selectIndex < 11) {
            NSMutableDictionary *itemNext = [items objectForKey:[NSString stringWithFormat:@"Wave%d", selectIndex + 1]];
            [itemNext setObject:[NSString stringWithFormat:@"%d", 1] forKey:@"open" ];
        }
        
        NSMutableDictionary *item = [items objectForKey:[NSString stringWithFormat:@"Wave%d", selectIndex]];        
        int open = [(NSNumber*)[item objectForKey:@"open"] intValue];
        if (open == 0) {
            [item setObject:[NSString stringWithFormat:@"%d", s] forKey:@"score" ];
            if (selectIndex < 8) {
                [self setScore:1];
            }
            else
            {
                if(s == 3)
                {
                    [self setScore:2]; 
                }
                else
                {
                    [self setScore:1]; 
                }
            }
        }
        else
        {
            int score = [(NSNumber*)[item objectForKey:@"score"] intValue];
            if (score < s) {
                [item setObject:[NSString stringWithFormat:@"%d", s] forKey:@"score" ];
                if (selectIndex >= 8) {
                    if (s == 3) {
                        [self setScore:1];
                    }
                }
                else
                {
                    if (score == 0) {
                        [self setScore:1];
                    }
                }
            }
        }
        
        [publicInfo writeToFile:publicPlistPath atomically:YES ];
    }
}

+(void) setFirstUpdata
{
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *publicPlistPath = [CCFileUtils fullPathFromRelativePath:@"UpdataList.plist"];
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
        
        NSMutableDictionary* items = [publicInfo objectForKey:@"Items" ];
        for (int i = 0; i<8; i++) {
            
            NSMutableDictionary *item = [items objectForKey:[NSString stringWithFormat:@"Item%d", i]];
            
            [item setObject:[NSString stringWithFormat:@"%d", 1] forKey:@"level" ];
        }
        [publicInfo writeToFile:publicPlistPath atomically:YES ];
    }
}

+(void) setFirstSelect
{
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *publicPlistPath = [CCFileUtils fullPathFromRelativePath:@"WaveSelectList.plist"];
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
        
        NSMutableDictionary* items = [publicInfo objectForKey:@"Waves" ];
        for (int i = 0; i<12; i++) {
            NSMutableDictionary *item = [items objectForKey:[NSString stringWithFormat:@"Wave%d", i]];
            if (i != 0) {
                [item setObject:[NSString stringWithFormat:@"%d", 0] forKey:@"open" ];
            }
            
            [item setObject:[NSString stringWithFormat:@"%d", 0] forKey:@"score" ];
        }
        [publicInfo writeToFile:publicPlistPath atomically:YES ];
    }
}

+(void) setFirstNewEnemy
{
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *publicPlistPath = [CCFileUtils fullPathFromRelativePath:@"AchievementList.plist"];
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
        
        
        for (int i = 1; i <= 16; i++) {
            [publicInfo setObject:[NSString stringWithFormat:@"%d", 0] forKey:[NSString stringWithFormat:@"TDFootEnemy%d", i]];
        }
        for (int i = 1; i <= 3; i++) {
            [publicInfo setObject:[NSString stringWithFormat:@"%d", 0] forKey:[NSString stringWithFormat:@"TDFlyEnemy%d", i]];
        }
        for (int i = 1; i <= 2; i++) {
            [publicInfo setObject:[NSString stringWithFormat:@"%d", 0] forKey:[NSString stringWithFormat:@"TDMagicEnemy%d", i]];
        }
        for (int i = 1; i <= 2; i++) {
            [publicInfo setObject:[NSString stringWithFormat:@"%d", 0] forKey:[NSString stringWithFormat:@"TDBossEnemy%d", i]];
        }
        [publicInfo writeToFile:publicPlistPath atomically:YES ];
    }
}

+(void) setFirstScore
{
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
        
        [publicInfo setObject:[NSString stringWithFormat:@"%d", 0] forKey:@"GameScore" ];
        [publicInfo writeToFile:publicPlistPath atomically:YES ];
    }
}

+(void) resetGameScore
{
    int allLevel = 0;
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *updataPlistPath = [CCFileUtils fullPathFromRelativePath:@"UpdataList.plist"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:updataPlistPath]) {
        //NSLog(@"Not exsit");
        NSData *updataPlistXML = [[NSFileManager defaultManager] contentsAtPath:updataPlistPath];
        NSMutableDictionary *updataInfo = (NSMutableDictionary *)[NSPropertyListSerialization
                                                                  propertyListFromData:updataPlistXML
                                                                  mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                                                  format:&format
                                                                  errorDescription:&errorDesc];
        
        if (!updataInfo) {
            NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
        }
        
        NSMutableDictionary* items = [updataInfo objectForKey:@"Items" ];
        for (int i = 0; i<8; i++) {
            
            NSMutableDictionary *item = [items objectForKey:[NSString stringWithFormat:@"Item%d", i]];
			
            int level = [(NSNumber*)[item objectForKey:@"level"] intValue];
            allLevel = allLevel + (level - 1);
            
            [item setObject:[NSString stringWithFormat:@"%d", 1] forKey:@"level" ];
        }
        [updataInfo writeToFile:updataPlistPath atomically:YES ];
    }
    
    
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
        scoreVal = scoreVal + allLevel;
        [publicInfo setObject:[NSString stringWithFormat:@"%d", scoreVal] forKey:@"GameScore" ];
        [publicInfo writeToFile:publicPlistPath atomically:YES ];
    }
}

+(void) setFirst
{
    [self setFirstScore];
    [self setFirstSelect];
    [self setFirstUpdata];
    [self setFirstNewEnemy];
}

+(int) getMagicFireLevel
{
    return [DataController getUpdataLevelByTagName:1];
}

+(int) getMagicFriendlyLevel
{
    return [DataController getUpdataLevelByTagName:0];
}

+(int) getMagicThunderLevel
{
    return [DataController getUpdataLevelByTagName:2];
}

+(int) getMagicStoneLevel
{
    return [DataController getUpdataLevelByTagName:3];
}

+(int) getArrowTowerLevel
{
    return [DataController getUpdataLevelByTagName:4];
}

+(int) getDefenceTowerLevel
{
    return [DataController getUpdataLevelByTagName:5];
}

+(int) getMagicTowerLevel
{
    return [DataController getUpdataLevelByTagName:7];
}

+(int) getTurretTowerLevel
{
    return [DataController getUpdataLevelByTagName:6];
}

@end
