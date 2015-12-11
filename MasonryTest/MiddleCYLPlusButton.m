//
//  MiddleCYLPlusButton.m
//  MasonryTest
//
//  Created by Dex on 15/12/1.
//  Copyright © 2015年 Dex.XU. All rights reserved.
//

#import "MiddleCYLPlusButton.h"
#import "ChooseTwitterViewController.h"
@implementation MiddleCYLPlusButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(void)load
{
    [super registerSubclass];
}
+(instancetype)plusButton
{
    MiddleCYLPlusButton *button = [[MiddleCYLPlusButton alloc] init];
    
    [button setImage:[UIImage imageNamed:@"发布加号@2x"] forState:UIControlStateNormal];
//    [button setTitle:@"发布" forState:UIControlStateNormal];
    
//    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    button.titleLabel.font = [UIFont systemFontOfSize:9.5];
    [button sizeToFit];
    
    [button addTarget:button action:@selector(clickPublish) forControlEvents:UIControlEventTouchUpInside];
    return button;
}
#pragma mark 点击事件
-(void)clickPublish
{
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UIViewController *viewController = tabBarController.selectedViewController;
    ChooseTwitterViewController *chooseController = [[ChooseTwitterViewController alloc]init];
    [viewController presentViewController:chooseController animated:YES completion:nil];
}
@end
