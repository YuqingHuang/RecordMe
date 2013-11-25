//
//  YQMainViewController.m
//  RecordMe
//
//  Created by hyq on 11/24/13.
//  Copyright (c) 2013 YQ. All rights reserved.
//

#import "YQMainViewController.h"
#import "YQCircularImageView.h"
#import <RNGridMenu.h>

@interface YQMainViewController ()

@end

@implementation YQMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    YQCircularImageView *avatar = [[YQCircularImageView alloc] initWithImage:[UIImage imageNamed:@"avatar"] diameter:100];
    
    avatar.frame = CGRectMake(110, 165, avatar.frame.size.width, avatar.frame.size.height);
    avatar.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showGrid)];
    [avatar addGestureRecognizer:singleFingerTap];
    
    [self.view addSubview:avatar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showGrid {
    NSInteger numberOfOptions = 4;
    NSArray *items = @[[[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"calendar"] title:@" " action:^{[self displayList];}],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"add"] title:@" " action:^{[self addEvent];}],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"heart"] title:@" " action:^{}],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"settings"] title:@" " action:^{}]
                       ];
    
    RNGridMenu *av = [[RNGridMenu alloc] initWithItems:[items subarrayWithRange:NSMakeRange(0, numberOfOptions)]];
    av.delegate = self;
    //    av.bounces = NO;
    [av showInViewController:self center:CGPointMake(self.view.bounds.size.width/2.f, self.view.bounds.size.height/2.f)];
}

- (void)displayList {
    
}

- (void)addEvent {
    
}
@end
