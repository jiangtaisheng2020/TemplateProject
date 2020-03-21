//
//  MyTabBar.m
//  TemplateProject
//
//  Created by jiangtaisheng on 2020/3/15.
//  Copyright © 2020 jiangtaisheng. All rights reserved.
//

#import "MyTabBar.h"
@interface MyTabBar ()
{
    struct {
        unsigned int didClickPlusButton  :1;
    } _delegateFlags;
}

@property(nonatomic,strong)UIButton * publishButton;
@end

@implementation MyTabBar

#pragma mark view Initialization

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.publishButton];
    }
    return self;
}


#pragma mark - Action functions

-(void)plusClick:(UIButton *)btn{
    if (_delegateFlags.didClickPlusButton) {
        [_myDelegate tabBarDidClickPlusButton:self];
    }
}

#pragma mark  delegate



#pragma mark  privete method or lazy loading Functions

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.publishButton.centerX=self.width*0.5;
    self.publishButton.centerY=self.height*0.5-10;
    
    // 2.设置其他tabbarButton的位置和尺寸
      CGFloat tabbarButtonW = self.width / 5;
      CGFloat tabbarButtonIndex = 0;
    for (UIView * child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            child.width=tabbarButtonW;
            child.x = tabbarButtonIndex * tabbarButtonW;
            tabbarButtonIndex++;
            if (tabbarButtonIndex == 2) {
              tabbarButtonIndex++;
            }
        }
    }
}

-(UIButton *)publishButton{
    if (_publishButton==nil) {
        UIButton *plusBtn = [[UIButton alloc] init];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"feed_publish_press_night_44x44_"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"feed_publish_press_night_44x44_"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"feed_publish_press_night_44x44_"] forState:UIControlStateHighlighted];
        plusBtn.size = plusBtn.currentBackgroundImage.size;
        [plusBtn addTarget:self action:@selector(plusClick:) forControlEvents:UIControlEventTouchUpInside];
       _publishButton = plusBtn;
    }
    return _publishButton;
}
- (void)setMyDelegate:(id<MyTabBarDelegate>)myDelegate{
    _myDelegate=myDelegate;
    _delegateFlags.didClickPlusButton = [myDelegate respondsToSelector:@selector(tabBarDidClickPlusButton:)];
}
@end
