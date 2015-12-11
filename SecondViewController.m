//
//  SecondViewController.m
//  MasonryTest
//
//  Created by Dex on 15/11/30.
//  Copyright © 2015年 Dex.XU. All rights reserved.
//

#import "SecondViewController.h"
#import "Masonry.h"
#import "ModeViewController.h"
#import "ChooseTwitterViewController.h"
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
@interface SecondViewController ()

@end

@implementation SecondViewController

-(void)loadView
{
    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor redColor];
    
    UIScrollView *scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 100)];
    [scrollview setContentSize:CGSizeMake(100 *6, 100)];
    [self.view addSubview: scrollview];
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 90, 100)];
    [view1 setBackgroundColor:[UIColor lightGrayColor]];
    [scrollview addSubview:view1];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(100, 0, 90, 100)];
    [view2 setBackgroundColor:[UIColor lightGrayColor]];
    [scrollview addSubview:view2];
    
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(200, 0, 90, 100)];
    [view3 setBackgroundColor:[UIColor lightGrayColor]];
    [scrollview addSubview:view3];
    
    UIView *view4 = [[UIView alloc]initWithFrame:CGRectMake(300, 0, 90, 100)];
    [view4 setBackgroundColor:[UIColor lightGrayColor]];
    [scrollview addSubview:view4];
    
    UIView *view5 = [[UIView alloc]initWithFrame:CGRectMake(400, 0, 90, 100)];
    [view5 setBackgroundColor:[UIColor lightGrayColor]];
    [scrollview addSubview:view5];
    
    UIView *view6 = [[UIView alloc]initWithFrame:CGRectMake(500, 0, 90, 100)];
    [view6 setBackgroundColor:[UIColor yellowColor]];
    [scrollview addSubview:view6];
    
    

    

    

    
}
#pragma mark 按钮的点击事件－跳到下一页
-(void)onClickButton
{
 
}


@end
