//
// Created by Huang Yuqing on 12/9/13.
// Copyright (c) 2013 YQ. All rights reserved.
//


#import <Foundation/Foundation.h>

@class YQEvent;


@interface YQTask : NSObject


@property (nonatomic) NSString *eventID;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *duration;


- (id)initWithEvent:(YQEvent *)event;
@end