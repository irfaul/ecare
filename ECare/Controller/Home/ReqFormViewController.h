//
//  DonorsFormViewController.h
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReqFormViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate, UINavigationControllerDelegate, UIAdaptivePresentationControllerDelegate>

@property (nonatomic, retain) IBOutlet UIDatePicker *datePicker;

@property (retain, nonatomic) UITextField *userName;
@property (retain, nonatomic) UITextField *userID;
@property (retain, nonatomic) UITextField *userDept;
@property (retain, nonatomic) UITextField *userBlood;
@property (retain, nonatomic) UITextField *userGender;
@property (retain, nonatomic) UITextField *userAge;
@property (retain, nonatomic) UITextField *userWeights;
@property (retain, nonatomic) UITextField *userWA;
@property (retain, nonatomic) UITextView *desc;

@end

NS_ASSUME_NONNULL_END
