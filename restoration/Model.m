//
//  Model.m
//  restoration
//
//  Created by kemp on 2019/8/21.
//  Copyright © 2019 kemp. All rights reserved.
//

#import "Model.h"

@implementation Model

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject: self.name forKey: @"name"];
    [aCoder encodeObject: self.detail forKey: @"detail"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self.name = [aDecoder decodeObjectForKey: @"name"];
    self.detail = [aDecoder decodeObjectForKey: @"detail"];
    return self;
}

@end
