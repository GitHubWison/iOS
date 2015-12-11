//
//  PlaceHolderTextView.m
//  MasonryTest
//
//  Created by Dex on 15/12/6.
//  Copyright © 2015年 Dex.XU. All rights reserved.
//

#import "PlaceHolderTextView.h"

@implementation PlaceHolderTextView
-(instancetype)init
{
    self = [super init];
    if (self) {
        UILabel *placeHolderLabel = [[UILabel alloc]init];
        self.placeHolderLabel = placeHolderLabel;
//        [placeHolderLabel setText:placeHolderText];
//        [placeHolderLabel setTextColor:[UIColor colorWithRed:206.0/255 green:206.0/255 blue:206.0/255 alpha:1]];
//        [placeHolderLabel setBackgroundColor:[UIColor blueColor]];
        [self addSubview:placeHolderLabel];
        
//        为placeholderlabel添加约束
        [placeHolderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.mas_equalTo(self);
            make.left.mas_equalTo(self.mas_left).offset(4);
            make.height.mas_equalTo(@30);
        }];
    }
    return self;
}
-(void)chooseToHidePlaceHolderLabel
{
    self.placeHolderLabel.hidden = [self hasText];
}
-(void)setPlaceHolderLabelWithText:(NSString *)placeHolderText
{
    [self.placeHolderLabel setText:placeHolderText];
    [self.placeHolderLabel setTextColor:[UIColor colorWithRed:206.0/255 green:206.0/255 blue:206.0/255 alpha:1]];
}
@end
