//
//  PushViewController.m
//  MasonryTest
//
//  Created by Dex on 15/11/30.
//  Copyright © 2015年 Dex.XU. All rights reserved.
//

#import "PushViewController.h"
#import "PushToNextViewController.h"
@interface PushViewController ()

@end

@implementation PushViewController

-(void)loadView
{
    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"标题";
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"左边" style:UIBarButtonItemStyleDone target:nil action:nil];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"右边" style:UIBarButtonItemStyleDone target:nil action:nil];
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    [leftButton setBackgroundColor:[UIColor greenColor]];
    [leftButton setTitle:@"左边" forState:UIControlStateNormal];
    [leftButton.titleLabel setTextAlignment:NSTextAlignmentLeft];
//    uibutton左对齐
    leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(onClickLeftButtonEvent) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    [rightButton setBackgroundColor:[UIColor yellowColor]];
    [rightButton setTitle:@"右边" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
//    返回键
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
 
}
-(void)onClickLeftButtonEvent
{
//    NSLog(@"点击了左边");
    PushToNextViewController *pushtoNextController = [[PushToNextViewController alloc]init];
    [self.navigationController pushViewController:pushtoNextController animated:YES];
}

@end
