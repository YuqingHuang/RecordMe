//
// Created by Huang Yuqing on 12/9/13.
// Copyright (c) 2013 YQ. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface YQCurrentTaskExecute : NSObject

+ (instancetype)currentTaskExecute;

- (void)execute:(YQTask *)task;
@end