//
//  NewTwitterToolBar.m
//  MasonryTest
//
//  Created by Dex on 15/12/8.
//  Copyright © 2015年 Dex.XU. All rights reserved.
//

#import "NewTwitterToolBar.h"

@implementation NewTwitterToolBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        AddPictureView *addpic_view = [[AddPictureView alloc]init];
        AddQuestionBar *addque_view = [[AddQuestionBar alloc]init];
        self.addPicView = addpic_view;
        self.addQueView = addque_view;
        
        [self addSubview:self.addPicView];
        [self addSubview:self.addQueView];
        
        [self.addPicView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.left.mas_equalTo(self);
            make.bottom.mas_equalTo(self.addQueView.mas_top);
        }];
        [self.addQueView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(self);
            make.top.mas_equalTo(self.addPicView.mas_bottom);
        }];
    }
    return self;
}

@end
