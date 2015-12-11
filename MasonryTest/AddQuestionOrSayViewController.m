//
//  AddQuestionOrSayViewController.m
//  MasonryTest
//
//  Created by Dex on 15/12/4.
//  Copyright © 2015年 Dex.XU. All rights reserved.
//

#import "AddQuestionOrSayViewController.h"

@interface AddQuestionOrSayViewController ()


@property (weak,nonatomic)UINavigationBar *navBar;
//@property (weak,nonatomic)AddPictureView *addPictureView;
//@property (weak,nonatomic)AddQuestionBar *addQuestionBar;
@end

@implementation AddQuestionOrSayViewController

-(void)loadView
{
    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    如果视图中加载了UIScrollview ，则添加到UIScrllview 上的视图会默认遵循UIScrollview的规则，即顶部有44高度的Header. 这样就会导致添加上的UITextView,UITextField等同样会有这种效果，导致光标位置不在顶部，而是靠下。
    self.automaticallyAdjustsScrollViewInsets = NO;
    
//        [self updateBarHeight];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UINavigationBar *nav_bar = [[UINavigationBar alloc]init];
    nav_bar = self.navigationController.navigationBar;
    self.navBar = nav_bar;
//    正文内容

    PlaceHolderTextView *body_textField = [[PlaceHolderTextView alloc]init];
//    KeyBoardToolBar *tool_bar = [[KeyBoardToolBar alloc]init];
//    self.keyBoardToolBar = tool_bar;
    NewTwitterToolBar *twitter_bar = [[NewTwitterToolBar alloc]init];
    self.twitterToolBar = twitter_bar;
    [self.twitterToolBar.addPicView setAddpicDelegate:self];
    [self.view addSubview:self.twitterToolBar];
    

    self.bodyPlaceHolderTextView = body_textField;
//    [body_textField setInputAccessoryView:self.twitterToolBar];
//    [self.bodyPlaceHolderTextView setBackgroundColor:[UIColor redColor]];
    [self.bodyPlaceHolderTextView setDelegate:self];


    [self.view addSubview:self.bodyPlaceHolderTextView];
    
    //    1.设置摆放的位置
    [self.bodyPlaceHolderTextView mas_makeConstraints:^(MASConstraintMaker *make) {
//        NSLog(@"%f",self.navigationController.navigationBar.frame.size.height);
        CGFloat topbaraddnavbarheight = self.navigationController.navigationBar.frame.size.height + 20;
        make.top.mas_equalTo(self.view).offset(topbaraddnavbarheight);
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.twitterToolBar.mas_top);
    }];
    [self.twitterToolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bodyPlaceHolderTextView.mas_bottom);
        make.left.right.bottom.mas_equalTo(self.view);
    }];
    
    
//    测试添加图片
    NSMutableArray *array = [[NSMutableArray alloc]init];
    [array addObjectsFromArray:@[@"view_send_face@2x",@"call_to_person_selected@2x",@"view_send_face@2x",@"call_to_person_selected@2x",@"view_send_face@2x"]];
//    [self.twitterToolBar.addPicView addPicInView:array];
    [self.twitterToolBar.addPicView addPicByFrame:array];

    
    

}
-(void)viewDidLoad
{
//    NSLog(@"placeholdertext === %@",self.placeHoldertext);
    [self.bodyPlaceHolderTextView setPlaceHolderLabelWithText:self.placeHoldertext];
//    sleep(2000);
    [self.bodyPlaceHolderTextView becomeFirstResponder];
}

-(void)setNavBar:(UINavigationBar *)navBar
{
//    获得navbar的size
    CGSize navBarSize = navBar.frame.size;
    
//    设置左右的button，如果有必要在button中填充uiimageview
//    1.设置左边的button
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, navBarSize.height*2/3, navBarSize.height*2/3)];
    UIImage *leftImage = [UIImage imageNamed:@"close@2x"];
    UIImageView *leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, navBarSize.height*2/3, navBarSize.height*2/3)];
    [leftImageView setImage:leftImage];
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, navBarSize.height*2/3, navBarSize.height*2/3)];
    [leftImageView setCenter:leftButton.center];
    [leftButton addSubview:leftImageView];
    [leftView addSubview:leftButton];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftView];
    [leftButton addTarget:self action:@selector(onClickNavBarLeftButton) forControlEvents:UIControlEventTouchUpInside];
