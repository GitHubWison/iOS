//
//  FirstViewController.m
//  MasonryTest
//
//  Created by Dex on 15/11/30.
//  Copyright © 2015年 Dex.XU. All rights reserved.
//

#import "FirstViewController.h"
#import "Masonry.h"
#import "PushViewController.h"
@interface FirstViewController ()
{
    //顶部导航栏长度
    CGFloat navbarWidth;
    CGFloat navbarHeight;
}
@property (weak,nonatomic) UIScrollView *listScrollView;
@property (weak, nonatomic)UIView *questionView;
@property (weak, nonatomic)UIView *sayView;
@property (weak, nonatomic)UIView *selectView;
@property (weak, nonatomic)UITableView *questionTableView;
@property (weak, nonatomic)UITableView *sayTableView;
@property (weak, nonatomic)UITableView *selectTableView;
@property (weak, nonatomic)UIView *topTab;
@property (weak, nonatomic)UINavigationBar *navBar;

@end

@implementation FirstViewController

-(void)loadView
{
    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
//    这一段必须加上否则找不到navgationbar
    UINavigationBar *nav_bar = [[UINavigationBar alloc]init];
    nav_bar = self.navigationController.navigationBar;
    self.navBar = nav_bar;
    
//    添加顶部的tab（随便说说邻里问问等）
    UIView *topTab = [[UIView alloc]init];
    [self.view addSubview:topTab];
    [topTab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(20 + navbarHeight);
        make.height.mas_equalTo(30);
        make.left.right.mas_equalTo(self.view);
        
    }];
//邻里问问tab
    UIButton *questionTabButton = [[UIButton alloc]init];
//随便说所tab
    UIButton *sayTabButton = [[UIButton alloc]init];
//    66精选tab
    UIButton *selectButton = [[UIButton alloc]init];
    
    [questionTabButton setTitle:@"邻里问问" forState:UIControlStateNormal];
    [sayTabButton setTitle:@"随便说说" forState:UIControlStateNormal];
    [selectButton setTitle:@"66精选" forState:UIControlStateNormal];
    [topTab addSubview:questionTabButton];
    [topTab addSubview:sayTabButton];
    [topTab addSubview:selectButton];
//    为邻里问问添加约束
    [questionTabButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(topTab);
        make.right.mas_equalTo(sayTabButton.mas_left);
        make.width.mas_equalTo(sayTabButton);
    }];
//    为随便说说添加约束
    [sayTabButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(topTab);
        make.left.mas_equalTo(questionTabButton.mas_right);
        make.right.mas_equalTo(selectButton.mas_left);
        make.width.mas_equalTo(selectButton);
    }];
//    为66精选添加约束
    [selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.mas_equalTo(topTab);
        make.left.mas_equalTo(sayTabButton.mas_right);
        make.width.mas_equalTo(questionTabButton);
    }];
    self.topTab = topTab;
    
    [topTab setNeedsLayout];
    [topTab layoutIfNeeded];
//    NSLog(@"%f",topTab.frame.size.height);
    UIView *mainView = [[UIView alloc]init];
    [self.view addSubview:mainView];
//    为mainView设置约束
    [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
//        NSLog(@"%f",navbarHeight);
        make.top.mas_equalTo(topTab.mas_bottom);
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.left.right.mas_equalTo(self.view);
        
    }];
    
   
    [mainView setNeedsLayout];
    [mainView layoutIfNeeded];
//    获得mainview的长宽
    CGSize mainViewSize = mainView.frame.size;
    UIScrollView *list_scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, mainViewSize.width + 20, mainViewSize.height)];
    self.listScrollView = list_scrollview;
    [self.listScrollView setPagingEnabled:YES];
    [self.listScrollView setContentSize:CGSizeMake(mainViewSize.width * 3 + 60, mainViewSize.height)];
    self.listScrollView.showsHorizontalScrollIndicator = YES;
    UIView *question_view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mainViewSize.width, mainViewSize.height)];
    self.questionView = question_view;
    self.questionView.backgroundColor = [UIColor blueColor];
    [self.listScrollView addSubview:self.questionView];
    
    UIView *say_view = [[UIView alloc]initWithFrame:CGRectMake(mainViewSize.width + 20, 0, mainViewSize.width, mainViewSize.height)];
    self.sayView = say_view;
    self.sayView.backgroundColor = [UIColor redColor];
    [self.listScrollView addSubview:self.sayView];
    
    UIView *select_view = [[UIView alloc]initWithFrame:CGRectMake(2 * mainViewSize.width + 40, 0, mainViewSize.width, mainViewSize.height)];
    self.selectView = select_view;
    self.selectView.backgroundColor = [UIColor grayColor];
    [self.listScrollView addSubview:self.selectView];
    
    [mainView addSubview:self.listScrollView];
    
    UITableView *question_tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, mainViewSize.width, mainViewSize.height)];
    self.questionTableView = question_tableview;
    [self.questionView addSubview:self.questionTableView];
    
    
    
    
    
}

#pragma mark 按钮的点击事件
-(void)onClickToNextPushButton
{

    PushViewController *pushViewController = [[PushViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:pushViewController];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
    
}
#pragma mark  设置顶部导航栏中的内容
-(void)setNavBar:(UINavigationBar *)navBar
{
    navbarWidth = navBar.frame.size.width;
    navbarHeight = navBar.frame.size.height;
    UINavigationItem *navitem = self.navigationItem;
//    左边的签到按钮
    UIImage *signinImage = [UIImage imageNamed:@"签到@2x"];
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, signinImage.size.width, navbarHeight)];
    UIButton *signinButton= [[UIButton alloc]initWithFrame:CGRectMake(0, 0, signinImage.size.width, navbarHeight)];
//    signinButton.backgroundColor = [UIColor greenColor];
    [signinButton addTarget:self action:@selector(onClicksigninButton) forControlEvents:UIControlEventTouchUpInside];
    signinButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [signinButton setImage:signinImage forState:UIControlStateNormal];
    [leftView addSubview:signinButton];
    navitem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftView];
//    中间的标题栏
    [navitem setTitle:@"上海绿城"];
//    右边的搜索按钮
    UIImage *searchImage = [UIImage imageNamed:@"搜索@2x"];
    
    UIView *searchView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, searchImage.size.width, navbarHeight)];
    UIButton *searchButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, searchImage.size.width, navbarHeight)];
    [searchButton addTarget:self action:@selector(onClicksearchButton) forControlEvents:UIControlEventTouchUpInside];
    searchButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [searchButton setImage:searchImage forState:UIControlStateNormal];
    [searchView addSubview:searchButton];
    navitem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:searchView];
    
    
//    去掉导航栏下方的线条
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init]; 
}
#pragma mark navgationbar左边的按钮点击事件
-(void)onClicksigninButton
{
    NSLog(@"左边");
}
#pragma mark navgationbar右边按钮的点击事件
-(void)onClicksearchButton
{
    NSLog(@"右边");
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    NSInteger currentPage = scrollView.contentOffset.x/([UIScreen mainScreen].bounds.size.width);
    NSLog(@"%d", currentPage);
}


@end
