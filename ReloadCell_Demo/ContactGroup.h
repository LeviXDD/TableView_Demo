//
//  ContactGroup.h
//  ReloadCell_Demo
//
//  Created by 黎海涛 on 15/9/9.
//  Copyright (c) 2015年 dianzhidao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactGroup : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *detail;
@property (nonatomic,copy) NSMutableArray *contacts;
-(ContactGroup*)initWithName:(NSString*)name andDetail:(NSString*)detail andContacts:(NSMutableArray*)contacts;
+(ContactGroup*)initWithName:(NSString*)name andDetail:(NSString*)detail andContacts:(NSMutableArray*)contacts;

@end
