//
//  FirstViewController.m
//  SmartSafe
//
//  Created by Lunayo on 07/02/2015.
//  Copyright (c) 2015 Lunayo. All rights reserved.
//

#import "EmployeeViewController.h"

@interface EmployeeViewController ()

@end

@implementation EmployeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Please Wait..."];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    
    [self loadEmployeesInformation:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods
- (void)refresh:(UIRefreshControl *)refreshControl
{
    [self loadEmployeesInformation:NO]; //call method
    [refreshControl endRefreshing];
}

- (void)loadEmployeesInformation:(BOOL)filter {
    [Employee getEmployeeInformation:^(NSArray *employees, NSError *error) {
        if (error == nil) {
            self.employees = employees;
            if (filter) {
                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"healthIssue != %@", @"Normal"];
                self.employees = [employees filteredArrayUsingPredicate:predicate];
            }
            [[self tableView] reloadData];
        }
    }];
}

#pragma mark - UISegment Control handler
- (IBAction)segmentControlDidValueChange:(id)sender {
    switch ([self.segmentControl selectedSegmentIndex]) {
        case 0:
            [self loadEmployeesInformation:NO];
            break;
        case 1:
            [self loadEmployeesInformation:YES];
            break;
        default:
            break;
    }
}

#pragma mark - UITableView delegates
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"EmployeeCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    Employee *employee = [self.employees objectAtIndex:[indexPath row]];
    
    UIView *healthIndicator = [cell viewWithTag:2];
    UILabel *name = (UILabel *)[cell viewWithTag:3];
    UILabel *hours = (UILabel *)[cell viewWithTag:4];
//    UILabel *lastCheckedIn = (UILabel *)[cell viewWithTag:5];
    
    [name setText:[employee name]];
    if ([[employee healthIssue] isEqualToString:@"Normal"]) {
        [healthIndicator setBackgroundColor:[UIColor greenColor]];
    } else{
        [healthIndicator setBackgroundColor:[UIColor orangeColor]];
    }
    [hours setText:[NSString stringWithFormat:@"Weekly working hours: %ld", [employee totalHours]]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self employees] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - Navigation segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showEmployeeDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ProfileViewController *destViewController = segue.destinationViewController;
        destViewController.employee = [self.employees objectAtIndex:indexPath.row];
    }
}

- (IBAction)cancelSegueCallback:(UIStoryboardSegue *)segue {
    
}

@end
