//
//  Tools.m
//  restoration
//
//  Created by kemp on 2019/8/21.
//  Copyright © 2019 kemp. All rights reserved.
//

#import "Tools.h"

@implementation Tools

+ (void)appEnterBackground {
    NSDate *date = [NSDate date];
    NSString *key = [self restoreTimeKey];
    [[NSUserDefaults standardUserDefaults] setObject:date forKey:key];
}

//设置如果超过二十秒后则不适用状态恢复
+ (BOOL)canUserRestore {
//    UIApplicationStateRestorationTimestampKey
    NSString *key = [self restoreTimeKey];
    NSDate *lastTime = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if (lastTime == nil) {
        return NO;
    }
    NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:lastTime];
    return (interval < 20);
}

+ (NSString *)restoreTimeKey {
    return @"LastEnterBackgroundTimeKey";
}

@end
