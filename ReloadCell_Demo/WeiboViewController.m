//
//  WeiboViewController.m
//  ReloadCell_Demo
//
//  Created by 黎海涛 on 15/9/9.
//  Copyright (c) 2015年 dianzhidao. All rights reserved.
//

#import "WeiboViewController.h"
#import "Status.h"
#import "StatusTableViewCell.h"

@interface WeiboViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
    NSMutableArray *_status;
    NSMutableArray *_statusCells;
}

@end

@implementation WeiboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate   = self;
    [self.view addSubview:_tableView];
}

-(void)initData{
    NSString *path= [[NSBundle mainBundle]pathForResource:@"StatusInfo" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    _status = [[NSMutableArray alloc]init];
    _statusCells = [[NSMutableArray alloc]init];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [_status addObject:[Status statusWithDictionary:obj]];
        StatusTableViewCell *cell = [[StatusTableViewCell alloc]init];
        [_statusCells addObject:cell];
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _status.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    StatusTableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[StatusTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Status *status = _status[indexPath.row];
    cell.status = status;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    StatusTableViewCell *cell = _statusCells[indexPath.row];
    cell.status = _status[indexPath.row];
    return cell.height;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
