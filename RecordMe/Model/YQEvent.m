//
// Created by Huang Yuqing on 11/28/13.
// Copyright (c) 2013 YQ. All rights reserved.
//


#import "YQEvent.h"

@implementation YQEvent

- (instancetype)initWithDate:(NSString *)date content:(NSString *)content estimatedDuration:(NSString *)estimatedDuration {
    self = [super init];
    if (self) {
        self.date = date;
        self.content = content;
        self.estimatedDuration = estimatedDuration;
        self.status = STATUS_NEW;
    }

    return self;
}

@end