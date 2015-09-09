//
//  HeaderView.m
//  ReloadCell_Demo
//
//  Created by 黎海涛 on 15/9/7.
//  Copyright (c) 2015年 dianzhidao. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView
-(instancetype)init{
    self = [super init];
    if (self) {
        [self createHeader];
    }
    return self;
}

-(void)awakeFromNib{
    self.tap = [[UITapGestureRecognizer alloc]init];
    [self addGestureRecognizer:_tap];
}

-(void)createHeader{
    self.selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.selectButton setBackgroundImage:[UIImage imageNamed:@"deselect"] forState:UIControlStateNormal];
    self.selectButton.frame = CGRectMake(0, 0, 20, 20);
    self.selectButton.center = CGPointMake(25, self.frame.size.height/2);
    [self addSubview:self.selectButton];
    
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(55, 28, 220, 21)];
    self.nameLabel.text = @"test";
    self.nameLabel.textColor = [UIColor blackColor];
    [self addSubview:self.nameLabel];
    
    self.arrowImgView = [[UIImageView alloc]init];
    self.arrowImgView.frame = CGRectMake(333, 32, 10, 10);
    [self.arrowImgView setImage:[UIImage imageNamed:@"jiantou"]];
    [self addSubview:self.arrowImgView];
}
@end
