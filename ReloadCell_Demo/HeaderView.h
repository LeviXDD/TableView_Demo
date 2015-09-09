//
//  HeaderView.h
//  ReloadCell_Demo
//
//  Created by 黎海涛 on 15/9/7.
//  Copyright (c) 2015年 dianzhidao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UITableViewHeaderFooterView
@property (strong, nonatomic) UIButton *selectButton;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UIImageView *arrowImgView;

@property (nonatomic, strong) UITapGestureRecognizer *tap;
@end
