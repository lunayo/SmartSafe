//
//  Employee.h
//  SmartSafe
//
//  Created by Lunayo on 07/02/2015.
//  Copyright (c) 2015 Lunayo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SmartSafeServices.h"

@interface Employee : NSObject

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *address;
@property (assign, nonatomic) long phoneNumber;
@property (assign, nonatomic) int age;
@property (assign, nonatomic) long totalHours;
@property (strong, nonatomic) NSString *healthIssue;

+ (void)getEmployeeInformation:(void(^)(NSArray *employees, NSError *error))block;

@end
