//
//  CustomCell.h
//  restoration
//
//  Created by kemp on 2019/8/21.
//  Copyright © 2019 kemp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *detail;

@end

NS_ASSUME_NONNULL_END
