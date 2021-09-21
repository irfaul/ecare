//
//  DonorsDataModel.h
//  ECare
//
//  Created by iei19100004 on 21/09/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DonorsDataModel : NSObject

@property (nonatomic) NSInteger donorsId;
@property (nonatomic, retain) NSString *userId;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *dept;
@property (nonatomic, retain) NSString *bloodtype;
@property (nonatomic, retain) NSString *gender;
@property (nonatomic, retain) NSString *age;
@property (nonatomic, retain) NSString *contactperson;
@property (nonatomic, retain) NSString *available;
@property (nonatomic, retain) NSString *submitdate;

-(id) initWithDonorsId: (NSInteger) donorsId
                userId: (NSString*) userId
                  name: (NSString*) name
                  dept: (NSString*) dept
             bloodtype: (NSString*) bloodtype
                gender: (NSString*) gender
                   age: (NSString*) age
         contactperson: (NSString*) contactperson
             available: (NSString*) available
            submitdate: (NSString*) submitdate;

@end

NS_ASSUME_NONNULL_END
