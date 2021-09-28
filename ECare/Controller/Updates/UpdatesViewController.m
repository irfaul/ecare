//
//  UpdatesViewController.m
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import "UpdatesViewController.h"
#import "DonorsTableViewCell.h"
#import "DonorsDB.h"
#import "util.h"

@interface UpdatesViewController () 

@end

@implementation UpdatesViewController

@synthesize segmentedControl, tableView, arrMainData, countResult;

NSString *cellDonorsId = @"cellDonorsId";
UIView *cardInfo;
UIImageView *logoDonors;
UILabel *totalLabel;
UILabel *countLabel;
CGFloat fSize = 17.0;
DonorsDB *db;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Available Donors";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor],
       NSFontAttributeName:[[util new] titleFont:&fSize]}];
    self.navigationController.navigationBar.barTintColor = [[util new] primaryColor];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
    
    [self setInitComponent];
}

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    
//    NSDateFormatter *formatDate =[[NSDateFormatter alloc] init];
//    [formatDate setDateFormat:@"dd MMM yyyy HH:mm:ss"];
//    NSString *time = [formatDate stringFromDate:[NSDate date]];
//
//    NSString *strShow = [[NSString alloc]initWithFormat:@"INSERT INTO donors (userid,name,dept,bloodtype,gender,age,contactperson,available,submitdate) VALUES ('21020007','Kim Jong Oen','F/W Design','O+','Male','23','6285146373220','20-09-2021','%@')",time];
//    DonorsDB *db = [[DonorsDB alloc] init];
//    BOOL st = [db showAllDonorsData:strShow];
//
//    if(st){
//        NSLog(@"insert succees");
//    }else{
//        NSLog(@"insert failed");
//    }
}

- (void)viewDidAppear:(BOOL)animated{
    
    NSString *strShow = [[NSString alloc]initWithFormat:@"select * from donors"];
    
    db = [[DonorsDB alloc]init];
    arrMainData = [[NSMutableArray alloc]init];
    arrMainData = [db showAllDonorsData:strShow];
    
    NSString *strCountAll = [[NSString alloc]initWithFormat:@"select count(donorsid) from donors"];
    countResult = [[NSString alloc]init];
    countResult = [db countData:strCountAll];
    countLabel.text = countResult;
    
    [tableView reloadData];
}



- (void)setInitComponent {
    NSArray *itemArray = [NSArray arrayWithObjects: @"All", @"A", @"B", @"AB", @"O", nil];
    CGFloat fTitle = 15.0;
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
    
    countLabel.font = [[util new] titleFont:&fCount];
    countLabel.textColor = [[util new] secondaryColor];
    
    tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorColor = [UIColor clearColor];
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.showsVerticalScrollIndicator = NO;
    [tableView registerNib:[UINib nibWithNibName:@"DonorsTableViewCell" bundle:nil] forCellReuseIdentifier:cellDonorsId];
    
    [self.view addSubview:segmentedControl];
    [self.view addSubview:cardInfo];
    [self.view addSubview:tableView];
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
    
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [tableView.topAnchor constraintEqualToAnchor:cardInfo.bottomAnchor constant:10].active = YES;
    [tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-20].active = YES;
    [tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:10].active = YES;
    [tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-10].active = YES;
}

- (void)MySegmentControlAction:(UISegmentedControl *)segment
{
    if(segment.selectedSegmentIndex == 0)
    {
        NSString *strShow = [[NSString alloc]initWithFormat:@"SELECT * FROM donors ORDER BY date(submitdate) DESC"];
        arrMainData = [db showAllDonorsData:strShow];
        
        NSString *strCountAll = [[NSString alloc]initWithFormat:@"select count(donorsid) from donors"];
        countResult = [db countData:strCountAll];
        countLabel.text = countResult;
        [tableView reloadData];
    }
    if(segment.selectedSegmentIndex == 1)
    {
        NSString *strShow = [[NSString alloc]initWithFormat:@"select * from donors where bloodtype = 'A+' OR bloodtype = 'A-' ORDER BY date(submitdate) DESC"];
        arrMainData = [db showAllDonorsData:strShow];
        
        NSString *strCountA = [[NSString alloc]initWithFormat:@"select count(donorsid) from donors where bloodtype = 'A+' OR bloodtype = 'A-'"];
        countResult = [db countData:strCountA];
        countLabel.text = countResult;
        
        [tableView reloadData];
    }
    if(segment.selectedSegmentIndex == 2)
    {
        NSString *strShow = [[NSString alloc]initWithFormat:@"select * from donors where bloodtype = 'B+' OR bloodtype = 'B-' ORDER BY date(submitdate) DESC"];
        arrMainData = [db showAllDonorsData:strShow];
        
        NSString *strCountB = [[NSString alloc]initWithFormat:@"select count(donorsid) from donors where bloodtype = 'B+' OR bloodtype = 'B-'"];
        countResult = [db countData:strCountB];
        countLabel.text = countResult;
        
        [tableView reloadData];
    }
    if(segment.selectedSegmentIndex == 3)
    {
        NSString *strShow = [[NSString alloc]initWithFormat:@"select * from donors where bloodtype = 'AB+' OR bloodtype = 'AB-' ORDER BY date(submitdate) DESC"];
        arrMainData = [db showAllDonorsData:strShow];
        
        NSString *strCountAB = [[NSString alloc]initWithFormat:@"select count(donorsid) from donors where bloodtype = 'AB+' OR bloodtype = 'AB-'"];
        countResult = [db countData:strCountAB];
        countLabel.text = countResult;
        
        [tableView reloadData];
    }
    if(segment.selectedSegmentIndex == 4)
    {
        NSString *strShow = [[NSString alloc]initWithFormat:@"select * from donors where bloodtype = 'O+' OR bloodtype = 'O-' ORDER BY date(submitdate) DESC"];
        arrMainData = [db showAllDonorsData:strShow];
        
        NSString *strCountO = [[NSString alloc]initWithFormat:@"select count(donorsid) from donors where bloodtype = 'O+' OR bloodtype = 'O-'"];
        countResult = [db countData:strCountO];
        countLabel.text = countResult;
        
        [tableView reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrMainData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = tableView.rowHeight;
    return height;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DonorsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDonorsId forIndexPath:indexPath];
    
    NSLog(@"%@", [NSString stringWithFormat:@"name - %@", [[arrMainData objectAtIndex:indexPath.row]objectForKey:@"name"]]);
    
    cell.nameDonors.text = [[arrMainData objectAtIndex:indexPath.row]objectForKey:@"name"];
    cell.deptDonors.text = [[arrMainData objectAtIndex:indexPath.row]objectForKey:@"dept"];
    cell.bloodTypeDonors.text = [[arrMainData objectAtIndex:indexPath.row]objectForKey:@"bloodtype"];
    cell.availableDateDonors.text = [[arrMainData objectAtIndex:indexPath.row]objectForKey:@"available"];
    cell.updateDateLabel.text = [[arrMainData objectAtIndex:indexPath.row]objectForKey:@"submitdate"];
    
    cell.cardView.layer.masksToBounds = false;
    cell.cardView.layer.cornerRadius = 15.0;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

@end
