//
//  StatusTableViewCell.h
//  ReloadCell_Demo
//
//  Created by 黎海涛 on 15/9/9.
//  Copyright (c) 2015年 dianzhidao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Status;
@interface StatusTableViewCell : UITableViewCell
//微博对象
@property (nonatomic,strong) Status *status;

//单元格高度
@property (nonatomic,assign) CGFloat height;

@end
