//
//  DonorsFormViewController.h
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReqFormViewController : UIViewController

@property(nonatomic, retain) UITableView *formTableView;
@property (nonatomic, retain) IBOutlet UIDatePicker *datePicker;
@property BOOL datePickerVisible;
@property(nonatomic, assign)id delegate;

@end

NS_ASSUME_NONNULL_END
