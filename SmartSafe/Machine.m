//
//  Machine.m
//  SmartSafe
//
//  Created by Lunayo on 08/02/2015.
//  Copyright (c) 2015 Lunayo. All rights reserved.
//

#import "Machine.h"
#import "SmartSafeServices.h"

NSString * const kMachineUri = @"machine";

@implementation Machine

+ (Machine *)machineFromDictionary:(NSDictionary *)dict {
    Machine *machine = [[Machine alloc] init];
    [machine setIdentifier:[dict objectForKey:@"id"]];
    [machine setName:[dict objectForKey:@"name"]];
    [machine setMachineDescription:[dict objectForKey:@"description"]];
    [machine setLastMaintainence:[[dict objectForKey:@"lastMaintainence"] longValue]];
    [machine setNoiseLevel:[[dict objectForKey:@"noiseLevel"] intValue]];
    
    return machine;
}

+ (void)getMachineInformation:(void (^)(NSArray *, NSError *))block {
    SmartSafeServices *manager = [SmartSafeServices manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager GET:[kSmartSafeBaseUri stringByAppendingPathComponent:kMachineUri] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *machines = [[NSMutableArray alloc] init];
        if ([responseObject count] > 0) {
            for (NSDictionary *machine in responseObject) {
                [machines addObject:[Machine machineFromDictionary:machine]];
            }
        }
        
        block(machines, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        block(nil, error);
    }];
}

@end
