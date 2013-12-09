//
// Created by Huang Yuqing on 12/9/13.
// Copyright (c) 2013 YQ. All rights reserved.
//


#import "YQCurrentTaskExecute.h"
#import "YQTask.h"


@implementation YQCurrentTaskExecute {
    int _secondsLeft;
    BOOL timeLeft;
}

+ (instancetype)currentTaskExecute {
    static YQCurrentTaskExecute *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}

- (void)execute:(YQTask *)task {
    _secondsLeft = [task.duration intValue] * 60;
    timeLeft = YES;
    
    NSTimer *theTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
}

- (NSString *)countDownString {
    int minutePart = _secondsLeft / 60;
    int secondPart = _secondsLeft - minutePart * 60;
    NSString *timeLeftFlag = timeLeft ? @" " : @"-";
    return [NSString stringWithFormat:@"%@ %d : %d", timeLeftFlag, minutePart, secondPart];
}

- (void)tick {
    _secondsLeft --;
    if ([self timeUp]) {
        timeLeft = NO;
    }
}

- (BOOL)timeUp {
    return _secondsLeft == 0;
}

@end