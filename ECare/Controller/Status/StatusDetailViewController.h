//
//  StatusDetailViewController.h
//  ECare
//
//  Created by iei19100004 on 20/09/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StatusDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *dept;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *bloodType;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UILabel *donordate;
@property (weak, nonatomic) IBOutlet UILabel *donorloc;
@property (weak, nonatomic) IBOutlet UILabel *donorsName;
@property (weak, nonatomic) IBOutlet UILabel *donorsDept;
@property (weak, nonatomic) IBOutlet UIButton *cpButtonView;
@property (weak, nonatomic) IBOutlet UIButton *chevronView;
@property (weak, nonatomic) IBOutlet UITextView *notes;
@property (weak, nonatomic) IBOutlet UIView *donorView;
@property (weak, nonatomic) IBOutlet UIView *donorsView;
@property (weak, nonatomic) IBOutlet UILabel *cpLabel;

- (IBAction)cpBtn:(id)sender;

@property (strong, nonatomic) NSArray *detailModel;
@property(nonatomic, assign)id delegate;

@end

NS_ASSUME_NONNULL_END
