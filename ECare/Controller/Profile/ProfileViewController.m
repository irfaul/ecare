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

CGFloat fSize1 = 20.0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Profile";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor],
       NSFontAttributeName:[[util new] titleFont:&fSize1]}];
    self.navigationController.navigationBar.barTintColor = [[util new] primaryColor];
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
