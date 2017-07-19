//
//  Activity.m
//  SmartSafe
//
//  Created by Lunayo on 08/02/2015.
//  Copyright (c) 2015 Lunayo. All rights reserved.
//

#import "EmployeeActivity.h"

NSString * const kEmployeeActivityUri = @"activity";

@implementation EmployeeActivity

+ (EmployeeActivity *)employeeActivityFromDictionary:(NSDictionary *)dict {
    EmployeeActivity *employeeActivity = [[EmployeeActivity alloc] init];
    [employeeActivity setMachineId:[[dict objectForKey:@"id"] longValue]];
    [employeeActivity setMachineName:[dict objectForKey:@"name"]];
    [employeeActivity setMachineDescription:[dict objectForKey:@"description"]];
    [employeeActivity setNoiseLevel:[[dict objectForKey:@"noiseLevel"] intValue]];
    [employeeActivity setTotalHours:[[dict objectForKey:@"totalHours"] intValue]];
    
    return employeeActivity;
}

+ (void)getEmployeeActivityInformation:(NSString *)identifier withBlock:(void (^)(NSArray *, NSError *))block {
    SmartSafeServices *manager = [SmartSafeServices manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager GET:[[kSmartSafeBaseUri stringByAppendingPathComponent:kEmployeeActivityUri] stringByAppendingPathComponent:identifier]
      parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *employeeActivities = [[NSMutableArray alloc] init];
        if ([responseObject count] > 0) {
            for (NSDictionary *employeeActivity in responseObject) {
                [employeeActivities addObject:[EmployeeActivity employeeActivityFromDictionary:employeeActivity]];
            }
        }
        
        block(employeeActivities, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        block(nil, error);
    }];
}

@end
