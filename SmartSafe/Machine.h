//
//  Machine.h
//  SmartSafe
//
//  Created by Lunayo on 08/02/2015.
//  Copyright (c) 2015 Lunayo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Machine : NSObject

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *machineDescription;
@property (assign, nonatomic) long lastMaintainence;
@property (assign, nonatomic) int noiseLevel;

+ (void)getMachineInformation:(void(^)(NSArray *machines, NSError *error))block;

@end
