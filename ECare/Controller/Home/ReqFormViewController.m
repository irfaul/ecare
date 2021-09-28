//
//  DonorsFormViewController.m
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import "ReqFormViewController.h"
#import "PickerViewController.h"
#import "util.h"

@interface ReqFormViewController ()

@end

@implementation ReqFormViewController

@synthesize datePicker, userName, userID, userDept, userBlood, userGender, userAge, userWeights, userWA, desc;

UILabel *nameText;
UILabel *idText;
UILabel *bloodText;
NSString *genderText;
NSString *ageText;
NSString *weightText;
NSString *cpText;
NSString *descText;
NSArray *array;
UIStackView *nameView;
UIStackView *idView;
UIStackView *bloodTypeView;
UIStackView *fieldStack;
UIStackView *btnStack1;
UIGestureRecognizer *tapper;
UIView *paddingView4;
UIButton *btnArrow;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Make A Request";
    self.tabBarController.tabBar.hidden = YES;
    
    self.view.backgroundColor = [UIColor systemGroupedBackgroundColor];
    
    if (@available(iOS 13.0, *)) {
        [self setModalInPresentation:true];
    }
    
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelReqForm)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStyleDone target:self action:NULL];
    self.navigationController.navigationBar.barTintColor = [[util new] primaryColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.presentationController.delegate = self;
    [self.navigationController.navigationBar setTitleTextAttributes:
       @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
    [self setInitComponent];
    [self setConstraint];
}

-(void)setInitComponent {
    tapper = [[UITapGestureRecognizer alloc]
                    initWithTarget:self action:@selector(handleSingleTap:)];
    tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapper];
    
    CGFloat labelFont = 13.0;
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 20)];
    UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 20)];
    
    nameText = [[UILabel alloc] init];
    nameText.text = @"Name";
    nameText.font = [[util new] regularFont:&labelFont];
    nameText.textColor = [UIColor darkGrayColor];
    nameText.adjustsFontSizeToFitWidth = YES;
    nameText.textAlignment = NSTextAlignmentLeft;
    
    userName = [[UITextField alloc] init];
    userName.placeholder = @"Type your name ...";
    userName.font = [[util new] regularFont:&labelFont];
    userName.backgroundColor = [UIColor whiteColor];
    userName.leftView = paddingView1;
    userName.leftViewMode = UITextFieldViewModeAlways;
    
    nameView = [[UIStackView alloc] init];
    
    nameView.axis = UILayoutConstraintAxisVertical;
    nameView.distribution = UIStackViewDistributionEqualSpacing;
    nameView.alignment = UIStackViewAlignmentFill;
    nameView.spacing = 5;
    
    [nameView addArrangedSubview:nameText];
    [nameView addArrangedSubview:userName];
    
    idText = [[UILabel alloc] init];
    idText.text = @"ID";
    idText.font = [[util new] regularFont:&labelFont];
    idText.textColor = [UIColor darkGrayColor];
    idText.adjustsFontSizeToFitWidth = YES;
    idText.textAlignment = NSTextAlignmentLeft;

    userID = [[UITextField alloc] init];
    userID.placeholder = @"Type your ID ...";
    userID.font = [[util new] regularFont:&labelFont];
    userID.backgroundColor = [UIColor whiteColor];
    userID.keyboardType = UIKeyboardTypeNumberPad;
    userID.leftView = paddingView2;
    userID.leftViewMode = UITextFieldViewModeAlways;

    idView = [[UIStackView alloc] init];
    
    idView.axis = UILayoutConstraintAxisVertical;
    idView.distribution = UIStackViewDistributionEqualSpacing;
    idView.alignment = UIStackViewAlignmentFill;
    idView.spacing = 5;
    
    [idView addArrangedSubview:idText];
    [idView addArrangedSubview:userID];
    
    bloodText = [[UILabel alloc] init];
    bloodText.text = @"Blood Type";
    bloodText.font = [[util new] regularFont:&labelFont];
    bloodText.textColor = [UIColor darkGrayColor];
    bloodText.adjustsFontSizeToFitWidth = YES;
    bloodText.textAlignment = NSTextAlignmentLeft;
    
    userBlood = [[UIButton alloc] init];
    userBlood.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    userBlood.contentEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0);
    [userBlood setTitle: @"Select Your Blood Type" forState: UIControlStateNormal];
    userBlood.titleLabel.font = [[util new] regularFont:&labelFont];
    [userBlood setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    userBlood.backgroundColor = [UIColor whiteColor];
    [userBlood sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    
    btnArrow = [[UIButton alloc] init];
    btnArrow.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    btnArrow.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 8);
    [btnArrow setImage:[UIImage imageNamed:@"chevron"] forState:UIControlStateNormal];
    btnArrow.backgroundColor = [UIColor whiteColor];
    
    btnStack1 = [[UIStackView alloc] init];
    
    btnStack1.axis = UILayoutConstraintAxisHorizontal;
    btnStack1.distribution = UIStackViewDistributionFillEqually;
    btnStack1.alignment = UIStackViewAlignmentFill;
    btnStack1.spacing = 0;
    
    [btnStack1 addArrangedSubview:userBlood];
    [btnStack1 addArrangedSubview:btnArrow];
    
    
    bloodTypeView = [[UIStackView alloc] init];
    
    bloodTypeView.axis = UILayoutConstraintAxisVertical;
    bloodTypeView.distribution = UIStackViewDistributionEqualSpacing;
    bloodTypeView.alignment = UIStackViewAlignmentFill;
    bloodTypeView.spacing = 5;
    
    [bloodTypeView addArrangedSubview:bloodText];
    [bloodTypeView addArrangedSubview:btnStack1];
    
    fieldStack = [[UIStackView alloc] init];
    
    fieldStack.axis = UILayoutConstraintAxisVertical;
    fieldStack.distribution = UIStackViewDistributionEqualSpacing;
    fieldStack.alignment = UIStackViewAlignmentFill;
    fieldStack.spacing = 12;
    
    [fieldStack addArrangedSubview:nameView];
    [fieldStack addArrangedSubview:idView];
    [fieldStack addArrangedSubview:bloodTypeView];
    
    [self.view addSubview:fieldStack];
    
}

