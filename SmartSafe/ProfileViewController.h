//
//  ProfileViewController.h
//  SmartSafe
//
//  Created by Lunayo on 08/02/2015.
//  Copyright (c) 2015 Lunayo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JBChartView/JBLineChartView.h>
#import "EmployeeActivity.h"

@class Employee;
@interface ProfileViewController : UIViewController <JBLineChartViewDataSource, JBLineChartViewDelegate, UITableViewDataSource, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet JBLineChartView *lineChartView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *activities;
@property (strong, nonatomic) Employee *employee;

@end
