#import "DBManager.h"
#import "YQEvent.h"

static DBManager *sharedInstance = nil;
static sqlite3 *database = nil;
static sqlite3_stmt *statement = nil;

@implementation DBManager

+ (DBManager *)getSharedInstance {
    if (!sharedInstance) {
        sharedInstance = [[self alloc] init];
        [sharedInstance createDB];
    }
    return sharedInstance;
}

- (BOOL)createDB {
    // Get the documents directory
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = dirPaths[0];
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"recordme.db"]];

    BOOL isSuccess = YES;
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if (![filemgr fileExistsAtPath:databasePath]) {
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
            char *errMsg;
            NSString *sql_stmt_str = [NSString stringWithFormat:@"create table if not exists %@ "
                    "(id integer primary key autoincrement, %@ text, %@ text, %@ text, %@ text, %@ text)", KEY_EVENT_TABLE, KEY_CONTENT, KEY_DATE, KEY_DURATION_ESTIMATED, KEY_DURATION_ACTUAL, KEY_STATUS];
            const char *sql_stmt = [sql_stmt_str UTF8String];
            if (sqlite3_exec(database, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
                isSuccess = NO;
                NSLog(@"Failed to create table");
            }
            sqlite3_close(database);
            return isSuccess;
        }
        else {
            isSuccess = NO;
            NSLog(@"Failed to open/create database");
        }
    }
    return isSuccess;
}

- (BOOL)createEventWithContent:(NSString *)content date:(NSString *)date estimatedDuration:(NSString *)duration actualDuration:(NSString *)acDuration status:(NSString *)status {
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into %@(%@, %@, %@, %@, %@) values"
                                                                 "(\"%@\", \"%@\", \"%@\", \"%@\", \"%@\")", KEY_EVENT_TABLE, KEY_CONTENT, KEY_DATE, KEY_DURATION_ESTIMATED, KEY_DURATION_ACTUAL, KEY_STATUS, content, date, duration, acDuration, status];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(database, insert_stmt, -1, &statement, NULL);

        int executeResult = sqlite3_step(statement);
        sqlite3_reset(statement);

        NSLog(@"insert new data %@", executeResult == SQLITE_DONE? @"Suc": @"Fail");
        return executeResult == SQLITE_DONE;
    }
    return NO;
}

- (NSArray *)allDataFromTable:(NSString * const)table {
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    const char *dbpath = [databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        NSString *querySQL = [NSString stringWithFormat:@"select * from %@", table];
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(database, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW){
                [dataArray addObject:[YQEvent eventFromStatement:statement]];
            }
            sqlite3_reset(statement);
        } else {
            NSLog(@"error msg %s",sqlite3_errmsg(database));
        }
    }
    return dataArray;
}


- (BOOL)updateEvent:(NSString *)eventID withActualDuration:(NSString *)actualDuration eventStatus:(NSString *)status {
    const char *dbpath = [databasePath UTF8String];

    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        NSString *updateSQL = [NSString stringWithFormat:@"UPDATE %@ SET %@=\"%@\", %@=\"%@\" where id=\"%@\" ", KEY_EVENT_TABLE, KEY_DURATION_ACTUAL, actualDuration, KEY_STATUS, status, eventID];
        NSLog(@"update SQL is %@", updateSQL);
        const char *update_stmt = [updateSQL UTF8String];

        sqlite3_prepare_v2(database, update_stmt, -1, &statement, NULL);

        int executeResult = sqlite3_step(statement);
        return executeResult == SQLITE_DONE;
    }
    return NO;
}
@end
