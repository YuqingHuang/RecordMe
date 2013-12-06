//
//  YQListViewController.h
//  RecordMe
//
//  Created by Huang Yuqing on 11/26/13.
//  Copyright (c) 2013 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const cellIdentifier = @"eventCell";

static NSString *const NEW_STATUS_IMAGE = @"new";

static NSString *const FINISHED_STATUS_IMAGE = @"finished";

@interface YQListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *eventList;

@end
