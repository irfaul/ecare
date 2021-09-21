//
//  UpdatesViewController.m
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import "UpdatesViewController.h"
#import "DonorsTableViewCell.h"
#import "DonorsDataModel.h"
#import "DonorsDB.h"
#import "util.h"

@interface UpdatesViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation UpdatesViewController

@synthesize segmentedControl, donorsTableView, items;

NSString *cellDonorsId = @"cellDonorsId";
UIView *cardInfo;
UIImageView *logoDonors;
UILabel *totalLabel;
UILabel *countLabel;
CGFloat fSize = 20.0;
DonorsDB *donorsDB;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Available Donors";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor],
       NSFontAttributeName:[[util new] titleFont:&fSize]}];
    self.navigationController.navigationBar.barTintColor = [[util new] primaryColor];
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"DonorsDummy" ofType:@"plist"];
//    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
//
//    donorsData = dict[@"Donors"];
    [self setInitComponent];
}

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    donorsDB = [[DonorsDB alloc] init];
    items = [donorsDB showAllDonorsData];
}



- (void)setInitComponent {
    NSArray *itemArray = [NSArray arrayWithObjects: @"All", @"A", @"B", @"AB", @"O", nil];
    CGFloat fTitle = 17.0;
    CGFloat fCount = 40.0;
    segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    segmentedControl.frame = CGRectMake(0, 0 , self.view.bounds.size.width - 20, 30);
    segmentedControl.selectedSegmentTintColor = [[util new] primaryColor];
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [[util new] titleFont:&fTitle], NSFontAttributeName,
                                [UIColor blackColor], NSForegroundColorAttributeName,
                                nil];
    [segmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [segmentedControl setTitleTextAttributes:highlightedAttributes forState:UIControlStateSelected];
    [segmentedControl addTarget:self action:@selector(MySegmentControlAction:) forControlEvents: UIControlEventValueChanged];
    segmentedControl.selectedSegmentIndex = 0;
    
    cardInfo = [[UIView alloc] init];
    cardInfo.backgroundColor = [UIColor whiteColor];
    cardInfo.layer.cornerRadius = 8;
    cardInfo.layer.masksToBounds = false;
    cardInfo.layer.borderColor = [UIColor grayColor].CGColor;
    cardInfo.layer.borderWidth = 1.0f;
    
    logoDonors = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logodonor"]];
    
    totalLabel = [[UILabel alloc] init];
    totalLabel.text = @"Total";
    totalLabel.font = [[util new] titleFont:&fTitle];
    
    countLabel = [[UILabel alloc] init];
    countLabel.text = @"15";
    countLabel.font = [[util new] titleFont:&fCount];
    countLabel.textColor = [[util new] secondaryColor];
    
    donorsTableView = [[UITableView alloc] init];
    donorsTableView.delegate = self;
    donorsTableView.dataSource = self;
    donorsTableView.separatorColor = [UIColor clearColor];
    donorsTableView.showsHorizontalScrollIndicator = NO;
    donorsTableView.showsVerticalScrollIndicator = NO;
    [donorsTableView registerNib:[UINib nibWithNibName:@"DonorsTableViewCell" bundle:nil] forCellReuseIdentifier:cellDonorsId];
    
    [self.view addSubview:segmentedControl];
    [self.view addSubview:cardInfo];
    [self.view addSubview:donorsTableView];
    [cardInfo addSubview:logoDonors];
    [cardInfo addSubview:totalLabel];
    [cardInfo addSubview:countLabel];
    [self setConstraint];
    
}

- (void)setConstraint {
    segmentedControl.translatesAutoresizingMaskIntoConstraints = NO;
    [segmentedControl.widthAnchor constraintEqualToConstant:self.view.bounds.size.width - 20].active = YES;
    [segmentedControl.heightAnchor constraintEqualToConstant:30].active = YES;
    [segmentedControl.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [segmentedControl.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:15].active = YES;
    
    cardInfo.translatesAutoresizingMaskIntoConstraints = NO;
    [cardInfo.widthAnchor constraintEqualToConstant:150].active = YES;
    [cardInfo.heightAnchor constraintEqualToConstant:80].active = YES;
    [cardInfo.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [cardInfo.topAnchor constraintEqualToAnchor:segmentedControl.bottomAnchor constant:15].active = YES;
    
    logoDonors.translatesAutoresizingMaskIntoConstraints = NO;
    [logoDonors.widthAnchor constraintEqualToConstant:21].active = YES;
    [logoDonors.heightAnchor constraintEqualToConstant:31].active = YES;
    [logoDonors.topAnchor constraintEqualToAnchor:cardInfo.topAnchor constant:10].active = YES;
    [logoDonors.leadingAnchor constraintEqualToAnchor:cardInfo.leadingAnchor constant:30].active = YES;
    
    totalLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [totalLabel.topAnchor constraintEqualToAnchor:logoDonors.bottomAnchor constant:10].active = YES;
    [totalLabel.leadingAnchor constraintEqualToAnchor:cardInfo.leadingAnchor constant:15].active = YES;
    [totalLabel.bottomAnchor constraintEqualToAnchor:cardInfo.bottomAnchor constant:-10].active = YES;
    
    countLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [countLabel.topAnchor constraintEqualToAnchor:cardInfo.topAnchor constant:10].active = YES;
    [countLabel.trailingAnchor constraintEqualToAnchor:cardInfo.trailingAnchor constant:-15].active = YES;
    
    donorsTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [donorsTableView.topAnchor constraintEqualToAnchor:cardInfo.bottomAnchor constant:10].active = YES;
    [donorsTableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-20].active = YES;
    [donorsTableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:10].active = YES;
    [donorsTableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-10].active = YES;
}

- (void)MySegmentControlAction:(UISegmentedControl *)segment
{
    if(segment.selectedSegmentIndex == 0)
    {
        // code for the first button
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return donorsData.count;
    return items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = donorsTableView.rowHeight;
    return height;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DonorsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDonorsId forIndexPath:indexPath];
    DonorsDataModel *item = items[indexPath.row];
    // Configure the cell...
    
    //NSDictionary *dict = donorsData[indexPath.row];

    cell.nameDonors.text = item.name;
    cell.deptDonors.text = item.dept;
    cell.bloodTypeDonors.text = item.bloodtype;
    cell.availableDateDonors.text = item.available;
    cell.updateDateLabel.text = item.submitdate;
    
    cell.cardView.layer.masksToBounds = false;
    cell.cardView.layer.cornerRadius = 15.0;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

@end
