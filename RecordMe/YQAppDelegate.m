//
//  YQAppDelegate.m
//  RecordMe
//
//  Created by hyq on 11/24/13.
//  Copyright (c) 2013 YQ. All rights reserved.
//

#import "YQAppDelegate.h"
#import "YQMainViewController.h"
#import "YQCurrentTaskExecute.h"

@implementation YQAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];

    YQMainViewController *mainVC = [[YQMainViewController alloc] initWithNibName:@"YQMainViewController" bundle:nil];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mainVC];

    [self.window setRootViewController:navController];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    UIApplication *app = [UIApplication sharedApplication];
    
    //create new uiBackgroundTask
    __block UIBackgroundTaskIdentifier bgTask = [app beginBackgroundTaskWithExpirationHandler:^{
        [app endBackgroundTask:bgTask];
        bgTask = UIBackgroundTaskInvalid;
    }];
    
    //and create new timer with async call:
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSTimer scheduledTimerWithTimeInterval:1.0 target:[YQCurrentTaskExecute currentTaskExecute] selector:@selector(tick) userInfo:nil repeats:YES];

//        [[NSRunLoop currentRunLoop] addTimer:t forMode:NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop] run];
    });
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
