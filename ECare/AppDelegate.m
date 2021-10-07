//
//  AppDelegate.m
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "DonorsDB.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize strPath;

-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    UNNotificationPresentationOptions present = UNNotificationPresentationOptionAlert + UNNotificationPresentationOptionSound;
    completionHandler(present);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    
    [self copyandpaste];
    [self adminRole];
    
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

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
 {
    if (self.blockRotation) {
        return UIInterfaceOrientationMaskPortrait;
    }
     return UIInterfaceOrientationMaskAll;
 }

//----------------ADMIN ROLE---------------------------------------//
-(void)adminRole {
//    NSString *strUpdate = [[NSString alloc]initWithFormat:@"UPDATE request SET submitdate = datetime('now','localtime'), reqstatus = 'Scheduled', donordate = '23-10-2021', donorloc = 'RS Pengen Sembuh', donorsname = 'Joko', donorsdept = 'F/W Design', donorscp = '6282225454567', notes = 'Harap segera melakukan konfirmasi ke pendonor melalui WA yang tesedia' WHERE userid = '19080036' and reqid = 3"];
//
//    DonorsDB *db = [[DonorsDB alloc] init];
//    BOOL update = [db showAllDonorsData:strUpdate];
//
//    if(update){
//        NSLog(@"update succees");
//    }else{
//        NSLog(@"update failed");
//    }
//    
//    NSString *strInsert = [[NSString alloc]initWithFormat:@"INSERT INTO donors (userid,name,dept,bloodtype,gender,age,contactperson,available,submitdate,statusdonors) VALUES ('21080012','Mumun','Mecha Design','A+','Female','29','6285146373220','05-10-2021',datetime('now','localtime'),'Scheduled')"];
//
//    BOOL insert = [db showAllDonorsData:strInsert];
//
//    if(insert){
//        NSLog(@"insert succees");
//    }else{
//        NSLog(@"insert failed");
//    }
}
//-----------------------------------------------------------------//


@end
