//
//  AddQuestionOrSayViewController.h
//  MasonryTest
//
//  Created by Dex on 15/12/4.
//  Copyright © 2015年 Dex.XU. All rights reserved.
//  新增邻里问问或随便说说

#import <UIKit/UIKit.h>
#import "ChooseTwitterViewController.h"
#import "PlaceHolderTextView.h"
#import "NewTwitterToolBar.h"
#import "AddPictureView.h"
#import "QBImagePickerController.h"
#import "QBAssetsViewController.h"
@interface AddQuestionOrSayViewController : UIViewController<UITextViewDelegate,AddPictureDelegate,QBImagePickerControllerDelegate>
@property (weak, nonatomic)NSString *titleName;
@property (weak, nonatomic)NSString *placeHoldertext;
@property (weak, nonatomic)PlaceHolderTextView *bodyPlaceHolderTextView;
@property (weak, nonatomic)NewTwitterToolBar *twitterToolBar;

@end
