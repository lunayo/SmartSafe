//
//  MachineViewController.h
//  SmartSafe
//
//  Created by Lunayo on 08/02/2015.
//  Copyright (c) 2015 Lunayo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MachineViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *machines;

@end
