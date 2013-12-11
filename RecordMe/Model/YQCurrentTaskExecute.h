//
// Created by Huang Yuqing on 12/9/13.
// Copyright (c) 2013 YQ. All rights reserved.
//


#import <Foundation/Foundation.h>

@class YQTask;

static NSString *const TIME_GOES_BY_NOTIFICATION = @"TimeGoesBy";
static NSString *const START_TASK_NOTIFICATION = @"StartTask";

@interface YQCurrentTaskExecute : NSObject

+ (instancetype)currentTaskExecute;

- (void)execute:(YQTask *)task;

- (void)stopTimer;
@end