//
//  DonorsFormViewController.m
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import "ReqFormViewController.h"
#import "PickerViewController.h"
#import "util.h"
#import "DonorsDB.h"

@interface ReqFormViewController ()

@end

@implementation ReqFormViewController

@synthesize datePicker, userName, userID, userDept, userBlood, userGender, userAge, userWeights, userWA, userDate, desc, delegate;

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
UILabel *dateText;
UILabel *descText;
NSArray *array;
UIStackView *nameView;
UIStackView *idView;
UIStackView *deptView;
UIStackView *bloodTypeView;
UIStackView *genderTypeView;
UIStackView *ageUserView;
UIStackView *weightView;
UIStackView *cpView;
UIStackView *dateView;
UIStackView *descView;
UIStackView *fieldStack;
UIStackView *btnStack1;
UIStackView *btnStack2;
UIStackView *btnStack3;
UIGestureRecognizer *tapper;
UIButton *btnArrow1;
UIButton *btnArrow2;
UIButton *btnArrow3;
UIButton *datePickerBtn;
UIScrollView *scroll;
UIView *subView;
UIView *dateLabelView;
UIImageView *datepict;
UIToolbar *toolbar;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Make A Request";
    self.tabBarController.tabBar.hidden = YES;
    
    self.view.backgroundColor = [UIColor systemGroupedBackgroundColor];
    
