//
//  AppDelegate.h
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UNUserNotificationCenterDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic , assign) bool blockRotation;

@property (strong, nonatomic) NSString *strPath;
-(void)copyandpaste;
-(void)adminRole;

@end

