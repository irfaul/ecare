//
//  StatusViewController.h
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StatusViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, retain) UITableView *reqTableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property(strong, nonatomic)NSMutableArray *arrMainData;
@property (nonatomic, strong) UILabel *nullDataLabel;

@end

NS_ASSUME_NONNULL_END
