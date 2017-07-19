//
//  FirstViewController.h
//  SmartSafe
//
//  Created by Lunayo on 07/02/2015.
//  Copyright (c) 2015 Lunayo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"
#import "ProfileViewController.h"

@interface EmployeeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray* employees;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControl;

- (void)loadEmployeesInformation:(BOOL)filter;
- (IBAction)cancelSegueCallback:(UIStoryboardSegue *)segue;

@end

