//
// Created by Huang Yuqing on 11/28/13.
// Copyright (c) 2013 YQ. All rights reserved.
//


#import "DBManager.h"
#import "YQEvent.h"

@implementation YQEvent

- (instancetype)initWithDate:(NSString *)date content:(NSString *)content estimatedDuration:(NSString *)estimatedDuration {
    self = [super init];
    if (self) {
        self.date = date;
        self.content = content;
        self.estimatedDuration = estimatedDuration;
        self.actualDuration = @"0";
        self.status = STATUS_NEW;
    }

    return self;
}

- (id)initWithId:(NSString *)id date:(NSString *)date content:(NSString *)content estimatedDuration:(NSString *)estimatedDuration actualDuration:(NSString *)actualDuration status:(NSString *)status {
    self = [super init];
    if (self) {
        self.id = id;
        self.date = date;
        self.content = content;
        self.estimatedDuration = estimatedDuration;
        self.actualDuration = actualDuration;
        self.status = status;
    }

    return self;
}

+ (YQEvent *)eventFromStatement:(sqlite3_stmt *)stmt {
    NSString *id = [NSString stringWithUTF8String:(char const *) sqlite3_column_text(stmt, 0)];
    NSString *content = [NSString stringWithUTF8String:(char const *) sqlite3_column_text(stmt, 1)];
    NSString *date = [NSString stringWithUTF8String:(char const *) sqlite3_column_text(stmt, 2)];
    NSString *estimatedDuration = [NSString stringWithUTF8String:(char const *) sqlite3_column_text(stmt, 3)];
    NSString *status = [NSString stringWithUTF8String:(char const *) sqlite3_column_text(stmt, 5)];
    NSString *actualDuration = [NSString stringWithUTF8String:(char const *) sqlite3_column_text(stmt, 4)];

    YQEvent *event = [[YQEvent alloc] initWithId:id date:date content:content estimatedDuration:estimatedDuration actualDuration:actualDuration status:status];
    return event;
}
@end