//    self.modalPresentationStyle = UIModalPresentationFullScreen;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelReqForm)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStyleDone target:self action:@selector(submitReqForm)];
    self.navigationController.navigationBar.barTintColor = [[util new] primaryColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
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
    
    scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scroll.scrollEnabled=YES;
    scroll.userInteractionEnabled=YES;
    scroll.showsVerticalScrollIndicator=NO;
    scroll.contentSize = CGSizeMake(self.view.frame.size.width, 800);
    
    subView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, 800)];
    //subView.backgroundColor = [UIColor greenColor];
    
    [scroll addSubview:subView];
    
    CGFloat labelFont = 13.0;
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 20)];
    UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 20)];
    UIView *paddingView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 20)];
    UIView *paddingView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 20)];
    UIView *paddingView5 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 20)];
    
    //---------NAME VIEW---------------------------------------------------
    
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
    
    //---------ID VIEW---------------------------------------------------
    
    idText = [[UILabel alloc] init];
    idText.text = @"NIK";
    idText.font = [[util new] regularFont:&labelFont];
    idText.textColor = [UIColor darkGrayColor];
    idText.adjustsFontSizeToFitWidth = YES;
    idText.textAlignment = NSTextAlignmentLeft;

    userID = [[UITextField alloc] init];
    userID.placeholder = @"Type your NIK ...";
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
    [userDept setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
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
    [userGender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
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
    [userBlood setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
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
    
    //---------AGE VIEW---------------------------------------------------
    
    ageText = [[UILabel alloc] init];
    ageText.text = @"Age";
    ageText.font = [[util new] regularFont:&labelFont];
    ageText.textColor = [UIColor darkGrayColor];
    ageText.adjustsFontSizeToFitWidth = YES;
    ageText.textAlignment = NSTextAlignmentLeft;
    
    userAge = [[UITextField alloc] init];
    userAge.placeholder = @"Type your age ...";
    userAge.font = [[util new] regularFont:&labelFont];
    userAge.backgroundColor = [UIColor whiteColor];
    userAge.keyboardType = UIKeyboardTypeNumberPad;
    userAge.leftView = paddingView3;
    userAge.leftViewMode = UITextFieldViewModeAlways;
    
    ageUserView = [[UIStackView alloc] init];
    
    ageUserView.axis = UILayoutConstraintAxisVertical;
    ageUserView.distribution = UIStackViewDistributionEqualSpacing;
    ageUserView.alignment = UIStackViewAlignmentFill;
    ageUserView.spacing = 5;
    
    [ageUserView addArrangedSubview:ageText];
    [ageUserView addArrangedSubview:userAge];
    
    //---------WEIGHT VIEW---------------------------------------------------
    
    weightText = [[UILabel alloc] init];
    weightText.text = @"Weight";
    weightText.font = [[util new] regularFont:&labelFont];
    weightText.textColor = [UIColor darkGrayColor];
    weightText.adjustsFontSizeToFitWidth = YES;
    weightText.textAlignment = NSTextAlignmentLeft;

    userWeights = [[UITextField alloc] init];
    userWeights.placeholder = @"Type your weight ...";
    userWeights.font = [[util new] regularFont:&labelFont];
    userWeights.backgroundColor = [UIColor whiteColor];
    userWeights.keyboardType = UIKeyboardTypeNumberPad;
    userWeights.leftView = paddingView4;
    userWeights.leftViewMode = UITextFieldViewModeAlways;

    weightView = [[UIStackView alloc] init];
    
    weightView.axis = UILayoutConstraintAxisVertical;
    weightView.distribution = UIStackViewDistributionEqualSpacing;
    weightView.alignment = UIStackViewAlignmentFill;
    weightView.spacing = 5;
    
    [weightView addArrangedSubview:weightText];
    [weightView addArrangedSubview:userWeights];
    
    //---------CONTACT PERSON VIEW---------------------------------------------------
    
    cpText = [[UILabel alloc] init];
    cpText.text = @"WA Number";
    cpText.font = [[util new] regularFont:&labelFont];
    cpText.textColor = [UIColor darkGrayColor];
    cpText.adjustsFontSizeToFitWidth = YES;
    cpText.textAlignment = NSTextAlignmentLeft;

    userWA = [[UITextField alloc] init];
    userWA.placeholder = @"ex : (628xxxxxxxxxx)";
    userWA.font = [[util new] regularFont:&labelFont];
    userWA.backgroundColor = [UIColor whiteColor];
    userWA.keyboardType = UIKeyboardTypeNumberPad;
    userWA.leftView = paddingView5;
    userWA.leftViewMode = UITextFieldViewModeAlways;

    cpView = [[UIStackView alloc] init];
    
    cpView.axis = UILayoutConstraintAxisVertical;
    cpView.distribution = UIStackViewDistributionEqualSpacing;
    cpView.alignment = UIStackViewAlignmentFill;
    cpView.spacing = 5;
    
    [cpView addArrangedSubview:cpText];
    [cpView addArrangedSubview:userWA];
    
    //---------DATE PICKER------------------------------------------------------
    
    dateText = [[UILabel alloc] init];
    dateText.text = @"Date of Positive COVID-19";
    dateText.font = [[util new] regularFont:&labelFont];
    dateText.textColor = [UIColor darkGrayColor];
    dateText.adjustsFontSizeToFitWidth = YES;
    dateText.textAlignment = NSTextAlignmentLeft;
    
    userDate = [[UILabel alloc] init];
    userDate.text = @"-- Select Date --";
    userDate.font = [[util new] regularFont:&labelFont];
    userDate.backgroundColor = [UIColor whiteColor];
    userDate.userInteractionEnabled = NO;
    
    datePickerBtn = [[UIButton alloc] init];
    datePickerBtn.backgroundColor = [UIColor whiteColor];
    [datePickerBtn addTarget:self action:@selector(btnDatePicker)
     forControlEvents:UIControlEventTouchUpInside];
    
    [userDate bringSubviewToFront:datePickerBtn];
    
    datepict = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"calendar"]];
    
    dateLabelView = [[UIView alloc] init];
    dateLabelView.backgroundColor = [UIColor whiteColor];
    
    [dateLabelView addSubview:datepict];
    [dateLabelView addSubview:datePickerBtn];
    [dateLabelView addSubview:userDate];
    
    dateView = [[UIStackView alloc] init];
    
    dateView.axis = UILayoutConstraintAxisVertical;
    dateView.distribution = UIStackViewDistributionEqualSpacing;
    dateView.alignment = UIStackViewAlignmentFill;
    dateView.spacing = 5;
    
    [dateView addArrangedSubview:dateText];
    [dateView addArrangedSubview:dateLabelView];
    
    //---------HEALTH PROBLEM VIEW---------------------------------------------------
    
    descText = [[UILabel alloc] init];
    descText.text = @"Tell your health problem";
    descText.font = [[util new] regularFont:&labelFont];
    descText.textColor = [UIColor darkGrayColor];
    descText.adjustsFontSizeToFitWidth = YES;
    descText.textAlignment = NSTextAlignmentLeft;

    desc = [[UITextView alloc] init];
    desc.editable = YES;
    
    desc.font = [[util new] regularFont:&labelFont];
    desc.backgroundColor = [UIColor whiteColor];

    descView = [[UIStackView alloc] init];
    
    descView.axis = UILayoutConstraintAxisVertical;
    descView.distribution = UIStackViewDistributionEqualSpacing;
    descView.alignment = UIStackViewAlignmentFill;
    descView.spacing = 5;
    
    [descView addArrangedSubview:descText];
    [descView addArrangedSubview:desc];

    
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
    [fieldStack addArrangedSubview:ageUserView];
    [fieldStack addArrangedSubview:weightView];
    [fieldStack addArrangedSubview:cpView];
    [fieldStack addArrangedSubview:dateView];
    [fieldStack addArrangedSubview:descView];
    
    [subView addSubview:fieldStack];
    [self.view addSubview:scroll];
    
}

