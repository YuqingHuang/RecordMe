//
//  YQAddEventViewController.h
//  RecordMe
//
//  Created by Huang Yuqing on 12/4/13.
//  Copyright (c) 2013 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YQAddEventViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UITextView *content;
@property (strong, nonatomic) IBOutlet UIPickerView *duration;
- (IBAction)submit:(id)sender;

@end
