//
//  TwitterUIButton.m
//  
//
//  Created by Dex on 15/12/4.
//
//

#import "TwitterUIButton.h"

@implementation TwitterUIButton
@synthesize twitterImage,twitterText;


-(UIView *)initWithTwitterImage:(UIImage *)img andTwitterText:(NSString *)text
{
    self = [super init];
    self.twitterImage = img;
    self.twitterText = text;
    UIImageView *twitterImageView = [[UIImageView alloc]initWithImage:twitterImage];
    UILabel *twitterLabel = [[UILabel alloc]init];
    [twitterLabel setTextAlignment:NSTextAlignmentCenter];
    [twitterLabel setText:twitterText];
    [twitterLabel setTextColor:[UIColor whiteColor]];
    [self addSubview:twitterLabel];
        [self addSubview:twitterImageView];
    
    [twitterImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.bottom.mas_equalTo(twitterLabel.mas_top).offset(-10);
        make.width.mas_equalTo(twitterImage.size.width);
        make.height.mas_equalTo(twitterImage.size.height);
    }];

    
    //    为下方的label添加约束
    [twitterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.left.mas_equalTo(self);
        make.top.mas_equalTo(twitterImageView.mas_bottom).offset(10);
    }];
    
    return self;
}
@end
