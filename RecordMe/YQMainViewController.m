//
//  YQMainViewController.m
//  RecordMe
//
//  Created by hyq on 11/24/13.
//  Copyright (c) 2013 YQ. All rights reserved.
//

#import "YQMainViewController.h"
#import "YQCircularImageView.h"
#import "YQListViewController.h"
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
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
    NSArray *items = @[[[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"arrow"] title:@"List" action:^{[self displayList];}],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"enter"] title:@"Add" action:^{[self addEvent];}],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"download"] title:@"Emm" action:^{}],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"cube"] title:@"Settings" action:^{}]
                       ];
    
    RNGridMenu *av = [[RNGridMenu alloc] initWithItems:[items subarrayWithRange:NSMakeRange(0, numberOfOptions)]];
    av.delegate = self;
    //    av.bounces = NO;
    [av showInViewController:self center:CGPointMake(self.view.bounds.size.width/2.f, self.view.bounds.size.height/2.f)];
}

- (void)displayList {
    YQListViewController *listVC = [[YQListViewController alloc] initWithNibName:@"YQListViewController" bundle:nil];
    [self.navigationController pushViewController:listVC animated:YES];
}

- (void)addEvent {
    
}
@end
