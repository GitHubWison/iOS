//
//  AddQuestionBar.m
//  MasonryTest
//
//  Created by Dex on 15/12/6.
//  Copyright © 2015年 Dex.XU. All rights reserved.
//

#import "AddQuestionBar.h"

@implementation AddQuestionBar

-(instancetype)init
{
    self = [super init];
    if (self) {
//        显示周边小区可见的uiview
        UIView *aroundseeUIView = [[UIView alloc]init];
//        [aroundseeUIView setBackgroundColor:[UIColor yellowColor]];
        [self addSubview:aroundseeUIView];
//        显示拍照发表情和@的uiview
        UIView *sendOthers = [[UIView alloc]init];
//        [sendOthers setBackgroundColor:[UIColor greenColor]];
        [self addSubview:sendOthers];
//        为两个view添加约束
        
        [aroundseeUIView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(self);
            make.right.mas_equalTo(sendOthers.mas_left);
            make.width.mas_equalTo(sendOthers.mas_width);
        }];
        
        [sendOthers mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.mas_equalTo(self);
            make.left.mas_equalTo(aroundseeUIView.mas_right);
            make.width.mas_equalTo(aroundseeUIView.mas_width);
        }];
        UISwitch *aroundsee_switchbutton = [[UISwitch alloc]init];
        self.aroundSeeSwitch = aroundsee_switchbutton;
        UILabel *aroundCanSeeLabel = [[UILabel alloc]init];
//        [aroundCanSeeLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:10]];
        [aroundCanSeeLabel setText:@"周边小区可见"];
        aroundCanSeeLabel.font = [UIFont systemFontOfSize:14];
        [aroundseeUIView addSubview:self.aroundSeeSwitch];
        [aroundseeUIView addSubview:aroundCanSeeLabel];
//        添加约束
        [self.aroundSeeSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(aroundseeUIView).offset(10);
            make.bottom.mas_equalTo(aroundseeUIView).offset(-10);
            make.right.mas_equalTo(aroundCanSeeLabel.mas_left).offset(-10);
//            make.width.mas_equalTo(@10);
            
        }];
        [aroundCanSeeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.mas_equalTo(aroundseeUIView);
            make.left.mas_equalTo(self.aroundSeeSwitch.mas_right).offset(10);
        }];
        
//        设置三个uiview
        UIView *photoView = [[UIView alloc]init];
//        [photoView setBackgroundColor:[UIColor redColor]];
        UIView *emojView = [[UIView alloc]init];
//        [emojView setBackgroundColor:[UIColor whiteColor]];
        UIView *atView = [[UIView alloc]init];
//        [atView setBackgroundColor:[UIColor blueColor]];
        [sendOthers addSubview:photoView];
        [sendOthers addSubview:emojView];
        [sendOthers addSubview:atView];
        
//        添加约束
        [atView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(sendOthers);
            make.right.mas_equalTo(emojView.mas_left);
            make.width.mas_equalTo(emojView);
        }];
        [emojView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(sendOthers);
            make.left.mas_equalTo(atView.mas_right);
            make.right.mas_equalTo(photoView.mas_left);
            make.width.mas_equalTo(photoView);
        }];
        [photoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.mas_equalTo(sendOthers);
            make.left.mas_equalTo(emojView.mas_right);
            make.width.mas_equalTo(atView);
        }];

        
        UIButton *at_button = [[UIButton alloc] init];
        [at_button setImage:[UIImage imageNamed:@"call_to_person_selected@2x"] forState:UIControlStateNormal];
        [atView addSubview:at_button];
        [at_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.left.mas_equalTo(atView);
        }];
        
        UIButton *emoj_button = [[UIButton alloc]init];
        [emoj_button setImage:[UIImage imageNamed:@"view_send_face@2x"] forState:UIControlStateNormal];
        [emojView addSubview:emoj_button];
        [emoj_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.left.mas_equalTo(emojView);
        }];
        
        UIButton *photo_button = [[UIButton alloc]init];
        [photo_button setImage:[UIImage imageNamed:@"view_send_pic@2x"] forState:UIControlStateNormal];
        [photoView addSubview:photo_button];
        [photo_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.left.mas_equalTo(photoView);
        }];
        
    }
    return self;
}

@end
