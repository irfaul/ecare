//
//  DonorsDB.m
//  ECare
//
//  Created by iei19100004 on 21/09/21.
//

#import "DonorsDB.h"
#import "DonorsDataModel.h"
#import <sqlite3.h>

@implementation DonorsDB

@synthesize strPath;
@synthesize arrdata,strmain;

char *errMsg;

-(id)init{

    strPath = @"/Users/iei19100004/Desktop/CalculatorPaul/ecare.db";
    
    const char *dbPath = [strPath UTF8String];

    if ([[NSFileManager defaultManager]fileExistsAtPath:strPath] == YES) {
        NSLog(@"File found");
        if (sqlite3_open(dbPath, &_donorsDB) == SQLITE_OK) {

            NSString *createDonorsTable = @"CREATE TABLE IF NOT EXISTS donors(donorsid INTEGER PRIMARY KEY AUTOINCREMENT, userid TEXT, name TEXT, dept TEXT, bloodtype TEXT, gender TEXT, age TEXT, contactperson TEXT, available TEXT, submitdate TEXT)";

            if (sqlite3_exec(_donorsDB, [createDonorsTable UTF8String], NULL, NULL, &errMsg) == SQLITE_OK) {
                NSLog(@"TABEL CREATED");
            } else {
                NSLog(@"Error while creating table : %s", errMsg);
            }
            sqlite3_close(_donorsDB);
        } else {
            NSLog(@"Failed to open database file");
        }
    } else {
        NSLog(@"File not found");

        //create a new database if not found
        [[NSFileManager defaultManager] createFileAtPath:strPath contents:NULL attributes:NULL];
    }
    return  self;
}

-(NSMutableArray *)showAllDonorsData {
    //strPath = @"/Users/iei19100004/Desktop/CalculatorPaul/ecare.db";
    
    NSMutableArray *retArr = [[NSMutableArray alloc] init];
    sqlite3_stmt *statement;
    const char *dbPath = [strPath UTF8String];
    
    if(sqlite3_open(dbPath, &_donorsDB) == SQLITE_OK) {
        NSString *strShow = @"select * from donors";
        
        const char *query = [strShow UTF8String];
        
        if(sqlite3_prepare_v2(_donorsDB, query, -1, &statement, NULL) == SQLITE_OK){
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                DonorsDataModel *donors = [[DonorsDataModel alloc] init];
                donors.donorsId = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)] intValue];
                donors.userId = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
                donors.name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)];
                donors.dept = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 3)];
                donors.bloodtype = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 4)];
                donors.gender = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 5)];
                donors.age = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 6)];
                donors.contactperson = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 7)];
                donors.available = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 8)];
                donors.submitdate = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 9)];
                [retArr addObject:donors];
                donors = nil;
            }
        } else { NSLog(@"Error get data"); }
        
        sqlite3_finalize(statement);
    }
    
    sqlite3_close(_donorsDB);
    
    return retArr;
}

@end
