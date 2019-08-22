//
//  Tools.h
//  restoration
//
//  Created by kemp on 2019/8/21.
//  Copyright © 2019 kemp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tools : NSObject

///保存app进入后台的时间
+ (void)appEnterBackground;
///根据app进入后台时间判断是否需要进行状态恢复
+ (BOOL)canUserRestore;

@end

NS_ASSUME_NONNULL_END
