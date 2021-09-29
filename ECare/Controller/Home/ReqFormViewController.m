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
NSArray *arrayBlood;
NSString *selectedBlood;
UILabel *deptText;
UILabel *genderText;
UILabel *ageText;
UILabel *weightText;
UILabel *cpText;
UILabel *descText;
NSArray *array;
UIStackView *nameView;
UIStackView *idView;
UIStackView *deptView;
UIStackView *bloodTypeView;
UIStackView *genderTypeView;
UIStackView *fieldStack;
UIStackView *btnStack1;
UIStackView *btnStack2;
UIStackView *btnStack3;
UIGestureRecognizer *tapper;
UIView *paddingView4;
UIButton *btnArrow1;
UIButton *btnArrow2;
UIButton *btnArrow3;

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
    
    arrayBlood = @[@"A+",@"A-",@"B+",@"B-",@"AB+",@"AB-",@"O+",@"O-"];
    
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
    
    //---------DEPARTEMENT VIEW---------------------------------------------------
    
    deptText = [[UILabel alloc] init];
    deptText.text = @"Departement";
    deptText.font = [[util new] regularFont:&labelFont];
    deptText.textColor = [UIColor darkGrayColor];
    deptText.adjustsFontSizeToFitWidth = YES;
    deptText.textAlignment = NSTextAlignmentLeft;
    
    userDept = [[UIButton alloc] init];
    userDept.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    userDept.contentEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0);
    [userDept setTitle: @"-- Select --" forState: UIControlStateNormal];
    userDept.titleLabel.font = [[util new] regularFont:&labelFont];
    [userDept setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    userDept.backgroundColor = [UIColor whiteColor];
    [userDept addTarget:self action:@selector(btnDept)
     forControlEvents:UIControlEventTouchUpInside];
    
    btnArrow3 = [[UIButton alloc] init];
    btnArrow3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    btnArrow3.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 8);
    [btnArrow3 setImage:[UIImage imageNamed:@"chevron"] forState:UIControlStateNormal];
    btnArrow3.backgroundColor = [UIColor whiteColor];
    [btnArrow3 addTarget:self action:@selector(btnDept)
     forControlEvents:UIControlEventTouchUpInside];
    
    btnStack3 = [[UIStackView alloc] init];
    
    btnStack3.axis = UILayoutConstraintAxisHorizontal;
    btnStack3.distribution = UIStackViewDistributionFillEqually;
    btnStack3.alignment = UIStackViewAlignmentFill;
    btnStack3.spacing = 0;
    
    [btnStack3 addArrangedSubview:userDept];
    [btnStack3 addArrangedSubview:btnArrow3];
    
    
    deptView = [[UIStackView alloc] init];
    
    deptView.axis = UILayoutConstraintAxisVertical;
    deptView.distribution = UIStackViewDistributionEqualSpacing;
    deptView.alignment = UIStackViewAlignmentFill;
    deptView.spacing = 5;
    
    [deptView addArrangedSubview:deptText];
    [deptView addArrangedSubview:btnStack3];
    
    //---------GENDER VIEW------------------------------------------------------
    
    genderText = [[UILabel alloc] init];
    genderText.text = @"Gender";
    genderText.font = [[util new] regularFont:&labelFont];
    genderText.textColor = [UIColor darkGrayColor];
    genderText.adjustsFontSizeToFitWidth = YES;
    genderText.textAlignment = NSTextAlignmentLeft;
    
    userGender = [[UIButton alloc] init];
    userGender.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    userGender.contentEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0);
    [userGender setTitle: @"-- Select --" forState: UIControlStateNormal];
    userGender.titleLabel.font = [[util new] regularFont:&labelFont];
    [userGender setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    userGender.backgroundColor = [UIColor whiteColor];
    [userGender addTarget:self action:@selector(btnGender)
     forControlEvents:UIControlEventTouchUpInside];
    
    btnArrow1 = [[UIButton alloc] init];
    btnArrow1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    btnArrow1.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 8);
    [btnArrow1 setImage:[UIImage imageNamed:@"chevron"] forState:UIControlStateNormal];
    btnArrow1.backgroundColor = [UIColor whiteColor];
    [btnArrow1 addTarget:self action:@selector(btnGender)
     forControlEvents:UIControlEventTouchUpInside];
    
    btnStack1 = [[UIStackView alloc] init];
    
    btnStack1.axis = UILayoutConstraintAxisHorizontal;
    btnStack1.distribution = UIStackViewDistributionFillEqually;
    btnStack1.alignment = UIStackViewAlignmentFill;
    btnStack1.spacing = 0;
    
    [btnStack1 addArrangedSubview:userGender];
    [btnStack1 addArrangedSubview:btnArrow1];
    
    
    genderTypeView = [[UIStackView alloc] init];
    
    genderTypeView.axis = UILayoutConstraintAxisVertical;
    genderTypeView.distribution = UIStackViewDistributionEqualSpacing;
    genderTypeView.alignment = UIStackViewAlignmentFill;
    genderTypeView.spacing = 5;
    
    [genderTypeView addArrangedSubview:genderText];
    [genderTypeView addArrangedSubview:btnStack1];
    
    //---------BLOOD VIEW------------------------------------------------------
    
    bloodText = [[UILabel alloc] init];
    bloodText.text = @"Blood Type";
    bloodText.font = [[util new] regularFont:&labelFont];
    bloodText.textColor = [UIColor darkGrayColor];
    bloodText.adjustsFontSizeToFitWidth = YES;
    bloodText.textAlignment = NSTextAlignmentLeft;
    
    userBlood = [[UIButton alloc] init];
    userBlood.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    userBlood.contentEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0);
    [userBlood setTitle: @"-- Select --" forState: UIControlStateNormal];
    userBlood.titleLabel.font = [[util new] regularFont:&labelFont];
    [userBlood setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    userBlood.backgroundColor = [UIColor whiteColor];
    [userBlood addTarget:self action:@selector(btnBlood)
     forControlEvents:UIControlEventTouchUpInside];
    
    btnArrow2 = [[UIButton alloc] init];
    btnArrow2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    btnArrow2.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 8);
    [btnArrow2 setImage:[UIImage imageNamed:@"chevron"] forState:UIControlStateNormal];
    btnArrow2.backgroundColor = [UIColor whiteColor];
    [btnArrow2 addTarget:self action:@selector(btnBlood)
     forControlEvents:UIControlEventTouchUpInside];
    
    btnStack2 = [[UIStackView alloc] init];
    
    btnStack2.axis = UILayoutConstraintAxisHorizontal;
    btnStack2.distribution = UIStackViewDistributionFillEqually;
    btnStack2.alignment = UIStackViewAlignmentFill;
    btnStack2.spacing = 0;
    
    [btnStack2 addArrangedSubview:userBlood];
    [btnStack2 addArrangedSubview:btnArrow2];
    
    
    bloodTypeView = [[UIStackView alloc] init];
    
    bloodTypeView.axis = UILayoutConstraintAxisVertical;
    bloodTypeView.distribution = UIStackViewDistributionEqualSpacing;
    bloodTypeView.alignment = UIStackViewAlignmentFill;
    bloodTypeView.spacing = 5;
    
    [bloodTypeView addArrangedSubview:bloodText];
    [bloodTypeView addArrangedSubview:btnStack2];
    
    //---------STACK ALL COMPONENT---------------------------------------
    
    fieldStack = [[UIStackView alloc] init];
    
    fieldStack.axis = UILayoutConstraintAxisVertical;
    fieldStack.distribution = UIStackViewDistributionEqualSpacing;
    fieldStack.alignment = UIStackViewAlignmentFill;
    fieldStack.spacing = 12;
    
    [fieldStack addArrangedSubview:nameView];
    [fieldStack addArrangedSubview:idView];
    [fieldStack addArrangedSubview:deptView];
    [fieldStack addArrangedSubview:genderTypeView];
    [fieldStack addArrangedSubview:bloodTypeView];
    
    [self.view addSubview:fieldStack];
    
}

