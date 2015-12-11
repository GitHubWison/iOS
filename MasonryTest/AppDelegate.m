//
//  AppDelegate.m
//  MasonryTest
//
//  Created by Dex on 15/11/26.
//  Copyright © 2015年 Dex.XU. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "SUNCYLTabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
//    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc]init]];
    [[UIButton appearance]setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
////    MainViewController *mainViewController = [[MainViewController alloc]init];
    FirstViewController *firstContrller = [[FirstViewController alloc]init];
    UINavigationController *firstNavController = [[UINavigationController alloc]initWithRootViewController:firstContrller];
//    [firstContrller.tabBarItem setTitle:@"社区"];
//    UIImage *firstImage = [UIImage imageNamed:@"社区@2x.png"];
//    UIImage *firstSelectedImage = [UIImage imageNamed:@"shequ1@2x.png"];
//    firstSelectedImage = [firstSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
////    声明这张图片用原图(不做渲染)
//    firstImage = [firstImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [firstContrller.tabBarItem setImage:firstImage];
//    [firstContrller.tabBarItem setSelectedImage:firstSelectedImage];
//    
    SecondViewController *secondController = [[SecondViewController alloc]init];
//    [secondController.tabBarItem setTitle:@"集市"];
//    UIImage *secondImage = [UIImage imageNamed:@"集市@2x.png"];
//    UIImage *secondSelectedImage = [UIImage imageNamed:@"集市1@2x.png"];
//    secondSelectedImage = [secondSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    secondImage = [secondImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [secondController.tabBarItem setImage:secondImage];
//    [secondController.tabBarItem setSelectedImage:secondSelectedImage];
//    
    ThirdViewController *thirdViewController = [[ThirdViewController alloc]init];
//    [thirdViewController.tabBarItem setTitle:@"消息"];
//    UIImage *thirdImage = [UIImage imageNamed:@"消息@2x.png"];
//    UIImage *thirdSelectedImage = [UIImage imageNamed:@"消息1@2x.png"];
//    thirdSelectedImage = [thirdSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    thirdImage = [thirdImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [thirdViewController.tabBarItem setImage:thirdImage];
//    [thirdViewController.tabBarItem setSelectedImage:thirdSelectedImage];
//    
//    
    FourthViewController *fourthViewController = [[FourthViewController alloc]init];
//    [fourthViewController.tabBarItem setTitle:@"我的"];
//    UIImage *fourthImage = [UIImage imageNamed:@"我的@2x.png"];
//    UIImage *fourthSelectedImage = [UIImage imageNamed:@"我的1@2x.png"];
//    fourthImage = [fourthImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    fourthSelectedImage = [fourthSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [fourthViewController.tabBarItem setImage:fourthImage];
//    [fourthViewController.tabBarItem setSelectedImage:fourthSelectedImage];
//    
//
//    UITabBarController *tabBarController = [[UITabBarController alloc]init];
//    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
//    tabBarController.viewControllers = @[firstContrller,secondController,thirdViewController,fourthViewController];
//
//    UIView *addView = [[UIView alloc]init];
//    UIImage *addImage = [UIImage imageNamed:@"发布加号@2x.png"];
//    UIImageView *addImageView = [[UIImageView alloc]initWithImage:addImage];
////    [addImageView setImage:addImage];
//    [addView addSubview:addImageView];
//    tabBarController.tabBar.opaque = YES;
    
    
    
    
    SUNCYLTabBarController *cylTabBarController = [[SUNCYLTabBarController alloc]init];
//    [middlePlus setDelegate:self];

    NSDictionary *dict4 = @{
                            CYLTabBarItemTitle : @"我的",
                            CYLTabBarItemImage : @"我的@2x",
                            CYLTabBarItemSelectedImage : @"我的1@2x",
                            };
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"消息",
                            CYLTabBarItemImage : @"消息@2x",
                            CYLTabBarItemSelectedImage : @"消息1@2x",
                            };
    NSDictionary *dict1 = @{
                           CYLTabBarItemTitle : @"社区",
                           CYLTabBarItemImage : @"社区@2x",
                           CYLTabBarItemSelectedImage : @"shequ1",
                           };
    NSDictionary *dict2 = @{
                           CYLTabBarItemTitle : @"集市",
                           CYLTabBarItemImage : @"集市@2x",
                           CYLTabBarItemSelectedImage : @"集市1@2x",
                           };
    NSArray *tabBarItemsAttributes = @[dict1, dict2, dict3, dict4];
    cylTabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
    
    [cylTabBarController setViewControllers:@[
                                              firstNavController,
                                              secondController,
                                              thirdViewController,
                                              fourthViewController,
                                              ]];
    
    [self.window setRootViewController:cylTabBarController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
-(void)clickToPop
{
    NSLog(@"popwindows");
}
@end
