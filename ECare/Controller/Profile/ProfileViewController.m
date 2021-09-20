//
//  ProfileViewController.m
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import "ProfileViewController.h"
#import "util.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

UIImageView *profilPict;
UILabel *nameLabel;
UILabel *deptLabel;
UILabel *ageLabel;
UILabel *ageValue;
UIView *ageView;
UILabel *genderLabel;
UILabel *genderValue;
UIView *genderView;
UILabel *bloodLabel;
UILabel *bloodValue;
UIView *bloodView;
UIStackView *stackViewTop;
UIStackView *stackViewBottom;
UIStackView *stackView;
CGFloat fSize1 = 17.0;
CGFloat fSize5 = 15.0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Profile";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor],
       NSFontAttributeName:[[util new] titleFont:&fSize1]}];
    self.navigationController.navigationBar.barTintColor = [[util new] primaryColor];
    
    [self setInitComponent];
}

- (void)setInitComponent {
    profilPict = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mason"]];
    profilPict.backgroundColor = [UIColor lightGrayColor];
    profilPict.layer.cornerRadius = profilPict.frame.size.height /4;
    profilPict.layer.masksToBounds = YES;
    profilPict.layer.borderWidth = 0;
    
    nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"Mason Greenwood";
    nameLabel.font = [[util new] titleFont:&fSize1];
    nameLabel.textColor = [[util new] primaryColor];
    nameLabel.adjustsFontSizeToFitWidth = YES;
    nameLabel.textAlignment = NSTextAlignmentCenter;
    
    deptLabel = [[UILabel alloc] init];
    deptLabel.text = @"F/W Design";
    deptLabel.font = [[util new] italicFont:&fSize1];
    deptLabel.textColor = [[util new] primaryColor];
    deptLabel.adjustsFontSizeToFitWidth = YES;
    deptLabel.textAlignment = NSTextAlignmentCenter;
    
    //StackView name and dept
    UIStackView *stackViewNameDept = [[UIStackView alloc] init];
    
    stackViewNameDept.axis = UILayoutConstraintAxisVertical;
    stackViewNameDept.distribution = UIStackViewDistributionEqualSpacing;
    stackViewNameDept.alignment = UIStackViewAlignmentCenter;
    stackViewNameDept.spacing = 5;
    
    [stackViewNameDept addArrangedSubview:nameLabel];
    [stackViewNameDept addArrangedSubview:deptLabel];
    
    //StackView top profile
    stackViewTop = [[UIStackView alloc] init];
    
    stackViewTop.axis = UILayoutConstraintAxisVertical;
    stackViewTop.distribution = UIStackViewDistributionEqualSpacing;
    stackViewTop.alignment = UIStackViewAlignmentCenter;
    stackViewTop.spacing = 30;
    
    [stackViewTop addArrangedSubview:profilPict];
    [stackViewTop addArrangedSubview:stackViewNameDept];
    
    ageLabel = [[UILabel alloc] init];
    ageLabel.text = @"Age";
    ageLabel.font = [[util new] regularFont:&fSize5];
    ageLabel.textColor = [[util new] primaryColor];
    ageLabel.adjustsFontSizeToFitWidth = YES;
    ageLabel.textAlignment = NSTextAlignmentLeft;
    
    ageValue = [[UILabel alloc] init];
    ageValue.text = @"19 Years Old";
    ageValue.font = [[util new] regularFont:&fSize5];
    ageValue.textColor = [UIColor grayColor];
    ageValue.adjustsFontSizeToFitWidth = YES;
    ageValue.textAlignment = NSTextAlignmentRight;
    
    ageView = [[UIView alloc] init];
    ageView.backgroundColor = [UIColor whiteColor];
    ageView.layer.cornerRadius = 5;
    ageView.layer.masksToBounds = false;
    ageView.layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25].CGColor;
    ageView.layer.shadowOffset = CGSizeMake(0, 1.0);
    ageView.layer.shadowOpacity = 1.0;
    
    [ageView addSubview:ageLabel];
    [ageView addSubview:ageValue];
    
    genderLabel = [[UILabel alloc] init];
    genderLabel.text = @"Gender";
    genderLabel.font = [[util new] regularFont:&fSize5];
    genderLabel.textColor = [[util new] primaryColor];
    genderLabel.adjustsFontSizeToFitWidth = YES;
    genderLabel.textAlignment = NSTextAlignmentLeft;
    
    genderValue = [[UILabel alloc] init];
    genderValue.text = @"Male";
    genderValue.font = [[util new] regularFont:&fSize5];
    genderValue.textColor = [UIColor grayColor];
    genderValue.adjustsFontSizeToFitWidth = YES;
    genderValue.textAlignment = NSTextAlignmentRight;
    
    genderView = [[UIView alloc] init];
    genderView.backgroundColor = [UIColor whiteColor];
    genderView.layer.cornerRadius = 5;
    genderView.layer.masksToBounds = false;
    genderView.layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25].CGColor;
    genderView.layer.shadowOffset = CGSizeMake(0, 1.0);
    genderView.layer.shadowOpacity = 1.0;
    
    [genderView addSubview:genderLabel];
    [genderView addSubview:genderValue];
    
    bloodLabel = [[UILabel alloc] init];
    bloodLabel.text = @"Blood Type";
    bloodLabel.font = [[util new] regularFont:&fSize5];
    bloodLabel.textColor = [[util new] primaryColor];
    bloodLabel.adjustsFontSizeToFitWidth = YES;
    bloodLabel.textAlignment = NSTextAlignmentLeft;
    
    bloodValue = [[UILabel alloc] init];
    bloodValue.text = @"A+";
    bloodValue.font = [[util new] regularFont:&fSize5];
    bloodValue.textColor = [UIColor grayColor];
    bloodValue.adjustsFontSizeToFitWidth = YES;
    bloodValue.textAlignment = NSTextAlignmentRight;
    
    bloodView = [[UIView alloc] init];
    bloodView.backgroundColor = [UIColor whiteColor];
    bloodView.layer.cornerRadius = 5;
    bloodView.layer.masksToBounds = false;
    bloodView.layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25].CGColor;
    bloodView.layer.shadowOffset = CGSizeMake(0, 1.0);
    bloodView.layer.shadowOpacity = 1.0;
    
    [bloodView addSubview:bloodLabel];
    [bloodView addSubview:bloodValue];
    
    //StackView bottom profile
    stackViewBottom = [[UIStackView alloc] init];
    
    stackViewBottom.axis = UILayoutConstraintAxisVertical;
    stackViewBottom.distribution = UIStackViewDistributionEqualSpacing;
    stackViewBottom.alignment = UIStackViewAlignmentFill;
    stackViewBottom.spacing = 15;
    
    [stackViewBottom addArrangedSubview:ageView];
    [stackViewBottom addArrangedSubview:genderView];
    [stackViewBottom addArrangedSubview:bloodView];
    
    //StackView All
    stackView = [[UIStackView alloc] init];
    
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionFill;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.spacing = 60;
    
    [stackView addArrangedSubview:stackViewTop];
    [stackView addArrangedSubview:stackViewBottom];
    
    [self.view addSubview:stackView];
    [self setConstraint];
}

