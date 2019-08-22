//
//  NoCodeModel.h
//  restoration
//
//  Created by kemp on 2019/8/21.
//  Copyright © 2019 kemp. All rights reserved.
//  不实现NSCoding协议的model，测试对状态恢复的影响

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NoCodeModel : NSObject

@property (nonatomic, strong) NSDate *date;

@end

NS_ASSUME_NONNULL_END
