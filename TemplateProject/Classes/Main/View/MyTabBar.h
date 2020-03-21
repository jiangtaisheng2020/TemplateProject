//
//  MyTabBar.h
//  TemplateProject
//
//  Created by jiangtaisheng on 2020/3/15.
//  Copyright © 2020 jiangtaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class MyTabBar;
@protocol MyTabBarDelegate <UITabBarDelegate>
@optional
- (void)tabBarDidClickPlusButton:(MyTabBar *)tabBar;

@end

@interface MyTabBar : UITabBar
@property(nonatomic,weak) id<MyTabBarDelegate> myDelegate;
@end

NS_ASSUME_NONNULL_END
