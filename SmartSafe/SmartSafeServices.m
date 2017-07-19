//
//  SmartSafeServices.m
//  SmartSafe
//
//  Created by Lunayo on 07/02/2015.
//  Copyright (c) 2015 Lunayo. All rights reserved.
//

#import "SmartSafeServices.h"

NSString * const kSmartSafeBaseUri = @"http://192.168.2.32:9000/v1/";

@implementation SmartSafeServices

+ (instancetype)sharedInstances {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        
    });
    
    return sharedInstance;
}



@end
