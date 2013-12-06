//
//  YQAddEventViewController.h
//  RecordMe
//
//  Created by Huang Yuqing on 12/4/13.
//  Copyright (c) 2013 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const SUC_SAVE_BUTTON_TITLE = @"Yeah";

static NSString *const FAIL_SAVE_BUTTON_TITLE = @"Try again";

static NSString *const SUC_SAVE_MESSAGE = @"Successfully";

static NSString *const FAIL_SAVE_MESSAGE = @"Failed";

@interface YQAddEventViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITextView *content;
@property (strong, nonatomic) IBOutlet UIPickerView *duration;
- (IBAction)submit:(id)sender;

@end
