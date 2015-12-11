//
//  MainViewController.m
//  MasonryTest
//
//  Created by Dex on 15/11/26.
//  Copyright © 2015年 Dex.XU. All rights reserved.
//

#import "MainViewController.h"
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
@interface MainViewController ()

@end

@implementation MainViewController
-(void)loadView
{
//    初始化view
    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    WS(ws);
    UIView *view1 = [[UIView alloc]init];
    [view1 setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(ws.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
//    UIView *view2 = [[UIView alloc]init];
//    view2.backgroundColor = [UIColor redColor];
//    [view1 addSubview:view2];
//    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.edges.equalTo(view1).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
////        make.top.equalTo(view1).with.offset(10);
////        make.right.equalTo(view1).with.offset(-10);
////        make.left.equalTo(view1).with.offset(10);
////        make.bottom.equalTo(view1).with.offset(-10);
//        
//        make.top.right.bottom.left.equalTo(view1).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
//        
//    }];
    
    UIView *view2 = [[UIView alloc]init];
    view2.backgroundColor = [UIColor orangeColor];
    [view1 addSubview:view2];
    UIView *view3 = [[UIView alloc]init];
    view3.backgroundColor = [UIColor orangeColor];
    [view1 addSubview:view3];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view1.mas_centerY);
        make.left.mas_equalTo(view1.mas_left).with.offset(10);
        make.right.mas_equalTo(view3.mas_left).with.offset(-10);
        make.height.mas_equalTo(@150);
        make.width.mas_equalTo(view3);
    }];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view1.mas_centerY);
        make.left.mas_equalTo(view2.mas_right).with.offset(10);
        make.right.mas_equalTo(view1.mas_right).with.offset(-10);
        make.height.mas_equalTo(@150);
        make.width.mas_equalTo(view2);
    }];
}
@end
