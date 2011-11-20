//
//  DataController.m
//  chaoswar
//
//  Created by apple on 11-11-8.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DataController.h"

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

+(void) setSelect:(int) selectIndex 
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
        NSMutableDictionary *item = [items objectForKey:[NSString stringWithFormat:@"Wave%d", selectIndex]];
        
        [item setObject:[NSString stringWithFormat:@"%d", 1] forKey:@"open" ];
        [item writeToFile:publicPlistPath atomically:YES ];
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
            [publicInfo writeToFile:publicPlistPath atomically:YES ];
        }
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
        for (int i = 1; i<12; i++) {
            NSMutableDictionary *item = [items objectForKey:[NSString stringWithFormat:@"Wave%d", i]];
            [item setObject:[NSString stringWithFormat:@"%d", 0] forKey:@"open" ];
            [publicInfo writeToFile:publicPlistPath atomically:YES ];
        }
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
        }
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
