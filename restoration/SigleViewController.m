//
//  SigleViewController.m
//  restoration
//
//  Created by kemp on 2019/8/20.
//  Copyright © 2019 kemp. All rights reserved.
//

#import "SigleViewController.h"

//@interface SigleViewController () <UIViewControllerRestoration>
@interface SigleViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, assign) BOOL fromCoder;
@property (nonatomic, copy) NSString *textFieldText;

@end

@implementation SigleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     设置恢复标识符，因为在storyboard中设置了所以这里就不设置了。
     */
//    self.restorationIdentifier = @"SigleViewController";
    /*
     Class的实例对象，APP状态恢复的时候负责重新创建当前的控制器 ，需要实现定义在UIStateRestoring.h中的UIViewControllerRestoration协议。restorationClass可以是当前控制器也可以是其他对象，只要实现了UIViewControllerRestoration协议即可。
     同上因为在storyboard中设置了所以这里就不设置了。
     */
    //TODO:???从storyboard中加载的，即使添加了函数也是不行???，多重嵌套时的尝试。如果xib加载出来的vc怎么做？
    //⚠️只需要在storyboard或这里设置一个，如果既在storyboard中设置了，又在vc中设置，则会失败。
//    self.restorationClass = self.class;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSString *title = (self.fromCoder == YES)? @"成功" : @"提醒";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *act = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:act];
    [self presentViewController:alert animated:YES completion:nil];
    self.textField.text = self.textFieldText;
}

//MARK:----------------状态恢复需要添加的方法-------------------

//进入后台时调用；使用此方法保存我们需要下次恢复的数据。
- (void)encodeRestorableStateWithCoder:(NSCoder *)coder; {
    [super encodeRestorableStateWithCoder:coder];
    //保存数据的代码写在这里
    [coder encodeObject: self.textField.text forKey:@"vcTextFieldTextKey"];
    
}
//进入前台时调用；使用此方法恢复数据，并展示。
- (void)decodeRestorableStateWithCoder:(NSCoder *)coder; {
    //调用viewDidLoad后才调用
    [super decodeRestorableStateWithCoder:coder];
    NSString *text =  [NSString stringWithString:[coder decodeObjectForKey:@"vcTextFieldTextKey"]];
    self.textFieldText = text;
    self.fromCoder = YES;
}


//+ (nullable UIViewController *)viewControllerWithRestorationIdentifierPath:(nonnull NSArray<NSString *> *)identifierComponents coder:(nonnull NSCoder *)coder {
//    //! identifierComponents返回的就是我们之前设置的restorationIdentifier
//    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    SigleViewController *vc = [board instantiateViewControllerWithIdentifier:@"SigleViewController"];
//    vc.restorationIdentifier = identifierComponents.lastObject;
//    vc.restorationClass = vc.class;
//    return vc;
//}

@end
