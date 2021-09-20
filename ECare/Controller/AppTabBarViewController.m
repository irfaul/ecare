//
//  AppTabBarViewController.m
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import "AppTabBarViewController.h"
#import "HomeViewController.h"
#import "UpdatesViewController.h"
#import "StatusViewController.h"
#import "ProfileViewController.h"
#import "util.h"

@interface AppTabBarViewController ()

@end

@implementation AppTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [[UITabBar appearance] setTintColor:[[util new] secondaryColor]];
    [[UITabBar appearance] setUnselectedItemTintColor:[[util new] primaryColor]];
    CGFloat f = 10;
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[[util new] titleFont:&f]} forState:UIControlStateNormal];
    
    HomeViewController *firstController = [[HomeViewController alloc] init];
    UpdatesViewController *secondController = [[UpdatesViewController alloc] init];
    StatusViewController *thirdController = [[StatusViewController alloc] init];
    ProfileViewController *fourthController = [[ProfileViewController alloc] init];
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:firstController];
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:secondController];
    UINavigationController *thirdNav = [[UINavigationController alloc] initWithRootViewController:thirdController];
    UINavigationController *fourthNav = [[UINavigationController alloc] initWithRootViewController:fourthController];
    
    firstNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home" image:[UIImage systemImageNamed:@"house"] tag:0];
    secondNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Updates" image:[UIImage imageNamed:@"restore"] tag:1];
    thirdNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Status" image:[UIImage imageNamed:@"assignment"] tag:2];
    fourthNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Profile" image:[UIImage systemImageNamed:@"person.circle"] tag:3];
    
    self.viewControllers = [NSArray arrayWithObjects:firstNav, secondNav, thirdNav, fourthNav, nil];
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
