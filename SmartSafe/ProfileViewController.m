//
//  ProfileViewController.m
//  SmartSafe
//
//  Created by Lunayo on 08/02/2015.
//  Copyright (c) 2015 Lunayo. All rights reserved.
//

#import "ProfileViewController.h"
#import "Employee.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.lineChartView setDelegate:self];
    [self.lineChartView setDataSource:self];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Please Wait..."];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    
    [self loadEmployeeActivities];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods
- (void)refresh:(UIRefreshControl *)refreshControl
{
    [self loadEmployeeActivities];
    [refreshControl endRefreshing];
}

- (void)loadEmployeeActivities {
    [EmployeeActivity getEmployeeActivityInformation:[self.employee identifier] withBlock:^(NSArray *employeeActivities, NSError *error) {
        if ([employeeActivities count] > 0) {
            self.activities = employeeActivities;
            [self.tableView reloadData];
        }
    }];
}

#pragma mark - JBLineChartView delegates
- (NSUInteger)lineChartView:(JBLineChartView *)lineChartView numberOfVerticalValuesAtLineIndex:(NSUInteger)lineIndex {
    return 5;
}

- (NSUInteger)numberOfLinesInLineChartView:(JBLineChartView *)lineChartView {
    return 5;
}

- (CGFloat)lineChartView:(JBLineChartView *)lineChartView verticalValueForHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex
{
    return 5.0f;
}

#pragma mark - UITableView delegates
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"ProfileCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    EmployeeActivity *employeeActivity = [self.activities objectAtIndex:[indexPath row]];
    
    UILabel *name = (UILabel *)[cell viewWithTag:3];
    UILabel *hours = (UILabel *)[cell viewWithTag:4];
    UILabel *lastCheckedIn = (UILabel *)[cell viewWithTag:5];
    
    [name setText:[employeeActivity machineName]];
    [hours setText:[NSString stringWithFormat:@"Total hours used: %d", [employeeActivity totalHours]]];
    [lastCheckedIn setText:[NSString stringWithFormat:@"%d db", employeeActivity.noiseLevel]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.activities count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

@end
