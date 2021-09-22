//
//  StatusViewController.m
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import "StatusViewController.h"
#import "StatusDetailViewController.h"
#import "ReqTableViewCell.h"
#import "util.h"

@interface StatusViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation StatusViewController

@synthesize reqTableView, refreshControl;

NSString *cellReqId = @"cellDonorsId";
UIStackView *stackViewBtnRefresh;
CGFloat fSize2 = 17.0;
CGFloat fSize3 = 13.0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Submission Status";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor],
       NSFontAttributeName:[[util new] titleFont:&fSize2]}];
    self.navigationController.navigationBar.barTintColor = [[util new] primaryColor];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
    
    [self setInitComponent];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"DonorsDummy" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    reqData = dict[@"Request"];
}

- (void)setInitComponent {
    reqTableView = [[UITableView alloc] init];
    reqTableView.delegate = self;
    reqTableView.dataSource = self;
    reqTableView.separatorColor = [UIColor clearColor];
    reqTableView.showsHorizontalScrollIndicator = NO;
    reqTableView.showsVerticalScrollIndicator = NO;
    //reqTableView.rowHeight = 100;
    [reqTableView registerNib:[UINib nibWithNibName:@"ReqTableViewCell" bundle:nil] forCellReuseIdentifier:cellReqId];
    
    refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"Pull To Refresh"];
    [refreshControl addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];
    [reqTableView addSubview:refreshControl];

    [self.view addSubview:reqTableView];
    
    [self setConstraint];
}

-(void)refreshData {
       // Wait 1 sec before ending refreshing for testing
       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
           [self.reqTableView reloadData];
           [self.refreshControl endRefreshing];
       });
}

- (void)setConstraint {
    reqTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [reqTableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:10].active = YES;
    [reqTableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-20].active = YES;
    [reqTableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:10].active = YES;
    [reqTableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-10].active = YES;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = reqTableView.rowHeight;
    return height;
}

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return reqData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ReqTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReqId forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSDictionary *dict = reqData[indexPath.row];
    
    cell.reqName.text = dict[@"name"];
    cell.reqDept.text = dict[@"dept"];
    cell.reqBloodType.text = dict[@"bloodtype"];
    cell.reqStatus.text = dict[@"status"];
    cell.reqUpdates.text = dict[@"updates"];
    
    cell.btnCancelView.layer.masksToBounds = false;
    cell.btnCancelView.layer.cornerRadius = 8.0;
    
    [cell.btnCancelView addTarget:self action:@selector(btnCancelUpdate:) forControlEvents:UIControlEventTouchUpInside];
    
    if([dict[@"status"] isEqual:@"Scheduled"] || [dict[@"status"] isEqual:@"Cancelled"]){
        cell.btnCancelView.hidden = YES;
    }
    
    if([dict[@"status"] isEqual:@"Waiting"]) {
        cell.reqStatus.textColor = [UIColor darkGrayColor];
    } else if([dict[@"status"] isEqual:@"Cancelled"]) {
        cell.reqStatus.textColor = [UIColor redColor];
    } else if([dict[@"status"] isEqual:@"Scheduled"]) {
        cell.reqStatus.textColor = [UIColor colorWithRed:0.088 green:0.663 blue:0.318 alpha:1];
    }
    
    cell.cardView.layer.masksToBounds = false;
    cell.cardView.layer.cornerRadius = 15.0;
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    StatusDetailViewController *detail = [[StatusDetailViewController alloc] init];
    detail.delegate = self;
    NSIndexPath *myIndexPath = [tableView indexPathForSelectedRow];
    
    NSDictionary *dict = reqData[myIndexPath.row];
    
    detail.detailModel = @[dict[@"name"],
                           dict[@"dept"],
                           dict[@"bloodtype"],
                           dict[@"status"],
                           dict[@"donordate"],
                           dict[@"donorloc"],
                           dict[@"donorsname"],
                           dict[@"donorsdept"],
                           dict[@"donorscp"],
                           dict[@"notes"]];
    
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:detail];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)btnCancelUpdate:(UIButton *) sender{
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Do you want to do this action ?"
                                 message:@"You cannot undo this action."
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                    [self dismissViewControllerAnimated:YES completion:nil];
                               }];
    
    UIAlertAction* cancelButton = [UIAlertAction
                               actionWithTitle:@"Cancel"
                               style:UIAlertActionStyleCancel
                               handler:^(UIAlertAction * action) {
                                    [self dismissViewControllerAnimated:YES completion:nil];
                               }];
    
    [alert addAction:okButton];
    [alert addAction:cancelButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}



@end
