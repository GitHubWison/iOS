//
//  ChooseTwitterViewController.m
//  MasonryTest
//
//  Created by Dex on 15/12/3.
//  Copyright © 2015年 Dex.XU. All rights reserved.
//

#import "ChooseTwitterViewController.h"
#import "TwitterUIButton.h"
#import "AddQuestionOrSayViewController.h"
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
@interface ChooseTwitterViewController ()
{
    NSMutableArray *twitterTileArray;
    NSMutableArray *twitterPlaceHolderArray;
}
@property (weak,nonatomic) FXBlurView *blurView;
@property (weak,nonatomic) UIView *twitterSecondHand;

@end

@implementation ChooseTwitterViewController

-(void)loadView
{
    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    twitterTileArray = [[NSMutableArray alloc]initWithCapacity:3];
    twitterPlaceHolderArray = [[NSMutableArray alloc]initWithCapacity:3];
    [twitterTileArray addObjectsFromArray:@[ @"二手闲置",@"邻里问问",@"随便说说"]];
    [twitterPlaceHolderArray addObjectsFromArray:@[@"在这里描述下物品详情",@"小区及周边生活事情就找邻居问问吧…",@"家长里短，发现好东西就跟邻居说说吧…"]];
//    self.view.userInteractionEnabled = NO;
//    self.view.alpha = 0.07;
//    twitterButtonArray = [[NSMutableArray alloc]initWithCapacity:3];
    UIView *allTwitterView = [[UIView alloc]init];
    TwitterUIButton *secondTwitterButton = [[TwitterUIButton alloc]initWithTwitterImage:[UIImage imageNamed:@"闲置@2x"] andTwitterText:@"二手闲置"];
    TwitterUIButton *questionTwitterButton = [[TwitterUIButton alloc]initWithTwitterImage:[UIImage imageNamed:@"问问@2x"] andTwitterText:@"邻里问问"];
    TwitterUIButton *sayTwitterButton = [[TwitterUIButton alloc]initWithTwitterImage:[UIImage imageNamed:@"说说@2x"] andTwitterText:@"随便说说"];
    [allTwitterView addSubview:secondTwitterButton];
    [allTwitterView addSubview:questionTwitterButton];
    [allTwitterView addSubview:sayTwitterButton];
    
    
//    添加约束
    [secondTwitterButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(allTwitterView);
        make.right.mas_equalTo(questionTwitterButton.mas_left);
        make.width.mas_equalTo(questionTwitterButton.mas_width);
    }];
    [questionTwitterButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(allTwitterView);
        make.left.mas_equalTo(secondTwitterButton.mas_right);
        make.right.mas_equalTo(sayTwitterButton.mas_left);
        make.width.mas_equalTo(sayTwitterButton.mas_width);
    }];
    [sayTwitterButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.mas_equalTo(allTwitterView);
        make.left.mas_equalTo(questionTwitterButton.mas_right);
        make.width.mas_equalTo(secondTwitterButton.mas_width);
    }];
    
    [self.view addSubview:allTwitterView];
//    计算高度
    CGFloat h = [UIImage imageNamed:@"说说@2x"].size.height + 40;
//    NSLog(@"%f****",h);
    
    UIButton *crossButton = [[UIButton alloc]init];
    UIImageView *crossImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"发布关闭@2x"]];
    [crossButton addSubview:crossImageView];
    [self.view addSubview:crossButton];
    [allTwitterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(crossButton.mas_top).offset(-30);
        make.height.mas_equalTo(h);
    }];
    [crossButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-10);
    }];
    
    [crossButton addTarget:self action:@selector(onClickCrossButton) forControlEvents:UIControlEventTouchUpInside];
//    [questionTwitterButton addTarget:self action:@selector(onClickQuestionButton) forControlEvents:UIControlEventTouchUpInside];
    [secondTwitterButton setTag:0];
    [questionTwitterButton setTag:1];
    [sayTwitterButton setTag:2];
    [secondTwitterButton addTarget:self action:@selector(onClickAddSecond:) forControlEvents:UIControlEventTouchUpInside];
    [questionTwitterButton addTarget:self action:@selector(onClickAdd:) forControlEvents:UIControlEventTouchUpInside];
    [sayTwitterButton addTarget:self action:@selector(onClickAdd:) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark 点击X号
-(void)onClickCrossButton
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
#pragma mark 新增闲置
-(void)onClickAddSecond:(TwitterUIButton*)button
{
    NSLog(@"新增闲置");
    
}
#pragma mark 新增问问
-(void)onClickQuestionButton
{
    NSLog(@"发布问问");
    AddQuestionOrSayViewController *addController = [[AddQuestionOrSayViewController alloc]init];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:addController];
    
    [self presentViewController:navController animated:YES completion:^{
        
    }];
   
}
#pragma mark 新增说说
-(void)onClickSayButton
{
    NSLog(@"发布说说");
}
#pragma mark 通过tag判断点击事件
-(void)onClickAdd:(TwitterUIButton *)button
{
//    NSLog(@"%d",button.tag);
//    需要传值,传的值就是tag

    AddQuestionOrSayViewController *addQuestionController = [[AddQuestionOrSayViewController alloc]init];
    UINavigationController *addQuestionNavController = [[UINavigationController alloc]initWithRootViewController:addQuestionController];
    addQuestionController.titleName = twitterTileArray[button.tag];
    addQuestionController.placeHoldertext = twitterPlaceHolderArray[button.tag];
//    [self.navigationController pushViewController:addQuestionNavController animated:YES];
    [self presentViewController:addQuestionNavController animated:YES completion:^{
//        [self.twitterDelegate sendTwitterTitleWith:twitterTileArray[button.tag]];
    }];
    
}


//-(void)loadView
//{
//    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];

//    UIImageView * imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    
//    imageView.image = [UIImage imageNamed:@"发布加号@2x"];
//    
//    [self.view addSubview:imageView];
    
    
//    
//    FXBlurView * aview = [[FXBlurView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    
//    aview.tintColor = [UIColor whiteColor];  //前景颜色
//    
//    aview.blurRadius = 100.0;                 //模糊半径
//    
//    aview.dynamic = YES;                     //动态改变模糊效果
//    
//    [self.view addSubview:aview];
//    
//    
//    
//    FXBlurView * bview = [[FXBlurView alloc] initWithFrame:CGRectMake(0, 120, 100, 100)];
//    
//    bview.tintColor = [UIColor whiteColor];  //前景颜色
//    
//    bview.blurEnabled = YES;                //是否允许模糊，默认YES
//    
//    bview.blurRadius = 10.0;               //模糊半径
//    
//    bview.dynamic = YES;                   //动态改变模糊效果
//    
//    bview.iterations = 2;                  //迭代次数：
//    
//    bview.updateInterval = 2.0;            //更新时间（不确定具体功能）
//    
//    /*
//     
//     blurRadius ＝ 1.0 && dynamic ＝ 100 的效果和 blurRadius ＝ 10.0 && dynamic ＝ 1的效果大致相同
//     
//     */
//    
//    [self.view addSubview:bview];
//    
//    
//    
//    FXBlurView * cview = [[FXBlurView alloc] initWithFrame:CGRectMake(150, 0, 200, 200)];
//    
//    cview.blurRadius = 20.0;
//    
//    cview.tintColor = [UIColor whiteColor];
//    
//    [self.view addSubview:cview];
    
//}

- (IBAction)closeChoosePage:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
