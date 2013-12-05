//
//  YQAddEventViewController.m
//  RecordMe
//
//  Created by Huang Yuqing on 12/4/13.
//  Copyright (c) 2013 YQ. All rights reserved.
//

#import "YQAddEventViewController.h"
#import "YQEvent.h"
#import "YQEventDBConnector.h"

@implementation YQAddEventViewController {
    NSArray *_durationChoices;
}

#pragma UIPickerViewDataSource methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _durationChoices.count;
}

#pragma UIPickerViewDelegate methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _durationChoices[row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 20.f;
}

#pragma ViewController flow
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _durationChoices = @[@"20",@"30",@"40",@"50"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.duration selectRow:_durationChoices.count/2 inComponent:0 animated:NO];
}

- (IBAction)submit:(id)sender {
    NSString *theContent = self.content.text;
    NSString *theEstimatedDuration = _durationChoices[[self.duration selectedRowInComponent:0]];
    NSString *theDate = [self currentDate];

    YQEvent *event = [[YQEvent alloc] initWithDate:theDate content:theContent estimatedDuration:theEstimatedDuration];
    
    [YQEventDBConnector saveEventToDB:event];
}

- (NSString *)currentDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];

    return [formatter stringFromDate:[NSDate date]];
}

@end
