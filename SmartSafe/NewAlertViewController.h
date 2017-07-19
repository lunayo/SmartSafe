//
//  NewAlertViewController.h
//  SmartSafe
//
//  Created by Lunayo on 08/02/2015.
//  Copyright (c) 2015 Lunayo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewAlertViewController : UITableViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property(nonatomic, strong) NSArray *alertTreshold;
@property(nonatomic, strong) NSArray *alertType;
@property(nonatomic, strong) UIPickerView *tresholdPicker;
@property(nonatomic, strong) UIPickerView *typePicker;
@property (strong, nonatomic) IBOutlet UITextField *alertTypeTextField;
@property (strong, nonatomic) IBOutlet UITextField *alertTresholdTextField;

@end
