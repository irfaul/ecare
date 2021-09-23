//
//  DonorsDB.h
//  ECare
//
//  Created by iei19100004 on 21/09/21.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface DonorsDB : NSObject
{
    AppDelegate *appdel;
    sqlite3 *database;
}

-(NSMutableArray*)showAllDonorsData:(NSString *)query;
-(NSMutableArray*)showReqData:(NSString *)query;
-(NSString *)countData:(NSString *)query;

@property(strong,nonatomic) NSMutableArray *donorsdata;
@property(strong,nonatomic) NSMutableArray *reqdata;
@property(strong,nonatomic) NSString *strmain;

@end

NS_ASSUME_NONNULL_END
