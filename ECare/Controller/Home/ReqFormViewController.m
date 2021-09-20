//
//  DonorsFormViewController.m
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import "ReqFormViewController.h"
#import "ReqFormTableViewCell.h"
#import "PickerViewController.h"
#import "util.h"
#import "ItemTableCell.h"

@interface ReqFormViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UITextViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIAdaptivePresentationControllerDelegate>

@end

@implementation ReqFormViewController

@synthesize delegate, formTableView, datePicker, datePickerVisible;

NSString *cellIdStatic = @"cellId";
NSString *nameText;
NSString *deptText;
NSString *bloodText;
NSString *genderText;
NSString *ageText;
NSString *weightText;
NSString *cpText;
NSString *descText;
NSArray *array;
int sizeExpandDate = 330;
ItemTableCell *itemTable;
ReqFormTableViewCell *cell;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Make A Request";
    self.tabBarController.tabBar.hidden = YES;
    
    self.view.backgroundColor = [UIColor systemGroupedBackgroundColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelReqForm)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStyleDone target:self action:NULL];
    self.navigationController.navigationBar.barTintColor = [[util new] primaryColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.presentationController.delegate = self;
    [self.navigationController.navigationBar setTitleTextAttributes:
       @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    formTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    formTableView.delegate = self;
    formTableView.dataSource = self;
    formTableView.showsHorizontalScrollIndicator = NO;
    formTableView.showsVerticalScrollIndicator = NO;
    [formTableView registerNib:[UINib nibWithNibName:@"ReqFormTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdStatic];
    
    itemTable = [[ItemTableCell alloc] init];
    cell.formDesc.delegate = self;
    
    [self setConstraint];
    [self setValueItemTableCell];
}

- (void)viewWillAppear:(BOOL)animated {
    datePickerVisible = NO;
    datePicker.hidden = YES;
    datePicker.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)hideKeyboard {
    [self.view endEditing:YES];
}

- (void)showDatePickerCell {
    datePickerVisible = YES;
    [formTableView beginUpdates];
    [formTableView endUpdates];
    datePicker.alpha = 0.0f;
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.datePicker.alpha = 1.0f;
                     } completion:^(BOOL finished){
                         self.datePicker.hidden = NO;
                     }];
    
}

- (void)hideDatePickerCell {
    datePickerVisible = NO;
    [formTableView beginUpdates];
    [formTableView endUpdates];
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.datePicker.alpha = 0.0f;
                     }
                     completion:^(BOOL finished){
                         self.datePicker.hidden = YES;
                     }];
}

