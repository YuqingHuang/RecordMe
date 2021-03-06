
#import <Foundation/Foundation.h>
#import <sqlite3.h>

static NSString *const KEY_CONTENT = @"content";

static NSString *const KEY_DATE = @"date";

static NSString *const KEY_STATUS = @"status";

static NSString *const KEY_DURATION_ESTIMATED= @"es_duration";

static NSString *const KEY_DURATION_ACTUAL= @"ac_duration";

static NSString *const KEY_EVENT_TABLE = @"events";

@interface DBManager : NSObject {
    NSString *databasePath;
}

+ (DBManager*)getSharedInstance;

- (BOOL)createEventWithContent:(NSString *)content date:(NSString *)date estimatedDuration:(NSString *)duration actualDuration:(NSString *)acDuration status:(NSString *)status;

- (NSArray *)allDataFromTable:(NSString * const)table;

- (BOOL)updateEvent:(NSString *)eventID withActualDuration:(NSString *)actualDuration eventStatus:(NSString *)status;
@end