-(void)submitReqForm
{
    if ([userName.text  isEqual: @""] || [userID.text  isEqual: @""] || [userAge.text  isEqual: @""] || [userWeights.text  isEqual: @""] || [userWA.text  isEqual: @""] || [userGender.currentTitle isEqual:@""] || [userBlood.currentTitle isEqual:@""] || [userDate.text  isEqual: @"-- Select Date --"] || [userDept.currentTitle isEqual:@""]){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Can't process the request" message:@"Please complete the form" preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        
        NSString *strShow = [[NSString alloc] initWithFormat:@"INSERT INTO request (userid,name,dept,bloodtype,gender,age,contactperson,userdpc,userhp,submitdate,reqstatus) VALUES ('%@','%@','%@','%@','%@','%@','%@','%@','%@',datetime('now', 'localtime'),'Waiting')",userID.text,userName.text,userDept.currentTitle,userBlood.currentTitle,userGender.currentTitle,userAge.text,userWA.text,userDate.text,desc.text];
        DonorsDB *db = [[DonorsDB alloc] init];
        BOOL st = [db showAllDonorsData:strShow];

        if(st){
            NSLog(@"insert succees");
        }else{
            NSLog(@"insert failed");
        }
        [delegate isSubmitted:YES];
        
        UIAlertController * alert = [UIAlertController
                                         alertControllerWithTitle:@"Thanks for submitting"
                                         message:@"Please wait and check your Submission Status, we will give you confirmation soon"
                                         preferredStyle:UIAlertControllerStyleAlert];
            
            
            
        UIAlertAction* okButton = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                        [self dismissViewControllerAnimated:YES completion:nil];
                                  }];
            
        [alert addAction:okButton];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
}

-(void)updateLabel:(id)sender {
    
    userDate.text = [self formatDate:datePicker.date];
}

- (NSString *)formatDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"dd-MMM-yyyy"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
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

-(void)btnDatePicker {
    datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    if (@available(iOS 13.6, *)) {
        datePicker.preferredDatePickerStyle = UIDatePickerStyleWheels;
    }
    datePicker.backgroundColor = [UIColor whiteColor];
    datePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [datePicker setValue:[UIColor blackColor] forKey:@"textColor"];
    
    datePicker.frame = CGRectMake(0.0, [UIScreen mainScreen].bounds.size.height - 300, [UIScreen mainScreen].bounds.size.width, 300);
    [datePicker addTarget:self action:@selector(updateLabel:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datePicker];
    
    toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 300, [UIScreen mainScreen].bounds.size.width, 50)];
        toolbar.barStyle = UIBarStyleDefault;
        toolbar.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onDoneButtonClick)]];
    [toolbar sizeToFit];
    [self.view addSubview:toolbar];
}

-(void)onDoneButtonClick {
    [toolbar removeFromSuperview];
    [datePicker removeFromSuperview];
}

