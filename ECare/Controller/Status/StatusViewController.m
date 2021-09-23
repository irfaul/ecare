//
//  StatusViewController.m
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import "StatusViewController.h"
#import "StatusDetailViewController.h"
#import "ReqTableViewCell.h"
#import "DonorsDB.h"
#import "util.h"

@interface StatusViewController ()

@end

@implementation StatusViewController

@synthesize reqTableView, refreshControl, arrMainData;

NSString *cellReqId = @"cellDonorsId";
UIStackView *stackViewBtnRefresh;
CGFloat fSize2 = 17.0;
CGFloat fSize3 = 13.0;
DonorsDB *dbreq;

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
}

- (void)viewDidAppear:(BOOL)animated{
    
    NSString *strShow = [[NSString alloc]initWithFormat:@"select * from request where userid = '19080024'"];
    
    dbreq = [[DonorsDB alloc]init];
    arrMainData = [[NSMutableArray alloc]init];
    arrMainData = [dbreq showReqData:strShow];
    
    [reqTableView reloadData];
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
    return arrMainData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ReqTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReqId forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *statusReq = [[NSString alloc] init];
    statusReq = [[arrMainData objectAtIndex:indexPath.row]objectForKey:@"reqstatus"];
    
    cell.reqName.text = [[arrMainData objectAtIndex:indexPath.row]objectForKey:@"name"];
    cell.reqDept.text = [[arrMainData objectAtIndex:indexPath.row]objectForKey:@"dept"];
    cell.reqBloodType.text = [[arrMainData objectAtIndex:indexPath.row]objectForKey:@"bloodtype"];
    cell.reqStatus.text = statusReq;
    cell.reqUpdates.text = [[arrMainData objectAtIndex:indexPath.row]objectForKey:@"submitdate"];
    
    cell.btnCancelView.layer.masksToBounds = false;
    cell.btnCancelView.layer.cornerRadius = 8.0;
    
    [cell.btnCancelView addTarget:self action:@selector(btnCancelUpdate:) forControlEvents:UIControlEventTouchUpInside];
    
    if([statusReq isEqual:@"Scheduled"] || [statusReq isEqual:@"Cancelled"]){
        cell.btnCancelView.hidden = YES;
    }
    
    if([statusReq isEqual:@"Waiting"]) {
        cell.reqStatus.textColor = [UIColor darkGrayColor];
    } else if([statusReq isEqual:@"Cancelled"]) {
        cell.reqStatus.textColor = [UIColor redColor];
    } else if([statusReq isEqual:@"Scheduled"]) {
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
    
//    NSDictionary *dict = reqData[myIndexPath.row];
    
    detail.detailModel = @[[[arrMainData objectAtIndex:myIndexPath.row]objectForKey:@"name"],
                           [[arrMainData objectAtIndex:myIndexPath.row]objectForKey:@"dept"],
                           [[arrMainData objectAtIndex:myIndexPath.row]objectForKey:@"bloodtype"],
                           [[arrMainData objectAtIndex:myIndexPath.row]objectForKey:@"reqstatus"],
                           [[arrMainData objectAtIndex:myIndexPath.row]objectForKey:@"donordate"],
                           [[arrMainData objectAtIndex:myIndexPath.row]objectForKey:@"donorloc"],
                           [[arrMainData objectAtIndex:myIndexPath.row]objectForKey:@"donorsname"],
                           [[arrMainData objectAtIndex:myIndexPath.row]objectForKey:@"donorsdept"],
                           [[arrMainData objectAtIndex:myIndexPath.row]objectForKey:@"donorscp"],
                           [[arrMainData objectAtIndex:myIndexPath.row]objectForKey:@"notes"]];
    
    
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
