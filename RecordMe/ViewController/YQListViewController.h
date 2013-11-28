//
//  YQListViewController.h
//  RecordMe
//
//  Created by Huang Yuqing on 11/26/13.
//  Copyright (c) 2013 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const cellIdentifier = @"eventCell";

@interface YQListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *eventList;

@end
