//
//  HomeViewController.h
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *logoApp;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *donorsBtnLabel;
@property (strong, nonatomic) IBOutlet UILabel *reqBtnLabel;
@property(strong, nonatomic)NSString *countStatus;


@end

NS_ASSUME_NONNULL_END
