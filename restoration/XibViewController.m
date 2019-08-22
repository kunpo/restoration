//
//  XibViewController.m
//  restoration
//
//  Created by kemp on 2019/8/22.
//  Copyright © 2019 kemp. All rights reserved.
//

#import "XibViewController.h"

@interface XibViewController () <UIViewControllerRestoration>

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation XibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configRestoration];
}

//MARK:----------------状态恢复需要添加的方法-------------------

- (void)configRestoration {
    self.restorationIdentifier = NSStringFromClass(self.class);
    self.restorationClass = self.class;
}

/*
 XIB需要标记遵循UIViewControllerRestoration协议，并且实现+ (nullable UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray<NSString *> *)identifierComponents coder:(NSCoder *)coder方法，才能状态恢复。但通过storyboard创建的，只要在storyboard里标记restoration则不显性标记遵循协议也不需要实现返回vc的方法，也可以实现状态恢复。
 */
+ (nullable UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray<NSString *> *)identifierComponents coder:(NSCoder *)coder {
    //TODO:???这里是新建了一个对象，可以解码得到吗？？？
    XibViewController *vc = [[XibViewController alloc] init];
    vc.restorationIdentifier = NSStringFromClass(self.class);
    vc.restorationClass = vc.class;
    return vc;
}

//进入后台时调用；使用此方法保存我们需要下次恢复的数据。
- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    [super encodeRestorableStateWithCoder:coder];
    //保存数据的代码写在这里
    [coder encodeObject: self.textField.text ?: @"" forKey:@"XibVCTextFieldTextKey"];
    
}
//进入前台时调用；使用此方法恢复数据，并展示。
- (void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    //调用viewDidLoad后才调用
    [super decodeRestorableStateWithCoder:coder];
    NSString *text = [coder decodeObjectForKey:@"XibVCTextFieldTextKey"];
    self.textField.text = text;
}

@end
