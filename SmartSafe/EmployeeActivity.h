//
//  Activity.h
//  SmartSafe
//
//  Created by Lunayo on 08/02/2015.
//  Copyright (c) 2015 Lunayo. All rights reserved.
//

#import "SmartSafeServices.h"
#import <Foundation/Foundation.h>

@interface EmployeeActivity : NSObject

@property (assign, nonatomic) long machineId;
@property (strong, nonatomic) NSString *machineName;
@property (strong, nonatomic) NSString *machineDescription;
@property (assign, nonatomic) int noiseLevel;
@property (assign, nonatomic) int totalHours;

+ (void)getEmployeeActivityInformation:(NSString *)identifier withBlock:(void (^)(NSArray *employeeActivities, NSError *error))block;

@end
