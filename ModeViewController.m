//
//  ModeViewController.m
//  MasonryTest
//
//  Created by Dex on 15/11/30.
//  Copyright © 2015年 Dex.XU. All rights reserved.
//

#import "ModeViewController.h"
#import "Masonry.h"
@interface ModeViewController ()

@end

@implementation ModeViewController

-(void)loadView
{
    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor orangeColor];
//    姓名
    UIView *nameView = [[UIView alloc]init];
    [nameView setBackgroundColor:[UIColor grayColor]];
//    姓名的label
    UILabel *nameLabel = [[UILabel alloc]init];
    [nameLabel setNumberOfLines:0];
    [nameLabel setText:@"姓名："];
    nameLabel.backgroundColor = [UIColor whiteColor];
//    姓名的输入框
    UITextField *nameTextField = [[UITextField alloc]init];
    nameTextField.backgroundColor = [UIColor whiteColor];
    [nameView addSubview: nameLabel];
    [nameView addSubview:nameTextField];
//    为姓名元素添加约束
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(nameView).with.offset(8);
        make.right.mas_equalTo(nameTextField.mas_left).with.offset(-8);
        make.bottom.mas_equalTo(nameView.mas_bottom).with.offset(-8);
        make.width.mas_equalTo(@100);
        
    }];
    [nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(nameLabel.mas_right).with.offset(8);
        make.top.mas_equalTo(nameView.mas_top).with.offset(8);
        make.right.mas_equalTo(nameView.mas_right).with.offset(-8);
        make.bottom.mas_equalTo(nameView.mas_bottom).with.offset(-8);
//        make.width.mas_equalTo(nameLabel);
    }];
    [self.view addSubview:nameView];
//    密码
    UIView *passwordView = [[UIView alloc]init];
    [passwordView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:passwordView];
    
    //    密码的label
    UILabel *passwordLabel = [[UILabel alloc]init];
    [passwordLabel setNumberOfLines:0];
    [passwordLabel setText:@"密码："];
    passwordLabel.backgroundColor = [UIColor whiteColor];
    //    密码的输入框
    UITextField *passwordTextField = [[UITextField alloc]init];
    passwordTextField.backgroundColor = [UIColor whiteColor];
    [passwordView addSubview: passwordLabel];
    [passwordView addSubview:passwordTextField];
    //    为密码元素添加约束
    [passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(passwordView).with.offset(8);
        make.right.mas_equalTo(nameTextField.mas_left).with.offset(-8);
        make.bottom.mas_equalTo(passwordView.mas_bottom).with.offset(-8);
        make.width.mas_equalTo(@100);
        
    }];
    [passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(passwordLabel.mas_right).with.offset(8);
        make.top.mas_equalTo(passwordView.mas_top).with.offset(8);
        make.right.mas_equalTo(passwordView.mas_right).with.offset(-8);
        make.bottom.mas_equalTo(passwordView.mas_bottom).with.offset(-8);
        //        make.width.mas_equalTo(nameLabel);
    }];

    
//    登录按钮
    UIView *loginView = [[UIView alloc]init];
    [loginView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:loginView];
    UIButton *loginButton = [[UIButton alloc]init];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    loginButton.backgroundColor = [UIColor greenColor];
    
    
    [loginView addSubview:loginButton];
//    为登录按钮添加约束
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(loginView).with.offset(8);
        make.right.bottom.equalTo(loginView).with.offset(-8);
    }];
    [loginButton addTarget:nil action:@selector(onClickLoginButton) forControlEvents:UIControlEventTouchUpInside];
//    为姓名添加约束
    [nameView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.mas_equalTo(ws).with.offset(10);
        make.left.mas_equalTo(self.view.mas_left).with.offset(10);
        make.top.mas_equalTo(self.view.mas_top).with.offset(20);
        make.right.mas_equalTo(self.view.mas_right).with.offset(-10);
        make.bottom.mas_equalTo(passwordView.mas_top).with.offset(-10);
        make.height.mas_equalTo(@50);
    }];
//    为密码添加约束
    [passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(nameView.mas_bottom).with.offset(10);
        make.left.mas_equalTo(self.view.mas_left).with.offset(10);
        make.right.mas_equalTo(self.view.mas_right).with.offset(-10);
        make.bottom.mas_equalTo(loginView.mas_top).with.offset(-10);
        make.height.mas_equalTo(nameView);
    }];
//    为登录添加约束
    [loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(passwordView.mas_bottom).with.offset(10);
        make.right.mas_equalTo(self.view.mas_right).with.offset(-10);
        make.left.mas_equalTo(self.view.mas_left).with.offset(10);
        make.height.mas_equalTo(passwordView);
    }];
    
}

#pragma mark 登录按钮点击事件
-(void)onClickLoginButton
{
//    NSLog(@"clicked");
    [self dismissViewControllerAnimated:YES completion:^{
//        NSLog(@"finished");
        
    }];
}
@end
