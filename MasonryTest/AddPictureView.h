//
//  AddPictureView.h
//  MasonryTest
//
//  Created by Dex on 15/12/7.
//  Copyright © 2015年 Dex.XU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@protocol AddPictureDelegate <NSObject>

-(void)crossButtonClicked;

@end

@interface AddPictureView : UIView
@property CGFloat viewHeight;
@property (weak, nonatomic)UIScrollView *selectPicScroll;
@property(weak, nonatomic)UIButton *crossButton;
@property(weak, nonatomic)id<AddPictureDelegate>addpicDelegate;

//通过计算frame的长宽来设置图片的位置
-(void)addPicByFrame:(NSMutableArray *)picNameArray;
//向此view中添加图片
-(void)addPicInView:(NSMutableArray *)picNameArray;
-(void)addSinglePicByFrame:(id)picName;
@end