//    2.设置右边的button
    UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, navBarSize.width/8, navBarSize.height)];
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, navBarSize.width/8, navBarSize.height)];
    UILabel *rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, navBarSize.width/8, navBarSize.height)];
    [rightLabel setText:@"发布"];
    [rightLabel setTextColor:[UIColor lightGrayColor]];
    [rightButton addSubview:rightLabel];
    [rightView addSubview:rightButton];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightView];
    [rightButton addTarget:self action:@selector(onClickNavBarRightButton) forControlEvents:UIControlEventTouchUpInside];
//    设置标题
    
    self.navigationItem.title = self.titleName;
    


}
-(void)textViewDidChange:(UITextView *)textView
{
    [self.bodyPlaceHolderTextView chooseToHidePlaceHolderLabel];
}

-(void)onClickNavBarLeftButton
{
//    NSLog(@"左边");
    [self.bodyPlaceHolderTextView resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(void)onClickNavBarRightButton
{
    [self.bodyPlaceHolderTextView resignFirstResponder];
//    NSLog(@"右边");
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKeyBoardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKeyBoardHide:) name:UIKeyboardWillHideNotification object:nil];
}
#pragma mark 键盘弹起
-(void)onKeyBoardShow:(NSNotification *)notification
{
    CGRect keyboardSize = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    [self.bodyPlaceHolderTextView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(@40);
//    }];
    [self.twitterToolBar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view).offset(-keyboardSize.size.height);
    }];
    [self updateBarHeight];
//    NSLog(@"键盘弹出");
}
#pragma mark 键盘隐藏
-(void)onKeyBoardHide:(NSNotification *)notification
{
//    隐藏键盘后
    [self.twitterToolBar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view);
    }];
//    NSLog(@"键盘隐藏");
    [self updateBarHeight];
}
//键盘弹出或收起时需要做的动画
- (void)updateBarHeight
{
    [self.view setNeedsUpdateConstraints];
    [UIView animateKeyframesWithDuration:0.15       //animationDuration
                                   delay:0
                                 options:7 << 16    //animationOptions
                              animations:^{
                                  [self.view layoutIfNeeded];
                              } completion:nil];
}

#pragma mark 点击添加按钮时的代理方法
-(void)crossButtonClicked
{
//    打开图片选择器
    
//    UIImagePickerController *imgpicController = [[UIImagePickerController alloc]init];
//    [self presentViewController:imgpicController animated:YES completion:nil];
//    QBImagePickerController *imagePickerController = [QBImagePickerController new];
//    imagePickerController.allowsMultipleSelection = YES;
//    imagePickerController.maximumNumberOfSelection = 6;
//    [imagePickerController setDelegate:self];
//    [self presentViewController:imagePickerController animated:YES completion:nil];
//    UIAlertController *alertController = [UIAlertController new];
//    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
//                                                                   message:@"This is an alert."
//                                                            preferredStyle:UIAlertControllerStyleActionSheet];
//    
//    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
//                                                          handler:^(UIAlertAction * action) {}];
//    
//    [alert addAction:defaultAction];
//    [self presentViewController:alert animated:YES completion:nil];
//      弹出提示选择图片或是拍照
    UIAlertController *alertController = [[UIAlertController alloc]init];
    UIAlertAction *cancelaction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *selectInPhoto = [UIAlertAction actionWithTitle:@"从相册中选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"从相册中选择");
        QBImagePickerController *qbimagePickerController = [[QBImagePickerController alloc]init];
        qbimagePickerController.allowsMultipleSelection = YES;
        qbimagePickerController.maximumNumberOfSelection = 6;
        qbimagePickerController.showsNumberOfSelectedAssets = YES;
        qbimagePickerController.mediaType = QBImagePickerMediaTypeImage;
        [qbimagePickerController setDelegate:self];
        [self presentViewController:qbimagePickerController animated:YES completion:nil];
        
        
//        QBAssetsViewController *qbassetscontroller = [[QBAssetsViewController alloc]initWithCollectionViewLayout:nil];
//        UICollectionViewLayout *collectViewlayout = [UICollectionViewLayout alloc]init
//        qbassetscontroller.imagePickerController.allowsMultipleSelection = YES;
//        qbassetscontroller.imagePickerController.maximumNumberOfSelection = 6;
//        [qbassetscontroller.imagePickerController setDelegate:self];
//        [self presentViewController:qbassetscontroller animated:YES completion:nil];
    }];
    UIAlertAction *takePhoto = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"拍照");
    }];
    [alertController addAction: cancelaction];
    [alertController addAction:takePhoto];
    [alertController addAction:selectInPhoto];

    [self presentViewController:alertController animated:YES completion:nil];
    

}
-(void)qb_imagePickerControllerDidCancel:(QBImagePickerController *)imagePickerController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
