//
//  StatusViewController.m
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import "StatusViewController.h"
#import "ReqTableViewCell.h"
#import "util.h"

@interface StatusViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation StatusViewController

@synthesize reqTableView;

NSString *cellReqId = @"cellDonorsId";
UIButton *btnRefresh;
UILabel *refreshLabel;
UIStackView *stackViewBtnRefresh;
CGFloat fSize2 = 20.0;
CGFloat fSize3 = 13.0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Submission Status";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor],
       NSFontAttributeName:[[util new] titleFont:&fSize2]}];
    self.navigationController.navigationBar.barTintColor = [[util new] primaryColor];
    
    [self setInitComponent];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"DonorsDummy" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    reqData = dict[@"Request"];
}

- (void)setInitComponent {
    btnRefresh = [[UIButton alloc] init];
    [btnRefresh setBackgroundColor:[UIColor whiteColor]];
    [btnRefresh setImage:[UIImage imageNamed:@"replay"] forState:UIControlStateNormal];
    
    refreshLabel = [[UILabel alloc] init];
    refreshLabel.text = @"Refresh";
    refreshLabel.font = [[util new] titleFont:&fSize3];
    refreshLabel.textColor = [UIColor grayColor];
    refreshLabel.adjustsFontSizeToFitWidth = YES;
    refreshLabel.textAlignment = NSTextAlignmentCenter;
    
    //StackView Donors Button
    stackViewBtnRefresh = [[UIStackView alloc] init];
    
    stackViewBtnRefresh.axis = UILayoutConstraintAxisVertical;
    stackViewBtnRefresh.distribution = UIStackViewDistributionEqualSpacing;
    stackViewBtnRefresh.alignment = UIStackViewAlignmentCenter;
    stackViewBtnRefresh.spacing = 0;
    
    [stackViewBtnRefresh addArrangedSubview:btnRefresh];
    [stackViewBtnRefresh addArrangedSubview:refreshLabel];
    
    reqTableView = [[UITableView alloc] init];
    reqTableView.delegate = self;
    reqTableView.dataSource = self;
    reqTableView.separatorColor = [UIColor clearColor];
    reqTableView.showsHorizontalScrollIndicator = NO;
    reqTableView.showsVerticalScrollIndicator = NO;
    //reqTableView.rowHeight = 100;
    [reqTableView registerNib:[UINib nibWithNibName:@"ReqTableViewCell" bundle:nil] forCellReuseIdentifier:cellReqId];
    
    [self.view addSubview:stackViewBtnRefresh];
    [self.view addSubview:reqTableView];
    
    [self setConstraint];
}

- (void)setConstraint {
    stackViewBtnRefresh.translatesAutoresizingMaskIntoConstraints = NO;
    [btnRefresh.widthAnchor constraintEqualToConstant:80].active = YES;
    [btnRefresh.heightAnchor constraintEqualToConstant:32].active = YES;
    
    [stackViewBtnRefresh.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [stackViewBtnRefresh.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:10].active = YES;
    
    reqTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [reqTableView.topAnchor constraintEqualToAnchor:stackViewBtnRefresh.bottomAnchor constant:10].active = YES;
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
    
    cell.cardView.layer.masksToBounds = false;
    cell.cardView.layer.cornerRadius = 15.0;
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}



@end
