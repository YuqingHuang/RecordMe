//
// Created by Huang Yuqing on 12/9/13.
// Copyright (c) 2013 YQ. All rights reserved.
//


#import "YQCurrentTaskExecute.h"
#import "YQTask.h"
#import "YQEventDBConnector.h"


@implementation YQCurrentTaskExecute {
    int _secondsLeft;
    BOOL _timeLeftFlag;
    NSTimer *_timer;
    YQTask *_task;
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
    _task = task;
    _secondsLeft = [_task.duration intValue] * 60;
    _timeLeftFlag = YES;

    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:START_TASK_NOTIFICATION object:nil];
}

- (void)tick {
    _secondsLeft --;
    if (_secondsLeft == 0) {
        _timeLeftFlag = NO;
    }

    [[NSNotificationCenter defaultCenter] postNotificationName:TIME_GOES_BY_NOTIFICATION object:[self countDownString]];
}

- (void)stopTimer {
    [_timer invalidate];

    int secondSpent;
    if (_timeLeftFlag) {
        secondSpent = [_task.duration intValue] * 60 - _secondsLeft;
    } else {
        secondSpent = [_task.duration intValue] * 60 + _secondsLeft;
    }
    
    NSString *actualDuration = [self timeStringFromSecond:secondSpent withPrefix:@""];
    BOOL updateResult = [YQEventDBConnector finishEvent:_task.eventID withActualDuration:actualDuration];
}

- (NSString *)countDownString {
    NSString *prefix = _timeLeftFlag ? @" " : @"-";
    return [self timeStringFromSecond:_secondsLeft withPrefix:prefix];
}

- (NSString *)timeStringFromSecond:(int)second withPrefix:(NSString *)prefix {
    int minutePart = second / 60;
    int secondPart = second - minutePart * 60;
    return [NSString stringWithFormat:@"%@ %d : %d", prefix, minutePart, secondPart];
}

@end