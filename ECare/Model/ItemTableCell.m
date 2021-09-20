//
//  ItemTableCell.m
//  ECare
//
//  Created by iei19100004 on 14/09/21.
//

#import "ItemTableCell.h"

@implementation ItemTableCell

@synthesize dateTitle, fieldTitle, valuePicker, imageItemTable;

-(id) initWithTitle:(NSString *)dateTitle
         fieldTitle: (NSString *)fieldTitle
              value: (NSString *)valuePicker
     imageItemTable:(NSString *)imageItemTable{
    self.dateTitle = dateTitle;
    self.fieldTitle = fieldTitle;
    self.valuePicker = valuePicker;
    self.imageItemTable = imageItemTable;
    return self;
}

@end
