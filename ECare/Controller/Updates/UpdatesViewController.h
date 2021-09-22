//
//  UpdatesViewController.h
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UpdatesViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, retain) UISegmentedControl *segmentedControl;
@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic)NSMutableArray *arrMainData;
@property(strong, nonatomic)NSString *countResult;

@end

NS_ASSUME_NONNULL_END
