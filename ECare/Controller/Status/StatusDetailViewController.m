//
//  StatusDetailViewController.m
//  ECare
//
//  Created by iei19100004 on 20/09/21.
//

#import "StatusDetailViewController.h"
#import "util.h"

@interface StatusDetailViewController () <UIAdaptivePresentationControllerDelegate>

@end

@implementation StatusDetailViewController

@synthesize name,dept,bloodType,status,donordate,donorloc,donorsDept,donorsName,cpButtonView,notes,donorView,donorsView,detailModel,cpLabel,chevronView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Status Detail";
    self.tabBarController.tabBar.hidden = YES;
    
    self.view.backgroundColor = [UIColor systemGroupedBackgroundColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:self action:@selector(okBtn)];
    self.navigationController.navigationBar.barTintColor = [[util new] primaryColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.presentationController.delegate = self;
    [self.navigationController.navigationBar setTitleTextAttributes:
       @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [self setInitComponent];
    
}

- (void)setInitComponent{
    donorView.layer.masksToBounds = false;
    donorView.layer.cornerRadius = 15.0;
    
    donorsView.layer.cornerRadius = 8;
    donorsView.layer.masksToBounds = false;
    donorsView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    donorsView.layer.borderWidth = 1.0f;
    
    notes.layer.cornerRadius = 8;
    notes.layer.masksToBounds = false;
    notes.layer.borderColor = [UIColor lightGrayColor].CGColor;
    notes.layer.borderWidth = 1.0f;
    
    name.text = detailModel[0];
    dept.text = detailModel[1];
    bloodType.text = detailModel[2];
    status.text = detailModel[3];
    donordate.text = detailModel[4];
    donorloc.text = detailModel[5];
    donorsName.text = detailModel[6];
    donorsDept.text = detailModel[7];
    notes.text = detailModel[9];
    
    if([detailModel[3] isEqual:@"Waiting"] || [detailModel[3] isEqual:@"Cancelled"]){
        cpButtonView.hidden = YES;
        chevronView.hidden = YES;
        cpLabel.text = @"-";
    }
    
    if([detailModel[3] isEqual:@"Waiting"]) {
        status.textColor = [UIColor darkGrayColor];
    } else if([detailModel[3] isEqual:@"Cancelled"]) {
        status.textColor = [UIColor redColor];
    } else if([detailModel[3] isEqual:@"Scheduled"]) {
        status.textColor = [UIColor colorWithRed:0.088 green:0.663 blue:0.318 alpha:1];
    }
}

- (void)okBtn {
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)cpBtn:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.whatsapp.com/send/?phone=%@&text&app_absent=0",detailModel[8]]] options:@{} completionHandler:nil];
}
@end