-(void) showBloodPicker
{
    PickerViewController *pickerViewController = [[PickerViewController alloc] init];
    pickerViewController.delegate = self;
    pickerViewController.pickerLoc = 1;
    [self.navigationController pushViewController:pickerViewController animated:YES];
}

- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}

- (void)cancelReqForm {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setConstraint {
    fieldStack.translatesAutoresizingMaskIntoConstraints = NO;
    [fieldStack.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [fieldStack.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:12].active = YES;
    [fieldStack.widthAnchor constraintEqualToConstant:self.view.bounds.size.width - 40].active = YES;
    
    nameView.translatesAutoresizingMaskIntoConstraints = NO;
    [nameView.heightAnchor constraintEqualToConstant:55].active = YES;
    
    idView.translatesAutoresizingMaskIntoConstraints = NO;
    [idView.heightAnchor constraintEqualToConstant:55].active = YES;
    
    bloodTypeView.translatesAutoresizingMaskIntoConstraints = NO;
    [bloodTypeView.heightAnchor constraintEqualToConstant:55].active = YES;
    
    userName.translatesAutoresizingMaskIntoConstraints = NO;
    [userName.heightAnchor constraintEqualToConstant:35].active = YES;
    
    userID.translatesAutoresizingMaskIntoConstraints = NO;
    [userID.heightAnchor constraintEqualToConstant:35].active = YES;
    
    btnStack1.translatesAutoresizingMaskIntoConstraints = NO;
    [btnStack1.heightAnchor constraintEqualToConstant:35].active = YES;
    
}

- (void)setDateExpandable {
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(8, 0, 400, 330)];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    if (@available(iOS 14.0, *)) {
        datePicker.preferredDatePickerStyle = UIDatePickerStyleInline;
    }
    [datePicker addTarget:self action:@selector(onDatePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    NSDate * now = [[NSDate alloc] init];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents * comps = [cal components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
    [comps setHour:23];
    [comps setMinute:59];
    [comps setSecond:59];
    NSDate * date = [cal dateFromComponents:comps];
    
    [datePicker setDate:date animated:TRUE];
    [datePicker reloadInputViews];
    
    
}

- (void)onDatePickerValueChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *formatDate =[[NSDateFormatter alloc] init];
    [formatDate setDateFormat:@"dd MMM yyyy"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