- (void)setConstraint {
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [profilPict.widthAnchor constraintEqualToConstant:100].active = YES;
    [profilPict.heightAnchor constraintEqualToConstant:100].active = YES;
    [stackView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [stackView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    
    ageLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [ageLabel.centerYAnchor constraintEqualToAnchor:ageView.centerYAnchor].active = YES;
    [ageLabel.leadingAnchor constraintEqualToAnchor:ageView.leadingAnchor constant:12].active = YES;

    
    ageValue.translatesAutoresizingMaskIntoConstraints = NO;
    [ageValue.centerYAnchor constraintEqualToAnchor:ageView.centerYAnchor].active = YES;
    [ageValue.trailingAnchor constraintEqualToAnchor:ageView.trailingAnchor constant:-12].active = YES;
    
    [ageView.widthAnchor constraintEqualToConstant:self.view.bounds.size.width - 60].active = YES;
    [ageView.heightAnchor constraintEqualToConstant:45].active = YES;
    
    genderLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [genderLabel.centerYAnchor constraintEqualToAnchor:genderView.centerYAnchor].active = YES;
    [genderLabel.leadingAnchor constraintEqualToAnchor:genderView.leadingAnchor constant:12].active = YES;

    
    genderValue.translatesAutoresizingMaskIntoConstraints = NO;
    [genderValue.centerYAnchor constraintEqualToAnchor:genderView.centerYAnchor].active = YES;
    [genderValue.trailingAnchor constraintEqualToAnchor:genderView.trailingAnchor constant:-12].active = YES;
    
    [genderView.widthAnchor constraintEqualToConstant:self.view.bounds.size.width - 60].active = YES;
    [genderView.heightAnchor constraintEqualToConstant:45].active = YES;
    
    bloodLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [bloodLabel.centerYAnchor constraintEqualToAnchor:bloodView.centerYAnchor].active = YES;
    [bloodLabel.leadingAnchor constraintEqualToAnchor:bloodView.leadingAnchor constant:12].active = YES;

    
    bloodValue.translatesAutoresizingMaskIntoConstraints = NO;
    [bloodValue.centerYAnchor constraintEqualToAnchor:bloodView.centerYAnchor].active = YES;
    [bloodValue.trailingAnchor constraintEqualToAnchor:bloodView.trailingAnchor constant:-12].active = YES;
    
    [bloodView.widthAnchor constraintEqualToConstant:self.view.bounds.size.width - 60].active = YES;
    [bloodView.heightAnchor constraintEqualToConstant:45].active = YES;
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
