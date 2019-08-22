//
//  Model.h
//  restoration
//
//  Created by kemp on 2019/8/21.
//  Copyright © 2019 kemp. All rights reserved.
// 用于测试传值

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *detail;

@end

NS_ASSUME_NONNULL_END
