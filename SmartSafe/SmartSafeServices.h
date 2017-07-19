//
//  SmartSafeServices.h
//  SmartSafe
//
//  Created by Lunayo on 07/02/2015.
//  Copyright (c) 2015 Lunayo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

extern  NSString * const kSmartSafeBaseUri;

@interface SmartSafeServices : AFHTTPRequestOperationManager

+ (id)sharedInstances;

@end
