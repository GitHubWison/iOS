//
//  AddPictureView.m
//  MasonryTest
//
//  Created by Dex on 15/12/7.
//  Copyright © 2015年 Dex.XU. All rights reserved.
//

#import "AddPictureView.h"

@implementation AddPictureView
-(instancetype)init
{
    self = [super init];
    if (self) {
        UIImage *addpicImage = [UIImage imageNamed:@"add_pic@2x"];
        CGSize addpicImageSize = addpicImage.size;
        self.viewHeight = addpicImageSize.height;
        //        首先添加一个scrollview
        //        [self setBackgroundColor:[UIColor grayColor]];
        UIScrollView *horScrollView = [[UIScrollView alloc]init];
        self.selectPicScroll = horScrollView;
        
        [self addSubview:self.selectPicScroll];
        //        为scrollview添加约束
        [self.selectPicScroll mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.bottom.mas_equalTo(self);
            make.height.mas_equalTo(addpicImageSize.height);
        }];
        
        [self.selectPicScroll setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.viewHeight)];
        self.selectPicScroll.showsHorizontalScrollIndicator = NO;
//        [self.selectPicScroll setContentSize:CGSizeMake((self.viewHeight + 10) * 7, self.viewHeight)];
        [self.selectPicScroll setContentSize:CGSizeMake((self.viewHeight + 10) * 1, self.viewHeight)];
        UIButton *cross_btn = [[UIButton alloc]init];
        self.crossButton = cross_btn;
        [self.crossButton addTarget:self action:@selector(onClickCrossButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return  self;
}


-(void)addPicByFrame:(NSMutableArray *)picNameArray
{
    
    [picNameArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        检查图片数量是否超过显示
         NSInteger allpicinscroll = [self.selectPicScroll subviews].count;
        if (allpicinscroll < 6) {
            [self.selectPicScroll setContentSize:CGSizeMake((allpicinscroll + 1) *(self.viewHeight + 10), self.viewHeight)];
            [self addSinglePicByFrame:obj];
        }
        else
        {
            NSLog(@"超过上限");
        }
    }];
    NSInteger allpicinscroll = [self.selectPicScroll subviews].count;
    if (allpicinscroll <= 5) {
//        在图片的最后一列添加加号按钮
        [self.selectPicScroll setContentSize:CGSizeMake((allpicinscroll + 1) *(self.viewHeight + 10) + 10, self.viewHeight)];
        [self addSinglePicByFrameWithCrossButton];
    }
    
}

-(void)addSinglePicByFrameWithCrossButton
{
    //    首先计算出要放置在位置的x坐标
    //    1.获得scrollview中所有的子控件
    NSArray *allSubViews = [self.selectPicScroll subviews];
    //    2.得到需要放置的x坐标
    CGFloat inputPicX = allSubViews.count * (self.viewHeight + 10) + 10;
    //    NSLog(@"inputpicx== %f",inputPicX);
    [self.crossButton setFrame:CGRectMake(inputPicX, 0, self.viewHeight, self.viewHeight)];
    [self.crossButton setBackgroundColor:[UIColor grayColor]];
    [self.crossButton.layer setCornerRadius:5.0];
    [self.crossButton setImage:[UIImage imageNamed:@"add_pic@2x"] forState:UIControlStateNormal];
    [self.selectPicScroll addSubview:self.crossButton];
}
-(void)addSinglePicByFrame:(id)picName
{
    //    首先计算出要放置在位置的x坐标
    //    1.获得scrollview中所有的子控件
    NSArray *allSubViews = [self.selectPicScroll subviews];
    //    2.得到需要放置的x坐标
    CGFloat inputPicX = allSubViews.count * (self.viewHeight + 10) + 10;
    //    NSLog(@"inputpicx== %f",inputPicX);
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(inputPicX, 0, self.viewHeight, self.viewHeight)];
    [btn setBackgroundColor:[UIColor grayColor]];
    [btn.layer setCornerRadius:5.0];
    [btn setImage:[UIImage imageNamed:picName] forState:UIControlStateNormal];
    [self.selectPicScroll addSubview:btn];
}

#pragma mark 向此view中添加多个图片
-(void)addPicInView:(NSMutableArray *)picNameArray
{
    
    [picNameArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [self addSinglePic:obj];
    }];
    //    如果添加的图片已经达到了6 则不要添加加号图片
    NSInteger allpicinscroll = [self.selectPicScroll subviews].count;
    if (allpicinscroll < 7) {
        //        添加加号图片到最后一列
        [self addSinglePic:@"add_pic@2x"];
    }
    
    
}


-(void)addSinglePic:(id)picName
{
    NSArray *scrollSubviews = [self.selectPicScroll subviews];
    UIButton *imageButton = [[UIButton alloc]init];
    [imageButton setBackgroundColor:[UIColor lightGrayColor]];
    UIImage *image = [UIImage imageNamed:(NSString *)picName];
    [imageButton setImage:image forState:UIControlStateNormal];
    [self.selectPicScroll addSubview:imageButton];
    
    //        根据已有的图片的，设置图片的位置
    [imageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.selectPicScroll);
        UIButton *lastButton = (UIButton *)scrollSubviews.lastObject;
        make.left.mas_equalTo(lastButton.mas_right).offset(10);
        make.width.mas_equalTo(self.viewHeight);
        make.height.mas_equalTo(self.viewHeight);
    }];

}
//点击加号按钮的响应事件
-(void)onClickCrossButton
{
    [self.addpicDelegate crossButtonClicked];

}
@end

