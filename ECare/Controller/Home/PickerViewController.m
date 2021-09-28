//
//  PickerViewController.m
//  ECare
//
//  Created by iei19100004 on 15/09/21.
//

#import "PickerViewController.h"
#import "util.h"

@interface PickerViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation PickerViewController

@synthesize pickerTableView, delegate, pickerLoc, pickerString;

NSString *cellIdPicker = @"pickerId", *pickerText = @"";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor systemGroupedBackgroundColor];
    self.navigationItem.title = @"Choose option";
    self.navigationController.navigationBar.barTintColor = [[util new] primaryColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:
       @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    pickerTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    pickerTableView.delegate = self;
    pickerTableView.dataSource = self;
    pickerTableView.showsHorizontalScrollIndicator = NO;
    pickerTableView.showsVerticalScrollIndicator = NO;
    [pickerTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdPicker];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Picker" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    if (pickerLoc == 1) {
        dataSource = dict[@"Dept"];
    } else if (pickerLoc == 2) {
        dataSource = dict[@"BloodType"];
    } else if (pickerLoc == 3) {
        dataSource = dict[@"Gender"];
    }
    
    [self setConstraint];
}

- (void) setConstraint{

    [self.view addSubview:pickerTableView];
    
    pickerTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [pickerTableView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [pickerTableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [pickerTableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20].active = YES;
    [pickerTableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20].active = YES;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdPicker forIndexPath:indexPath];
    
    cell.textLabel.text = dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [pickerTableView reloadData];
    for (int i = 0; i< dataSource.count; i++) {
        NSIndexPath* newIndexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:newIndexPath];
        if (i == indexPath.row) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            pickerText = cell.textLabel.text;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//- (void)viewWillDisappear:(BOOL)animated{
//    [delegate pickerData:pickerLoc pickerText:pickerText];
//}


@end
