//
//  DonorsDataModel.m
//  ECare
//
//  Created by iei19100004 on 21/09/21.
//

#import "DonorsDataModel.h"

@implementation DonorsDataModel

@synthesize donorsId,userId,name,dept,bloodtype,gender,age,contactperson,available,submitdate;

-(id) initWithDonorsId: (NSInteger) donorsId
                userId: (NSString*) userId
                  name: (NSString*) name
                  dept: (NSString*) dept
             bloodtype: (NSString*) bloodtype
                gender: (NSString*) gender
                   age: (NSString*) age
         contactperson: (NSString*) contactperson
             available: (NSString*) available
            submitdate: (NSString*) submitdate {
    self.donorsId = donorsId;
    self.userId = userId;
    self.name = name;
    self.dept = dept;
    self.bloodtype = bloodtype;
    self.gender = gender;
    self.age = age;
    self.contactperson = contactperson;
    self.available = available;
    self.submitdate = submitdate;
    return self;
}
@end
