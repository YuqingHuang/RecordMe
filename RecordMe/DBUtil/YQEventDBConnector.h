//
//  YQEventDBConnector.h
//  RecordMe
//
//  Created by Huang Yuqing on 12/5/13.
//  Copyright (c) 2013 YQ. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YQEvent;


@interface YQEventDBConnector : NSObject

+ (BOOL)saveEventToDB:(YQEvent *)event;

+ (NSArray *)eventsList;

+ (BOOL)finishEvent:(NSString *)id withActualDuration:(NSString *)actualDuration;
@end