-(void)btnBlood {
    //Need to use an UIAlertController for iOS 8 instead of an action view
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Select Your Blood Type"
                                  message:@"\n\n\n\n\n\n\n\n"
                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    //Make a frame for the picker & then create the picker
    CGRect pickerFrame;
    CGFloat screenWidth = alert.view.layer.frame.size.width;
    
    if ( UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad ) {
        pickerFrame = CGRectMake(0, 10, 300, 200);
    } else {
        pickerFrame = CGRectMake(0, 50.0, screenWidth - 18.0, 150.0);
    }
    
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
    [alert setModalPresentationStyle:UIModalPresentationPopover];
    
    UIPopoverPresentationController *popPresenter = [alert
                                                  popoverPresentationController];
    popPresenter.sourceView = userBlood;
    popPresenter.sourceRect = userBlood.bounds;
    
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
    [alertGender setModalPresentationStyle:UIModalPresentationPopover];
    
    UIPopoverPresentationController *popPresenter = [alertGender
                                                  popoverPresentationController];
    popPresenter.sourceView = userGender;
    popPresenter.sourceRect = userGender.bounds;
    
    [self presentViewController:alertGender animated:YES completion:nil];
}

- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}

- (void)cancelReqForm {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *addAction = [UIAlertAction actionWithTitle:@"Discard Changes" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:addAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)setConstraint {
    
    fieldStack.translatesAutoresizingMaskIntoConstraints = NO;
    [fieldStack.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [fieldStack.topAnchor constraintEqualToAnchor:subView.topAnchor constant:12].active = YES;
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
    
    ageUserView.translatesAutoresizingMaskIntoConstraints = NO;
    [ageUserView.heightAnchor constraintEqualToConstant:55].active = YES;
    
    weightView.translatesAutoresizingMaskIntoConstraints = NO;
    [weightView.heightAnchor constraintEqualToConstant:55].active = YES;
    
    cpView.translatesAutoresizingMaskIntoConstraints = NO;
    [cpView.heightAnchor constraintEqualToConstant:55].active = YES;
    
    dateView.translatesAutoresizingMaskIntoConstraints = NO;
    [dateView.heightAnchor constraintEqualToConstant:55].active = YES;
    
    descView.translatesAutoresizingMaskIntoConstraints = NO;
    [descView.heightAnchor constraintEqualToConstant:100].active = YES;
    
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
    
    userAge.translatesAutoresizingMaskIntoConstraints = NO;
    [userAge.heightAnchor constraintEqualToConstant:35].active = YES;
    
    userWeights.translatesAutoresizingMaskIntoConstraints = NO;
    [userWeights.heightAnchor constraintEqualToConstant:35].active = YES;
    
    userWA.translatesAutoresizingMaskIntoConstraints = NO;
    [userWA.heightAnchor constraintEqualToConstant:35].active = YES;
    
    dateLabelView.translatesAutoresizingMaskIntoConstraints = NO;
    [dateLabelView.heightAnchor constraintEqualToConstant:35].active = YES;
    
    datepict.translatesAutoresizingMaskIntoConstraints = NO;
    [datepict.heightAnchor constraintEqualToConstant:25].active = YES;
    [datepict.widthAnchor constraintEqualToConstant:25].active = YES;
    [datepict.topAnchor constraintEqualToAnchor:dateLabelView.topAnchor constant:5].active = YES;
    [datepict.bottomAnchor constraintEqualToAnchor:dateLabelView.bottomAnchor constant:-5].active = YES;
    [datepict.leadingAnchor constraintEqualToAnchor:dateLabelView.leadingAnchor constant:8].active = YES;
    
    userDate.translatesAutoresizingMaskIntoConstraints = NO;
    [userDate.topAnchor constraintEqualToAnchor:dateLabelView.topAnchor].active = YES;
    [userDate.bottomAnchor constraintEqualToAnchor:dateLabelView.bottomAnchor].active = YES;
    [userDate.trailingAnchor constraintEqualToAnchor:dateLabelView.trailingAnchor].active = YES;
    [userDate.leadingAnchor constraintEqualToAnchor:datepict.trailingAnchor constant:8].active = YES;
    
    datePickerBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [datePickerBtn.topAnchor constraintEqualToAnchor:dateLabelView.topAnchor].active = YES;
    [datePickerBtn.bottomAnchor constraintEqualToAnchor:dateLabelView.bottomAnchor].active = YES;
    [datePickerBtn.trailingAnchor constraintEqualToAnchor:dateLabelView.trailingAnchor].active = YES;
    [datePickerBtn.leadingAnchor constraintEqualToAnchor:datepict.trailingAnchor constant:8].active = YES;
    
    desc.translatesAutoresizingMaskIntoConstraints = NO;
    [desc.heightAnchor constraintEqualToConstant:80].active = YES;
    
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
