//
//  ContactGroup.m
//  ReloadCell_Demo
//
//  Created by 黎海涛 on 15/9/9.
//  Copyright (c) 2015年 dianzhidao. All rights reserved.
//

#import "ContactGroup.h"

@implementation ContactGroup
-(ContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts{
    if (self = [super init]) {
        self.name = name;
        self.detail = detail;
        self.contacts = contacts;
    }
    return self;
}

+(ContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts{
    ContactGroup *group = [[ContactGroup alloc]initWithName:name andDetail:detail andContacts:contacts];
    return group;
}
@end
