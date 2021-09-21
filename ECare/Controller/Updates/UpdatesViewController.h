//
//  UpdatesViewController.h
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UpdatesViewController : UIViewController {
    NSMutableArray *donorsData;
}

@property(nonatomic, retain) UISegmentedControl *segmentedControl;
@property(nonatomic, retain) UITableView *donorsTableView;
@property (nonatomic) NSMutableArray *items;

@end

NS_ASSUME_NONNULL_END
