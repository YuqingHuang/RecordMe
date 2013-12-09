//
// Created by Huang Yuqing on 12/9/13.
// Copyright (c) 2013 YQ. All rights reserved.
//


#import "YQTask.h"
#import "YQEvent.h"


@implementation YQTask

- (id)initWithEvent:(YQEvent *)event {
    self = [super init];
    if (self) {
        _eventID = event.id;
        _content = event.content;
        _duration = event.estimatedDuration;
    }
    return self;
}
@end