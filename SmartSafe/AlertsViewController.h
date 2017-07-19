//
//  SecondViewController.h
//  SmartSafe
//
//  Created by Lunayo on 07/02/2015.
//  Copyright (c) 2015 Lunayo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *alerts;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)cancelAlertUnwindSegueCallback:(UIStoryboardSegue *)segue;
- (void)reloadData;

@end

