//
//  ReqTableViewCell.h
//  ECare
//
//  Created by iei19100004 on 17/09/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReqTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *reqName;
@property (weak, nonatomic) IBOutlet UILabel *reqDept;
@property (weak, nonatomic) IBOutlet UILabel *reqBloodType;
@property (weak, nonatomic) IBOutlet UILabel *reqUpdates;
@property (weak, nonatomic) IBOutlet UILabel *reqStatus;
@property (weak, nonatomic) IBOutlet UIButton *btnCancelView;
@property (weak, nonatomic) IBOutlet UIView *cardView;




@end

NS_ASSUME_NONNULL_END
