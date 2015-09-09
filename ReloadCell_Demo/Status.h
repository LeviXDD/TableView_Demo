//
//  Status.h
//  ReloadCell_Demo
//
//  Created by 黎海涛 on 15/9/9.
//  Copyright (c) 2015年 dianzhidao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Status : NSObject
@property (nonatomic, assign) long long ID;
@property (nonatomic, copy) NSString *profileImageUrl;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, assign) NSString *mbtype;
@property (nonatomic, copy) NSString *createAt;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *text;

-(Status*)initWithDictionary:(NSDictionary*)dic;
+(Status*)statusWithDictionary:(NSDictionary*)dic;
@end
