//
//  ThirdViewController.m
//  MasonryTest
//
//  Created by Dex on 15/12/1.
//  Copyright © 2015年 Dex.XU. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

-(void)loadView
{
    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    CGRect frame = self.view.frame;
    frame.size.width = frame.size.width + 40;
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:frame];
    scroll.contentSize = CGSizeMake((CGRectGetWidth(self.view.frame) + 20)*3, CGRectGetHeight(frame));
    scroll.backgroundColor = [UIColor redColor];
    scroll.pagingEnabled = YES;
    scroll.clipsToBounds = YES;
    [self.view addSubview:scroll];
    
    UIView *view1 = [[UIView alloc] initWithFrame:self.view.frame];
    view1.backgroundColor = [UIColor greenColor];
    [scroll addSubview:view1];
    UIView *view10 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.view.frame), 0, 40, CGRectGetHeight(self.view.frame))];
    [self.view addSubview:view10];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(view10.frame), 0, CGRectGetWidth(self.view.frame) + 40, CGRectGetHeight(self.view.frame))];
    view2.backgroundColor = [UIColor blueColor];
    [scroll addSubview:view2];
    UIView *view20 = [[UIView alloc] initWithFrame:CGRectMake(2*CGRectGetMaxX(self.view.frame), 0, 40, CGRectGetHeight(self.view.frame))];
    [self.view addSubview:view20];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(view2.frame), 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    view3.backgroundColor = [UIColor orangeColor];
    [scroll addSubview:view3];
    
}

@end
