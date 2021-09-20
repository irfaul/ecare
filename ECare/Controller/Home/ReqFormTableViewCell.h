//
//  DonorsFormTableViewCell.h
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import <UIKit/UIKit.h>
#import "ItemTableCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReqFormTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleItemLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueItemLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageItemLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageToPicker;


@property (nonatomic, retain) IBOutlet UITextField *formTextField;
@property (nonatomic, retain) IBOutlet UITextView *formDesc;

- (void) configureCell:(UIKeyboardType) type;
- (void) configureDate:(ItemTableCell*) item;
- (void) configureImageActivity;
- (void) configurePicker:(ItemTableCell*) item;
- (void) configureDesc;

@end

NS_ASSUME_NONNULL_END
