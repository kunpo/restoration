//
//  AppDelegate.m
//  restoration
//
//  Created by kemp on 2019/8/6.
//  Copyright © 2019 kemp. All rights reserved.
//

#import "AppDelegate.h"
#import "Tools.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if (self.window.rootViewController != nil) {
        //有数据恢复的vc，不需要再次创建rootvc了
    } else {
        
    }
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [Tools appEnterBackground];
}

- (void)otherCode {
    
}

//MARK:----------------状态恢复需要添加的方法-------------------
//是否使用状态保存，如果返回NO则状态不会保存
- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder {

    return YES;
}
//是否使用保存起来的状态恢复
- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder {
//    //UIApplicationStateRestorationTimestampKey 怎么使用？，是需要自己存储吗？？
//    NSDate *lastDate = [coder decodeObjectForKey:UIApplicationStateRestorationTimestampKey];
//    NSString *lastVersion = [coder decodeObjectForKey:UIApplicationStateRestorationBundleVersionKey];
    BOOL needRestore = [Tools canUserRestore];
    return needRestore;
}

//- (UIViewController *)application:(UIApplication *)application viewControllerWithRestorationIdentifierPath:(NSArray<NSString *> *)identifierComponents coder:(NSCoder *)coder {
//
//}

//- (void)application:(UIApplication *)application willEncodeRestorableStateWithCoder:(NSCoder *)coder {
//
//}

@end
