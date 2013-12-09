//
//  YQListViewController.m
//  RecordMe
//
//  Created by Huang Yuqing on 11/26/13.
//  Copyright (c) 2013 YQ. All rights reserved.
//

#import "YQListViewController.h"
#import "YQEventDBConnector.h"
#import "YQEvent.h"
#import "YQStatusImageView.h"

@implementation YQListViewController {
    NSArray *_array;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {        
        _array = [YQEventDBConnector eventsList];
//  @[@"1st line", @"2nd line", @"3rd line"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#pragma table view data source methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"[YQ] number of events from DB is: %d", _array.count);
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];
    swipeRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [cell addGestureRecognizer:swipeRecognizer];
    
    YQEvent *cellEvent = _array[(NSUInteger) indexPath.row];
    cell.textLabel.text = cellEvent.content;
    cell.accessoryView = [[YQStatusImageView alloc] initWithImage:[UIImage imageNamed:cellEvent.statusImageName]];

    return cell;
}

- (void)swipeCell:(id)sender {

    NSLog(@"I'm swiping cell");
    
    //start to finish this task
    
    
}


@end
