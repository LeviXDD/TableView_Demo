//
//  Status.m
//  ReloadCell_Demo
//
//  Created by 黎海涛 on 15/9/9.
//  Copyright (c) 2015年 dianzhidao. All rights reserved.
//

#import "Status.h"

@implementation Status
-(Status *)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        self.ID = [dic[@"Id"]longLongValue];
        self.profileImageUrl = dic[@"profileImageUrl"];
        self.userName = dic[@"userName"];
        self.mbtype = dic[@"mbtype"];
        self.createAt = dic[@"createdAt"];
        self.source = dic[@"source"];
        self.text = dic[@"text"];
    }
    return self;
}

+(Status *)statusWithDictionary:(NSDictionary *)dic{
    return [[self alloc]initWithDictionary:dic];
}
@end