-(void) btnDept
{
    PickerViewController *pickerViewController = [[PickerViewController alloc] init];
    pickerViewController.delegate = self;
    [self.navigationController pushViewController:pickerViewController animated:YES];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
// Handle the selection
    selectedBlood = [NSString stringWithFormat:@"%@",[arrayBlood objectAtIndex:row]];
}
// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [arrayBlood count];
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {

    return [arrayBlood objectAtIndex: row];

}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    int sectionHeight = 40;

    return sectionHeight;
}


-(void)btnBlood {
    //Need to use an UIAlertController for iOS 8 instead of an action view
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Select Your Blood Type"
                                  message:@"\n\n\n\n\n\n\n\n"
                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    //Make a frame for the picker & then create the picker
    CGFloat screenWidth = alert.view.layer.frame.size.width;
    //CGFloat screenHeight = alert.view.layer.frame.size.height;
    CGRect pickerFrame = CGRectMake(0, 50.0, screenWidth - 18.0, 150.0);
    UIPickerView *bloodPicker = [[UIPickerView alloc] initWithFrame:pickerFrame];

    //There will be 3 pickers on this view so I am going to use the tag as a way
    //to identify them in the delegate and datasource
    bloodPicker.tag = 1;

    //set the pickers datasource and delegate
    bloodPicker.dataSource = self;
    bloodPicker.delegate = self;

    //Add the picker to the alert controller
    [alert.view addSubview:bloodPicker];
    
    //Add cancel button on UIAlertView
    UIAlertAction *btnCancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *btnSelect = [UIAlertAction actionWithTitle:@"Select" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.userBlood setTitle:selectedBlood
                        forState:UIControlStateNormal];
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alert addAction:btnCancel];
    [alert addAction:btnSelect];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)btnGender {
    UIAlertController *alertGender = [UIAlertController alertControllerWithTitle:@"Select your gender"
                                  message:@""
                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    //Add cancel button on UIAlertView
    UIAlertAction *btnCancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertGender dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *btnMale = [UIAlertAction actionWithTitle:@"Male" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.userGender setTitle:@"Male"
                        forState:UIControlStateNormal];
        [alertGender dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *btnFemale = [UIAlertAction actionWithTitle:@"Female" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.userGender setTitle:@"Female"
                        forState:UIControlStateNormal];
        [alertGender dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertGender addAction:btnCancel];
    [alertGender addAction:btnMale];
    [alertGender addAction:btnFemale];
    
    [self presentViewController:alertGender animated:YES completion:nil];
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
    
    deptView.translatesAutoresizingMaskIntoConstraints = NO;
    [deptView.heightAnchor constraintEqualToConstant:55].active = YES;
    
    genderTypeView.translatesAutoresizingMaskIntoConstraints = NO;
    [genderTypeView.heightAnchor constraintEqualToConstant:55].active = YES;
    
    bloodTypeView.translatesAutoresizingMaskIntoConstraints = NO;
    [bloodTypeView.heightAnchor constraintEqualToConstant:55].active = YES;
    
    userName.translatesAutoresizingMaskIntoConstraints = NO;
    [userName.heightAnchor constraintEqualToConstant:35].active = YES;
    
    userID.translatesAutoresizingMaskIntoConstraints = NO;
    [userID.heightAnchor constraintEqualToConstant:35].active = YES;
    
    btnStack1.translatesAutoresizingMaskIntoConstraints = NO;
    [btnStack1.heightAnchor constraintEqualToConstant:35].active = YES;
    
    btnStack2.translatesAutoresizingMaskIntoConstraints = NO;
    [btnStack2.heightAnchor constraintEqualToConstant:35].active = YES;
    
    btnStack3.translatesAutoresizingMaskIntoConstraints = NO;
    [btnStack3.heightAnchor constraintEqualToConstant:35].active = YES;
    
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
