//
//  DonorsTableViewCell.h
//  ECare
//
//  Created by iei19100004 on 17/09/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DonorsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameDonors;
@property (weak, nonatomic) IBOutlet UILabel *deptDonors;
@property (weak, nonatomic) IBOutlet UILabel *bloodTypeDonors;
@property (weak, nonatomic) IBOutlet UILabel *availableDateDonors;
@property (weak, nonatomic) IBOutlet UILabel *updateDateLabel;
@property (weak, nonatomic) IBOutlet UIView *cardView;


@end

NS_ASSUME_NONNULL_END
