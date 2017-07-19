//
//  MachineViewController.m
//  SmartSafe
//
//  Created by Lunayo on 08/02/2015.
//  Copyright (c) 2015 Lunayo. All rights reserved.
//

#import "MachineViewController.h"
#import "Machine.h"

@interface MachineViewController ()

@end

@implementation MachineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Please Wait..."];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    [self loadMachinesInformation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods
- (void)refresh:(UIRefreshControl *)refreshControl
{
    [self loadMachinesInformation]; //call method
    [refreshControl endRefreshing];
}

- (void)loadMachinesInformation {
    [Machine getMachineInformation:^(NSArray *machines, NSError *error) {
        if (error == nil) {
            self.machines = machines;

            [[self tableView] reloadData];
        }
    }];
}

#pragma mark - UITableView delegates
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"MachineCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    Machine *machine = [self.machines objectAtIndex:[indexPath row]];
    
//    UIView *healthIndicator = [cell viewWithTag:2];
    UILabel *name = (UILabel *)[cell viewWithTag:3];
    //    UILabel *hours = (UILabel *)[cell viewWithTag:4];
    //    UILabel *lastCheckedIn = (UILabel *)[cell viewWithTag:5];
    
    [name setText:[machine name]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self machines] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end
