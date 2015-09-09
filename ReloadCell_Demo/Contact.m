//
//  Contact.m
//  ReloadCell_Demo
//
//  Created by 黎海涛 on 15/9/9.
//  Copyright (c) 2015年 dianzhidao. All rights reserved.
//

#import "Contact.h"

@implementation Contact
-(Contact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber{
    if(self=[super init]){
        self.firstName=firstName;
        self.lastName=lastName;
        self.phoneNumber=phoneNumber;
    }
    return self;
}

-(NSString *)getName{
    return [NSString stringWithFormat:@"%@ %@",_lastName,_firstName];
}

+(Contact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber{
    Contact *contact1=[[Contact alloc]initWithFirstName:firstName andLastName:lastName andPhoneNumber:phoneNumber];
    return contact1;
}
@end
