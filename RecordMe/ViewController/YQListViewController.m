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
#import "YQCurrentTaskExecute.h"
#import "YQTask.h"

@implementation YQListViewController {
    NSArray *_array;
    NSIndexPath *_swipedIndexPath;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {        
        _array = [YQEventDBConnector eventsList];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#pragma alert view delegate methods
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [self continueButtonOfAlertViewClicked];
    }
}

- (void)continueButtonOfAlertViewClicked {
    YQEvent *event = [self _swipedEvent];
    YQTask *task = [[YQTask alloc] initWithEvent:event];
    [[YQCurrentTaskExecute currentTaskExecute] execute:task];
    
    [self.navigationController popViewControllerAnimated:YES];
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

- (void)swipeCell:(UISwipeGestureRecognizer *)sender {

    NSLog(@"I'm swiping cell");
    [self setSwipedIndexPathAfterSwiping:sender];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Finish Task" message:@"Start to finish it?" delegate:self cancelButtonTitle:@"NO :(" otherButtonTitles:@"YEP!", nil];
    [alert show];
}

#pragma private methods
- (void)setSwipedIndexPathAfterSwiping:(UISwipeGestureRecognizer *)swipeGesture {
    CGPoint location = [swipeGesture locationInView:_eventList];
    _swipedIndexPath = [_eventList indexPathForRowAtPoint:location];
}

- (YQEvent *)_swipedEvent {
    return _array[(NSUInteger) _swipedIndexPath.row];
}
@end
