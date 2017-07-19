//
//  SecondViewController.m
//  SmartSafe
//
//  Created by Lunayo on 07/02/2015.
//  Copyright (c) 2015 Lunayo. All rights reserved.
//

#import "AlertsViewController.h"

@interface AlertsViewController ()

@end

@implementation AlertsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.alerts = [NSMutableArray arrayWithArray:@[@"Lunaros has working for more than 54 hours", @"The electric driller has sudden spike noise level", @"Bulldozer has reached the treshold of 40 hours"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelAlertUnwindSegueCallback:(UIStoryboardSegue *)segue {
    
}

- (void)reloadData {
    [self.tableView reloadData];
}

#pragma mark - UITableView delegates
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"AlertCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    UILabel *title = (UILabel *)[cell viewWithTag:1];
    [title setText:[self.alerts objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self alerts] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.alerts removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}


@end
