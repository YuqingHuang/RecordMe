//
// Created by Huang Yuqing on 11/28/13.
// Copyright (c) 2013 YQ. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <sqlite3.h>

//several status types here
static NSString *const STATUS_NEW = @"NEW";

static NSString *const NEW_STATUS_IMAGE = @"new";

static NSString *const FINISHED_STATUS_IMAGE = @"finished";

@interface YQEvent : NSObject

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *estimatedDuration;
@property (nonatomic, strong) NSString *actualDuration;
@property (nonatomic, strong) NSString *status;

- (instancetype)initWithDate:(NSString *)date content:(NSString *)content estimatedDuration:(NSString *)estimatedDuration;

- (id)initWithId:(NSString *)id date:(NSString *)date content:(NSString *)content estimatedDuration:(NSString *)estimatedDuration actualDuration:(NSString *)actualDuration status:(NSString *)status;

+ (YQEvent *)eventFromStatement:(sqlite3_stmt *)stmt;

- (NSString *)statusImageName;
@end