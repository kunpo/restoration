//
//  TableViewController.m
//  restoration
//
//  Created by kemp on 2019/8/21.
//  Copyright © 2019 kemp. All rights reserved.
//

#import "TableViewController.h"
#import "Model.h"
#import "ViewController.h"
#import "NoCodeModel.h"
#import "CustomCell.h"

@interface TableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray<Model *> *data;
@property (nonatomic, strong) NoCodeModel *noCodeModel;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
    [self configTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    if (self.noCodeModel == nil) {
        self.noCodeModel = [NoCodeModel new];
        NSLog(@"新建的model");
    }
}

- (void)configData {
    NSMutableArray *temp = [NSMutableArray new];
    for (int i = 0; i < 10; i ++) {
        Model *m = [Model new];
        m.name = [NSString stringWithFormat:@"%d", i];
        m.detail = [NSString stringWithFormat:@"这是第%d次创建的model", i];
        [temp addObject:m];
    }
    self.data = temp.copy;
}

- (void)configTableView {
    self.tableView.estimatedRowHeight = 60.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

//MARK:----------------UITableViewDelegate-------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    Model *m = self.data[indexPath.row];
    cell.title.text = m.name;
    cell.detail.text = m.detail;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Model *m = self.data[indexPath.row];
    ViewController *vc = [ViewController creat:m title:@"另外一个vc"];
    [self.navigationController pushViewController:vc animated:YES];
}

//MARK:----------------状态恢复需要添加的方法-------------------

//进入后台时调用；使用此方法保存我们需要下次恢复的数据。
- (void)encodeRestorableStateWithCoder:(NSCoder *)coder; {
    [super encodeRestorableStateWithCoder:coder];
    //保存数据的代码写在这里
    [coder encodeObject: self.data forKey:@"tableVCDataKey"];
    
}
//进入前台时调用；使用此方法恢复数据，并展示。
- (void)decodeRestorableStateWithCoder:(NSCoder *)coder; {
    //调用viewDidLoad后才调用
    [super decodeRestorableStateWithCoder:coder];
    NSArray *data = [coder decodeObjectForKey:@"tableVCDataKey"];
    self.data = data;
}


@end
