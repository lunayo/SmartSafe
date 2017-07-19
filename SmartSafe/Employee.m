//
//  Employee.m
//  SmartSafe
//
//  Created by Lunayo on 07/02/2015.
//  Copyright (c) 2015 Lunayo. All rights reserved.
//

#import "Employee.h"

NSString * const kEmployeeUri = @"employee";

@implementation Employee

+ (Employee *)employeeFromDictionary:(NSDictionary *)dict {
    Employee *employee = [[Employee alloc] init];
    [employee setIdentifier:[dict objectForKey:@"id"]];
    [employee setName:[dict objectForKey:@"name"]];
    [employee setAddress:[dict objectForKey:@"address"]];
    [employee setPhoneNumber:[[dict objectForKey:@"phoneNumber"] longValue]];
    [employee setAge:[[dict objectForKey:@"id"] intValue]];
    [employee setHealthIssue:[dict objectForKey:@"healthIssue"]];
    [employee setTotalHours:[[dict objectForKey:@"totalHours"] longValue]];
    return employee;
}

+ (void)getEmployeeInformation:(void (^)(NSArray *, NSError *))block {
    SmartSafeServices *manager = [SmartSafeServices manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager GET:[kSmartSafeBaseUri stringByAppendingPathComponent:kEmployeeUri] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        if ([responseObject count] > 0) {
            for (NSDictionary *employee in responseObject) {
                [employees addObject:[Employee employeeFromDictionary:employee]];
            }
        }
        
        block(employees, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        block(nil, error);
    }];
}

@end
