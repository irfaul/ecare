//
//  AppDelegate.m
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import "AppDelegate.h"
#import "HomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize strPath;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self copyandpaste];
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

//custom methods
-(void)copyandpaste{
    //Search in array
    NSArray *arrayPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *strStorePath = [arrayPath objectAtIndex:0];
    
    strPath = [strStorePath stringByAppendingPathComponent:@"ecare.db"];
    
    if(![[NSFileManager defaultManager]fileExistsAtPath:strPath]){
        NSString *local = [[NSBundle mainBundle]pathForResource:@"ecare" ofType:@"db"];
        
        [[NSFileManager defaultManager]copyItemAtPath:local toPath:strPath error:nil];
    }
    
    NSLog(@"%@ Path DB",strPath);
}

//----------------ADMIN ROLE---------------------------------------//
//    arrMainData = [dbreq showReqData:strShow];

//-----------------------------------------------------------------//


@end
