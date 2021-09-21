//
//  DonorsDB.h
//  ECare
//
//  Created by iei19100004 on 21/09/21.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "DonorsDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DonorsDB : NSObject

@property(strong, nonatomic) NSString *strPath;
@property(nonatomic) sqlite3 *donorsDB;

-(NSMutableArray*)showAllDonorsData;

@property(strong,nonatomic) NSMutableArray *arrdata;
@property(strong,nonatomic) NSString *strmain;

@end

NS_ASSUME_NONNULL_END
