//
//  ViewController.m
//  ReloadCell_Demo
//
//  Created by 黎海涛 on 15/9/7.
//  Copyright (c) 2015年 dianzhidao. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"
#import "ChooseRoleCell.h"

static NSString * const ReuserIdentifierHeader = @"header";
static NSString * const ReuserIdentifierCell = @"cell";
@interface ViewController ()

@property (nonatomic, strong) NSMutableDictionary *dataDic;
@property (nonatomic, strong) NSArray             *dataArr;

@property (nonatomic, strong) NSMutableArray      *expendArr;
@property (nonatomic, strong) NSMutableArray      *selectArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
