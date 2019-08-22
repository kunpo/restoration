//
//  ViewController.m
//  restoration
//
//  Created by kemp on 2019/8/6.
//  Copyright © 2019 kemp. All rights reserved.
//

#import "ViewController.h"
#import "XibViewController.h"
#import "Model.h"

@interface ViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (nonatomic, copy) NSString *textFieldText;
@property (nonatomic, strong) NSArray<NSString *> *array;
@property (nonatomic, strong) Model *model;

@end

@implementation ViewController

+ (instancetype)creat:(Model *)model title:(NSString *)title {
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [board instantiateViewControllerWithIdentifier:@"ViewController"];
    vc.model = model;
    vc.title = title;
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //调完viewDidLoad后才调用数据恢复。
    self.textField.text = self.model.name;
    self.textView.text = self.model.detail;
}

- (IBAction)goXibVC:(UIButton *)sender {
    XibViewController *vc = [[XibViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)saveModel:(UIButton *)sender {
    self.model.name = self.textField.text;
    self.model.detail = self.textView.text;
}

//MARK:----------------textViewDelegate-------------------
- (void)textViewDidEndEditing:(UITextView *)textView {
    NSString *text = textView.text;
    NSArray *array = [text componentsSeparatedByString:@";"];
    self.array = array;
}

//MARK:----------------状态恢复需要添加的方法-------------------

//进入后台时调用；使用此方法保存我们需要下次恢复的数据。
- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    [super encodeRestorableStateWithCoder:coder];
    //保存数据的代码写在这里
    [coder encodeObject: self.textField.text forKey:@"vcTextFieldTextKey"];
    [coder encodeObject:self.textView.text forKey:@"vcTextViewTextKey"];
    [coder encodeObject:self.array forKey:@"vcArrayKey"];
    [coder encodeObject:self.model forKey:@"vcModelKey"];
}
//进入前台时调用；使用此方法恢复数据，并展示。
- (void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    //调用viewDidLoad后才调用
    [super decodeRestorableStateWithCoder:coder];
    NSString *text = [coder decodeObjectForKey:@"vcTextFieldTextKey"];
    self.textFieldText = text;
    self.textField.text = text;
    text = [coder decodeObjectForKey:@"vcTextViewTextKey"];
    self.textView.text = text;
    NSArray *array = [coder decodeObjectForKey:@"vcArrayKey"];
    self.array = array;
    self.model = [coder decodeObjectForKey:@"vcModelKey"];
}

@end
