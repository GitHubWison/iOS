//
//  NewTwitterToolBar.h
//  MasonryTest
//
//  Created by Dex on 15/12/8.
//  Copyright © 2015年 Dex.XU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddPictureView.h"
#import "AddQuestionBar.h"
#import "Masonry.h"
@interface NewTwitterToolBar : UIView
@property (weak, nonatomic)AddPictureView *addPicView;
@property (weak, nonatomic)AddQuestionBar *addQueView;
@end
