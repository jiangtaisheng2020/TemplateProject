//
//  MyNavigationController.m
//  TemplateProject
//
//  Created by jiangtaisheng on 2020/3/15.
//  Copyright © 2020 jiangtaisheng. All rights reserved.
//

#import "MyNavigationController.h"

@interface MyNavigationController ()

@end

@implementation MyNavigationController

#pragma mark life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
+ (void)initialize
{
    // 设置整个项目所有item的主题样式
//    UIBarButtonItem *item = [UIBarButtonItem appearance];
//    
//    // 设置普通状态
//    // key：NS****AttributeName
//    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
//    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
//    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
//    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
//    
//    // 设置不可用状态
//    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
//    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.7];
//    disableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
//    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

#pragma mark - Request functions



#pragma mark - Action functions



#pragma mark  delegate



#pragma mark  privete method or lazy loading Functions

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
        
        /* 设置导航栏上面的内容 */
        // 设置左边的返回按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_back" highImage:@"navigationbar_back_highlighted"];
        
        // 设置右边的更多按钮
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(more) image:@"navigationbar_more" highImage:@"navigationbar_more_highlighted"];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
#warning 这里要用self，不是self.navigationController
    // 因为self本来就是一个导航控制器，self.navigationController这里是nil的
    [self popViewControllerAnimated:YES];
}

- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}
@end
