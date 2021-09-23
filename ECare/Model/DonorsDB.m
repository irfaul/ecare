//
//  DonorsDB.m
//  ECare
//
//  Created by iei19100004 on 21/09/21.
//

#import "DonorsDB.h"
#import <sqlite3.h>

@implementation DonorsDB

@synthesize donorsdata,strmain,reqdata;


-(id)init{

    appdel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    strmain = appdel.strPath;
    
    return  self;
}

-(NSMutableArray *)showAllDonorsData:(NSString *)query {
    donorsdata = [[NSMutableArray alloc]init];
    
    //open
    if (sqlite3_open([strmain UTF8String], &database) == SQLITE_OK) {
        sqlite3_stmt *connection;
        
        //prepare
        if(sqlite3_prepare_v2(database, [query UTF8String], -1, &connection, nil) == SQLITE_OK){
            
            //setup
            while (sqlite3_step(connection) == SQLITE_ROW) {
                NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
                
                NSString *name = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 2)];
                
                NSString *dept = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 3)];
                
                NSString *bloodtype = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 4)];
                
                NSString *gender = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 5)];
                
                NSString *age = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 6)];
                
                NSString *contactperson = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 7)];
                
                NSString *available = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 8)];
                
                NSString *submitdate = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 9)];
                
                [dict setObject:name forKey:@"name"];
                [dict setObject:dept forKey:@"dept"];
                [dict setObject:bloodtype forKey:@"bloodtype"];
                [dict setObject:gender forKey:@"gender"];
                [dict setObject:age forKey:@"age"];
                [dict setObject:contactperson forKey:@"contactperson"];
                [dict setObject:available forKey:@"available"];
                [dict setObject:submitdate forKey:@"submitdate"];
                
                [donorsdata addObject:dict];
            }
            NSLog(@"db oke");
        }
        sqlite3_finalize(connection);
    }
    
    sqlite3_close(database);
    
    return donorsdata;
}

-(NSString *)countData:(NSString *)query {
    NSString *result;
    //open
    if (sqlite3_open([strmain UTF8String], &database) == SQLITE_OK) {
        sqlite3_stmt *connection;
        
        //prepare
        if(sqlite3_prepare_v2(database, [query UTF8String], -1, &connection, nil) == SQLITE_OK){
            
            //setup
            while (sqlite3_step(connection) == SQLITE_ROW) {
                
                result = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 0)];
            }
            NSLog(@"db oke");
        }
        sqlite3_finalize(connection);
    }
    
    sqlite3_close(database);
    
    return result;
}

-(NSMutableArray*)showReqData:(NSString *)query {
    reqdata = [[NSMutableArray alloc]init];
    
    //open
    if (sqlite3_open([strmain UTF8String], &database) == SQLITE_OK) {
        sqlite3_stmt *connection;
        
        //prepare
        if(sqlite3_prepare_v2(database, [query UTF8String], -1, &connection, nil) == SQLITE_OK){
            
            //setup
            while (sqlite3_step(connection) == SQLITE_ROW) {
                NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
                
                NSString *userid = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 1)];
                
                NSString *name = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 2)];
                
                NSString *dept = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 3)];
                
                NSString *bloodtype = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 4)];
                
                NSString *gender = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 5)];
                
                NSString *age = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 6)];
                
                NSString *contactperson = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 7)];
                
                NSString *userdpc = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 8)];
                
                NSString *userhp = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 9)];
                
                NSString *submitdate = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 10)];
                
                NSString *reqstatus = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 11)];
                
                NSString *donordate = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 12)];
                
                NSString *donorloc = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 13)];
                
                NSString *donorsname = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 14)];
                
                NSString *donorsdept = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 15)];
                
                NSString *donorscp = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 16)];
                
                NSString *notes = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 17)];
                
                [dict setObject:userid forKey:@"userid"];
                [dict setObject:name forKey:@"name"];
                [dict setObject:dept forKey:@"dept"];
                [dict setObject:bloodtype forKey:@"bloodtype"];
                [dict setObject:gender forKey:@"gender"];
                [dict setObject:age forKey:@"age"];
                [dict setObject:contactperson forKey:@"contactperson"];
                [dict setObject:userdpc forKey:@"userdpc"];
                [dict setObject:userhp forKey:@"userhp"];
                [dict setObject:submitdate forKey:@"submitdate"];
                [dict setObject:reqstatus forKey:@"reqstatus"];
                [dict setObject:donordate forKey:@"donordate"];
                [dict setObject:donorloc forKey:@"donorloc"];
                [dict setObject:donorsname forKey:@"donorsname"];
                [dict setObject:donorsdept forKey:@"donorsdept"];
                [dict setObject:donorscp forKey:@"donorscp"];
                [dict setObject:notes forKey:@"notes"];
                
                [reqdata addObject:dict];
            }
            NSLog(@"db oke");
        }
        sqlite3_finalize(connection);
    }
    
    sqlite3_close(database);
    
    return reqdata;
}

@end
