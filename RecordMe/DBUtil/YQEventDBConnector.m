//
//  YQEventDBConnector.m
//  RecordMe
//
//  Created by Huang Yuqing on 12/5/13.
//  Copyright (c) 2013 YQ. All rights reserved.
//

#import "YQEventDBConnector.h"
#import "YQEvent.h"
#import "DBManager.h"

@implementation YQEventDBConnector

+ (void)saveEventToDB:(YQEvent *)event {
    [[DBManager getSharedInstance] createEventWithContent:event.content date:event.date estimatedDuration:event.estimatedDuration status:event.status];
}

+ (NSArray *)eventsList {
    [[DBManager getSharedInstance] allDataFromTable:KEY_EVENT_TABLE];
    return nil;
}
@end