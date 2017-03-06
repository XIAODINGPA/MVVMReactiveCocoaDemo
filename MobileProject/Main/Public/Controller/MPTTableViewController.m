//
//  MPTTableViewController.m
//  MobileProject
//
//  Created by wujunyang on 2017/3/1.
//  Copyright © 2017年 wujunyang. All rights reserved.
//

#import "MPTTableViewController.h"

@interface MPTTableViewController ()

@end

@implementation MPTTableViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupTabBarController];
        
        self.tabBar.selectedImageTintColor =RGB(182, 65, 65);
        
        //显示未读
        UINavigationController  *discoverNav =(UINavigationController *)self.viewControllers[1];
        UITabBarItem *curTabBarItem=discoverNav.tabBarItem;
        [curTabBarItem setBadgeValue:@"2"];
    }
    return self;
}


- (void)setupTabBarController {
    /// 设置TabBar属性数组
    self.tabBarItemsAttributes =[self tabBarItemsAttributesForController];
    
    /// 设置控制器数组
    self.viewControllers =[self mpViewControllers];
    
    self.delegate = self;
    self.moreNavigationController.navigationBarHidden = YES;
}


//控制器设置
- (NSArray *)mpViewControllers {
    HomeViewController *firstViewController = [[HomeViewController alloc] init];
    UINavigationController *firstNavigationController = [[MPTBaseNavigationViewController alloc]
                                                         initWithRootViewController:firstViewController];
    
    MPTTheoryViewController *secondViewController = [[MPTTheoryViewController alloc] init];
    UINavigationController *secondNavigationController = [[MPTBaseNavigationViewController alloc]
                                                          initWithRootViewController:secondViewController];
    
    HomeViewController *thirdViewController = [[HomeViewController alloc] init];
    UINavigationController *thirdNavigationController = [[MPTBaseNavigationViewController alloc]
                                                         initWithRootViewController:thirdViewController];
    
    HomeViewController *fourthViewController = [[HomeViewController alloc] init];
    UINavigationController *fourthNavigationController = [[MPTBaseNavigationViewController alloc]
                                                          initWithRootViewController:fourthViewController];
    
    NSArray *viewControllers = @[
                                 firstNavigationController,
                                 secondNavigationController,
                                 thirdNavigationController,
                                 fourthNavigationController
                                 ];
    return viewControllers;
}

//TabBar文字跟图标设置
- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"首页",
                                                 CYLTabBarItemImage : @"home_normal",
                                                 CYLTabBarItemSelectedImage : @"home_highlight",
                                                 };
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"基础",
                                                  CYLTabBarItemImage : @"mycity_normal",
                                                  CYLTabBarItemSelectedImage : @"mycity_highlight",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"服务",
                                                 CYLTabBarItemImage : @"message_normal",
                                                 CYLTabBarItemSelectedImage : @"message_highlight",
                                                 };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"更多",
                                                  CYLTabBarItemImage : @"account_normal",
                                                  CYLTabBarItemSelectedImage : @"account_highlight"
                                                  };
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
                                       thirdTabBarItemsAttributes,
                                       fourthTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}


#pragma mark - UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController*)tabBarController shouldSelectViewController:(UINavigationController*)viewController {
    /// 特殊处理 - 是否需要登录
    BOOL isBaiDuService = [viewController.topViewController isKindOfClass:[MPTTheoryViewController class]];
    if (isBaiDuService) {
        NSLog(@"你点击了TabBar第二个");
    }
    return YES;
}


@end