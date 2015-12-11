//
//  TwitterUIButton.h
//  
//
//  Created by Dex on 15/12/4.
//
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
@interface TwitterUIButton : UIButton
//图片
@property (weak, nonatomic)UIImage *twitterImage;
//内容
@property (weak, nonatomic)NSString *twitterText;
-(UIView *)initWithTwitterImage:(UIImage *)img andTwitterText:(NSString *)text;
@end
