//
//  PlaceHolderTextView.h
//  MasonryTest
//
//  Created by Dex on 15/12/6.
//  Copyright © 2015年 Dex.XU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
@interface PlaceHolderTextView : UITextView
@property (weak, nonatomic)UILabel *placeHolderLabel;
-(void)chooseToHidePlaceHolderLabel;
-(void)setPlaceHolderLabelWithText:(NSString *)placeHolderText;
@end
