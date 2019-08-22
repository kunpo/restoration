//
//  AppDelegate.h
//  restoration
//
//  Created by kemp on 2019/8/6.
//  Copyright © 2019 kemp. All rights reserved.
//
/*
 学习一下状态恢复
 目标：
 1、实现一个演示的demo，有列表页面，可以添加，修改数据（参考小件员常规的列表、详情界面）。
 2、整理步骤，评估代价
 3、swift中的区别
 */

/*
 1、如果类里面有属性。需要在encodeRestorableStateWithCoder方法中保存，在decodeRestorableStateWithCoder方法中还原。属性需遵循NSCoding协议。
 2、如果使用了单例。是重新创建？？？
 3、如果appdelegate有属性
 4、从storyboard中加载的VC，在sotryboard里配置restorationID，不需要显性的标记遵循UIViewControllerRestoration协议，和实现返回vc的方法。
 5、多重嵌套时使用代码尝试。
 6、如果xib加载出来的vc怎么做。
 7、tableView的数据。数据可以当做属性保存，然后再恢复，刷新数据可以实现。
 */

/*
 其他说明：
 1、为了方便测试，info 里设置了Application does not run in background 为yes
 2、因为vc是从storyboard中加载出来的storyboard中需要设置retorationID
 3、tabBar的viewControllers都要实现状态恢复，否则，再次进来后就会选中item0而不一定是原来的item
 4、在保存时vc的title不会自动保存，所以需要手动保存和恢复。
 */

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

