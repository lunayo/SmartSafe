//
//  AppDelegate.m
//  SmartSafe
//
//  Created by Lunayo on 07/02/2015.
//  Copyright (c) 2015 Lunayo. All rights reserved.
//

#import "AppDelegate.h"
#import <TSMessages/TSMessage.h>
#import "EmployeeViewController.h"
#import "AlertsViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIUserNotificationType types = UIUserNotificationTypeBadge |
    UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    
    UIUserNotificationSettings *mySettings =
    [UIUserNotificationSettings settingsForTypes:types categories:nil];
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    [application registerForRemoteNotifications];
    
    return YES;
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    NSString *message = [[userInfo objectForKey:@"aps"] objectForKey:@"alert"];
    
    if ([message containsString:@"in / out"]) {
        [TSMessage showNotificationInViewController:self.window.rootViewController
                    title:nil
                    subtitle:message
                    image:nil
                    type:TSMessageNotificationTypeMessage
                    duration:2.0f
                    callback:^{
                        UITabBarController *tabbar = (UITabBarController *)self.window.rootViewController;
                        [tabbar setSelectedIndex:0];
                    } buttonTitle:nil
                    buttonCallback:nil
                    atPosition:TSMessageNotificationPositionTop
                    canBeDismissedByUser:YES];
        
        UITabBarController *tabbar = (UITabBarController *)self.window.rootViewController;
        EmployeeViewController *controller = [[[tabbar.viewControllers objectAtIndex:0] viewControllers] lastObject];
        [controller loadEmployeesInformation:NO];
    } else if ([message containsString:@"hours"]) {
        [TSMessage showNotificationInViewController:self.window.rootViewController
                                              title:nil
                                           subtitle:message
                                              image:nil
                                               type:TSMessageNotificationTypeMessage
                                           duration:2.0f
                                           callback:^{
                                               UITabBarController *tabbar = (UITabBarController *)self.window.rootViewController;
                                               [tabbar setSelectedIndex:2];
                                           } buttonTitle:nil
                                     buttonCallback:nil
                                         atPosition:TSMessageNotificationPositionTop
                               canBeDismissedByUser:YES];

        UITabBarController *tabbar = (UITabBarController *)self.window.rootViewController;
        AlertsViewController *controller = [[[tabbar.viewControllers objectAtIndex:2] viewControllers] lastObject];
        [[controller alerts] insertObject:message atIndex:0];
        [controller reloadData];
    }
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    NSLog(@"content---%@", token);   //this is the string
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
