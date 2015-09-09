//
//  ChooseRoleCell.m
//  ReloadCell_Demo
//
//  Created by 黎海涛 on 15/9/8.
//  Copyright (c) 2015年 dianzhidao. All rights reserved.
//

#import "ChooseRoleCell.h"

@implementation ChooseRoleCell
-(instancetype)init{
    self = [super init];
    if (self) {
        [self createCell];
    }
    return self;
}

-(void)createCell{
    self.selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.selectBtn.frame = CGRectMake(35, 15, 20, 20);
    [self.selectBtn setBackgroundImage:[UIImage imageNamed:@"deselect"] forState:UIControlStateNormal];
    [self addSubview:self.selectBtn];
    
    self.nameLab = [[UILabel alloc]initWithFrame:CGRectMake(75, 14, 230, 21)];
    [self.nameLab setText:@"text"];
    [self.nameLab setTextColor:[UIColor blackColor]];
    [self addSubview:_nameLab];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
