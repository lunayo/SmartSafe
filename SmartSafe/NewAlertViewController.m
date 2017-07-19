//
//  NewAlertViewController.m
//  SmartSafe
//
//  Created by Lunayo on 08/02/2015.
//  Copyright (c) 2015 Lunayo. All rights reserved.
//

#import "NewAlertViewController.h"

@interface NewAlertViewController ()

@end

@implementation NewAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.alertType = @[@"Employee working hours", @"Machine noise level", @"Machine Working hours"];
    self.alertTreshold = @[@"Less than or equal to", @"Equal to", @"More than or equal to"];
    
    self.typePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
    [self.typePicker setDataSource: self];
    [self.typePicker setDelegate: self];
    self.typePicker.showsSelectionIndicator = YES;
    
    self.tresholdPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
    [self.tresholdPicker setDataSource: self];
    [self.tresholdPicker setDelegate: self];
    self.tresholdPicker.showsSelectionIndicator = YES;
    
    self.alertTypeTextField.inputView = self.typePicker;
    self.alertTresholdTextField.inputView = self.tresholdPicker;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}

#pragma mark - UIPicker delegates
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (pickerView == self.typePicker) {
        self.alertTypeTextField.text = [self.alertType objectAtIndex:row];
    } else {
        self.alertTresholdTextField.text = [self.alertTreshold objectAtIndex:row];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (pickerView == self.typePicker) {
        return [self.alertType objectAtIndex:row];
    } else {
        return [self.alertTreshold objectAtIndex:row];
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return  3;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

@end
