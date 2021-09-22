//
//  HomeViewController.m
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import "HomeViewController.h"
#import "ReqFormViewController.h"
#import "util.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

UIButton *btnReq;

@synthesize logoApp,titleLabel,reqBtnLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setInitComponent];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDarkContent;
}


- (void)setInitComponent {
    
    //welcome label
    titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"Welcome to";
    CGFloat fSize = 17;
    titleLabel.font = [[util new] titleFont:&fSize];
    titleLabel.textColor = [[util new] primaryColor];
    titleLabel.adjustsFontSizeToFitWidth = YES;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    //Image Logo
    logoApp = [[UIImageView alloc] init];
    logoApp.image = [UIImage imageNamed:@"ECare"];
    [logoApp.heightAnchor constraintEqualToConstant:55].active = true;
    [logoApp.widthAnchor constraintEqualToConstant:220].active = true;
    
    //StackView Logo
    UIStackView *stackViewLogo = [[UIStackView alloc] init];
    
    stackViewLogo.axis = UILayoutConstraintAxisVertical;
    stackViewLogo.distribution = UIStackViewDistributionEqualSpacing;
    stackViewLogo.alignment = UIStackViewAlignmentCenter;
    stackViewLogo.spacing = 20;
    
    [stackViewLogo addArrangedSubview:titleLabel];
    [stackViewLogo addArrangedSubview:logoApp];
    
    //button donors
    btnReq = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnReq setBackgroundColor:[UIColor whiteColor]];
    [btnReq setImage:[UIImage imageNamed:@"logoreq"] forState:UIControlStateNormal];
    [btnReq.heightAnchor constraintEqualToConstant:100].active = true;
    [btnReq.widthAnchor constraintEqualToConstant:100].active = true;
    btnReq.layer.cornerRadius = 8;
    btnReq.layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25].CGColor;
    btnReq.layer.shadowOffset = CGSizeMake(0, 1.0);
    btnReq.layer.shadowOpacity = 1.0;
    btnReq.layer.masksToBounds = false;
    [btnReq addTarget:self action:@selector(btnReqAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //request label
    reqBtnLabel = [[UILabel alloc] init];
    reqBtnLabel.text = @"Make a Plasma Request";
    reqBtnLabel.font = [[util new] titleFont:&fSize];
    reqBtnLabel.textColor = [[util new] primaryColor];
    reqBtnLabel.adjustsFontSizeToFitWidth = YES;
    reqBtnLabel.textAlignment = NSTextAlignmentCenter;
    
    //StackView Donors Button
    UIStackView *stackViewBtnReq = [[UIStackView alloc] init];
    
    stackViewBtnReq.axis = UILayoutConstraintAxisVertical;
    stackViewBtnReq.distribution = UIStackViewDistributionEqualSpacing;
    stackViewBtnReq.alignment = UIStackViewAlignmentCenter;
    stackViewBtnReq.spacing = 10;
    
    [stackViewBtnReq addArrangedSubview:reqBtnLabel];
    [stackViewBtnReq addArrangedSubview:btnReq];
    
    
    
    //StackView All
    UIStackView *stackView = [[UIStackView alloc] init];
    
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionFill;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.spacing = 120;
    
    [stackView addArrangedSubview:stackViewLogo];
    [stackView addArrangedSubview:stackViewBtnReq];
    
    stackView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:stackView];
 
 //Layout for Stack View
     [stackView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
     [stackView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = true;
    
}

- (void)btnReqAction:(UIButton *) sender{
    ReqFormViewController *reqForm = [[ReqFormViewController alloc] init];
    reqForm.delegate = self;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:reqForm];
    [self presentViewController:nav animated:YES completion:nil];
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
