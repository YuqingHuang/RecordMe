//
//  YQMainViewController.h
//  RecordMe
//
//  Created by hyq on 11/24/13.
//  Copyright (c) 2013 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RNGridMenu.h"

@interface YQMainViewController : UIViewController<RNGridMenuDelegate>

@property (strong, nonatomic) IBOutlet UILabel *countDown;
@property (strong, nonatomic) IBOutlet UIButton *stopButton;

- (IBAction)stopTask:(id)sender;

@end