- (void)cancelReqForm {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setValueItemTableCell {
    array = @[
        [[ItemTableCell alloc] initWithTitle:@"Pick date" fieldTitle:@"" value:@"" imageItemTable:@"calendar"],
        [[ItemTableCell alloc] initWithTitle:@"" fieldTitle:@"Dept." value:@"Select" imageItemTable:@""],
        [[ItemTableCell alloc] initWithTitle:@"" fieldTitle:@"Blood Type" value:@"Select" imageItemTable:@""],
        [[ItemTableCell alloc] initWithTitle:@"" fieldTitle:@"Gender" value:@"Select" imageItemTable:@""]
    ];
}

- (void)setConstraint {
    
    [self.view addSubview:formTableView];
    
    formTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [formTableView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [formTableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-40].active = YES;
    [formTableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20].active = YES;
    [formTableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20].active = YES;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *defaultSection = nil;
        if (section == 1) {
            return @"Date of Positive Covid-19";
        } else if (section == 2) {
            return @"Tell your health problems";
        }
    return defaultSection;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger defaultSection = 0;
    if (section == 0) {
        return 7;
    } else if(section == 1) {
        return 2;
    } else if (section == 2) {
        return 1;
    }
    return defaultSection;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = formTableView.rowHeight;
        if (indexPath.section == 1 && indexPath.row == 1){
            height = datePickerVisible ? sizeExpandDate : 0.0f;
        }
    return height;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (void)textFieldDidChangeNameText:(UITextField *)textField {
    nameText = textField.text;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    ReqFormTableViewCell *cell = [formTableView cellForRowAtIndexPath:indexPath];
    if ([nameText isEqual:@""]) {
        cell.formTextField.placeholder = @"Name";
    }
}

- (void)textFieldDidChangeCpText:(UITextField *)textField {
    cpText = textField.text;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:6 inSection:0];
    ReqFormTableViewCell *cell = [formTableView cellForRowAtIndexPath:indexPath];
    if ([cpText isEqual:@""]) {
        cell.formTextField.placeholder = @"WA Number";
    }
}

- (void)textFieldDidChangeAgeText:(UITextField *)textField {
    ageText = textField.text;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:4 inSection:0];
    ReqFormTableViewCell *cell = [formTableView cellForRowAtIndexPath:indexPath];
    if ([ageText isEqual:@""]) {
        cell.formTextField.placeholder = @"Age (Years Old)";
    }
}

- (void)textFieldDidChangeWeightText:(UITextField *)textField {
    weightText = textField.text;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:5 inSection:0];
    ReqFormTableViewCell *cell = [formTableView cellForRowAtIndexPath:indexPath];
    if ([weightText isEqual:@""]) {
        cell.formTextField.placeholder = @"Weights (Kg)";
    }
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"]) {
            [textView resignFirstResponder];
            return NO;
        }

    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    descText = textView.text;
    NSLog(@"userInput %@", descText);
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdStatic forIndexPath:indexPath];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.formTextField.delegate = self;
            [cell configureCell:UIKeyboardTypeDefault];
            [cell.formTextField addTarget:self action:@selector(textFieldDidChangeNameText:) forControlEvents:UIControlEventEditingChanged];
            if (nameText.length == 0 || [nameText isEqual:@""]) {
                cell.formTextField.placeholder = @"Name";
            } else {
                cell.formTextField.text = nameText;
            }
        }
        if (indexPath.row == 1) {
            itemTable = array[1];
            [cell configurePicker:itemTable];
        }
        if (indexPath.row == 2) {
            itemTable = array[2];
            [cell configurePicker:itemTable];
        }
        if (indexPath.row == 3) {
            itemTable = array[3];
            [cell configurePicker:itemTable];
        }
        if (indexPath.row == 4) {
            cell.formTextField.delegate = self;
            [cell configureCell:UIKeyboardTypeNumberPad];
            [cell.formTextField addTarget:self action:@selector(textFieldDidChangeAgeText:) forControlEvents:UIControlEventEditingChanged];
            if (ageText.length == 0 || [ageText isEqual:@""]) {
                cell.formTextField.placeholder = @"Age (Years Old)";
            } else {
                cell.formTextField.text = ageText;
            }
        }
        if (indexPath.row == 5) {
            cell.formTextField.delegate = self;
            [cell configureCell:UIKeyboardTypeNumberPad];
            [cell.formTextField addTarget:self action:@selector(textFieldDidChangeWeightText:) forControlEvents:UIControlEventEditingChanged];
            if (weightText.length == 0 || [weightText isEqual:@""]) {
                cell.formTextField.placeholder = @"Weights (Kg)";
            } else {
                cell.formTextField.text = weightText;
            }
        }
        if (indexPath.row == 6) {
            cell.formTextField.delegate = self;
            [cell configureCell:UIKeyboardTypePhonePad];
            [cell.formTextField addTarget:self action:@selector(textFieldDidChangeCpText:) forControlEvents:UIControlEventEditingChanged];
            if (cpText.length == 0 || [cpText isEqual:@""]) {
                cell.formTextField.placeholder = @"WA Number";
            } else {
                cell.formTextField.text = cpText;
            }
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            itemTable = array[0];
            [cell configureDate:itemTable];
        }
        if (indexPath.row == 1) {
            //cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [self setDateExpandable: cell];
            [cell configureImageActivity];
        }
    } else if (indexPath.section == 2) {
        [cell configureDesc];
        cell.formDesc.text = descText;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self hideKeyboard];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        
        if (indexPath.row == 1) {
            PickerViewController *pickerViewController = [[PickerViewController alloc] init];
            pickerViewController.delegate = self;
            pickerViewController.pickerLoc = 1;
            [self.navigationController pushViewController:pickerViewController animated:YES];
        }
        if (indexPath.row == 2) {
            PickerViewController *pickerViewController = [[PickerViewController alloc] init];
            pickerViewController.delegate = self;
            pickerViewController.pickerLoc = 2;
            [self.navigationController pushViewController:pickerViewController animated:YES];
        }
        if (indexPath.row == 3) {
            PickerViewController *pickerViewController = [[PickerViewController alloc] init];
            pickerViewController.delegate = self;
            pickerViewController.pickerLoc = 3;
            [self.navigationController pushViewController:pickerViewController animated:YES];
        }
        
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            if (datePickerVisible){
                    [self hideDatePickerCell];
            } else {
                    [self showDatePickerCell];
            }
        }
    }
}

- (void)setDateExpandable:(ReqFormTableViewCell *) cell {
    [formTableView beginUpdates];
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(8, 0, cell.contentView.bounds.size.width, sizeExpandDate)];
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
    [cell.contentView addSubview:datePicker];
    [datePicker reloadInputViews];
    [formTableView endUpdates];
}

- (void)onDatePickerValueChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *formatDate =[[NSDateFormatter alloc] init];
    [formatDate setDateFormat:@"dd MMM yyyy"];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
    ReqFormTableViewCell *cell = [formTableView cellForRowAtIndexPath:indexPath];
    cell.titleItemLabel.text = [formatDate stringFromDate:datePicker.date];
}

- (void)pickerData:(NSInteger) pickerInt pickerText:(NSString *) pickerText {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:pickerInt inSection:0];
    ReqFormTableViewCell *cell = [formTableView cellForRowAtIndexPath:indexPath];
    cell.valueItemLabel.text = pickerText;
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
