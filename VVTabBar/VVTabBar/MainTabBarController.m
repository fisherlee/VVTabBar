//
//  MainTabBarController.m
//  VVTabBar
//
//  Created by liwei on 2018/7/2.
//  Copyright © 2018年 liwei. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBar ()

@end

@implementation MainTabBar

@end

@interface MainTabBarController ()<UITabBarControllerDelegate>

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    
    [self setTitleTextColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    [self setSelectedColor];
}

#pragma mark - 设置item title 颜色
- (void)setTitleTextColor
{
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor brownColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} forState:UIControlStateSelected];
}

- (void)setSelectedColor
{
    for (UIView *view in self.tabBar.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            for (id obj in view.subviews) {
                if ([obj isKindOfClass:NSClassFromString(@"UITabBarButtonLabel")]) {
                    UILabel *label = (UILabel *)obj;
                    NSLog(@"didSelectViewController:%@", label);
                    if (self.selectedIndex == 0 && [label.text isEqualToString:self.tabBar.items[0].title]) {
                        label.textColor = [UIColor redColor];
                    }
                    else if (self.selectedIndex == 1 && [label.text isEqualToString:self.tabBar.items[1].title]) {
                        label.textColor = [UIColor magentaColor];
                    }
                    else if (self.selectedIndex == 2 && [label.text isEqualToString:self.tabBar.items[2].title]) {
                        label.textColor = [UIColor greenColor];
                    }
                }
            }
        }
    }
}

@end
