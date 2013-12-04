
#import <Foundation/Foundation.h>
#import <sqlite3.h>

static NSString *const KEY_CONTENT = @"content";

static NSString *const KEY_DATE = @"date";

static NSString *const KEY_STATUS = @"status";

static NSString *const KEY_DURATION_ESTIMATED= @"es_duration";

static NSString *const KEY_DURATION_ACTUAL= @"ac_duration";

static NSString *const KEY_EVENT_TABLE = @"events";

//several status types here
static NSString *const STATUS_NEW = @"NEW";

@interface DBManager : NSObject {
    NSString *databasePath;
}

+ (DBManager*)getSharedInstance;

- (BOOL)createDB;

- (BOOL)createData:(NSString *)id content:(NSString *)content date:(NSString *)date duration:(NSObject *)duration;
- (NSArray*)findByDate:(NSString*)date;

@end
