//
//  MyTabBarController.m
//  TemplateProject
//
//  Created by jiangtaisheng on 2020/3/15.
//  Copyright © 2020 jiangtaisheng. All rights reserved.
//

#import "MyTabBarController.h"
#import "MyNavigationController.h"
#import "HomeViewController.h"
#import "DiscoverViewController.h"
#import "MessageCenterViewController.h"
#import "ProfileViewController.h"
#import "MyTabBar.h"
@interface MyTabBarController ()<MyTabBarDelegate>

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewControllers];
    MyTabBar *tabBar=[[MyTabBar alloc] init];
    tabBar.myDelegate=self;
    [self setValue:tabBar forKey:@"tabBar"];
}

/**
*  添加子控制器
*/

-(void)addChildViewControllers{
    
    HomeViewController * homeVC=[[HomeViewController alloc]init];
    [self addChildViewController:homeVC title:@"主页" image:@"home_tabbar_32x32_" selectedImage:@"home_tabbar_press_32x32_"];
    DiscoverViewController *discoverVC=[[DiscoverViewController alloc]init];
    [self addChildViewController:discoverVC title:@"发现" image:@"video_tabbar_32x32_" selectedImage:@"video_tabbar_press_32x32_"];
    MessageCenterViewController * messageVC=[[MessageCenterViewController alloc]init];
    [self addChildViewController:messageVC title:@"信息" image:@"huoshan_tabbar_32x32_" selectedImage:@"huoshan_tabbar_press_32x32_"];
    ProfileViewController * profileVC=[[ProfileViewController alloc]init];
    [self addChildViewController:profileVC title:@"个人中心" image:@"no_login_tabbar_32x32_" selectedImage:@"mine_tabbar_press_32x32_"];
}


/**
*  添加一个子控制器
*
*  @param childVc       子控制器
*  @param title         标题
*  @param image         图片
*  @param selectedImage 选中的图片
*/

-(void)addChildViewController:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    
    childVc.title=title;
    childVc.tabBarItem.image=[UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    // 设置文字的样式
      NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
      textAttrs[NSForegroundColorAttributeName] = HWColor(123, 123, 123);
      NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
      selectTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
      [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
      [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    MyNavigationController * nav=[[MyNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

-(void)tabBarDidClickPlusButton:(MyTabBar *)tabBar{
    HWLog(@"---------------");
}

@end
