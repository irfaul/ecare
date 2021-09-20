//
//  ItemTableCell.h
//  ECare
//
//  Created by iei19100004 on 14/09/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ItemTableCell : NSObject

@property(nonatomic, retain) NSString *dateTitle;
@property(nonatomic, retain) NSString *fieldTitle;
@property(nonatomic, retain) NSString *valuePicker;
@property(nonatomic, retain) NSString *imageItemTable;

-(id)initWithTitle: (NSString *)dateTitle
        fieldTitle: (NSString *)fieldTitle
             value: (NSString *)valuePicker
    imageItemTable: (NSString*) imageItemTable;

@end

NS_ASSUME_NONNULL_END
