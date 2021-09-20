//
//  PickerViewController.h
//  ECare
//
//  Created by iei19100004 on 15/09/21.
//

#import <UIKit/UIKit.h>

@protocol pickerData <NSObject>

- (void) pickerData: (NSInteger) pickerInt pickerText:(NSString*_Nullable) pickerText;

@end

NS_ASSUME_NONNULL_BEGIN

@interface PickerViewController : UIViewController {
    NSMutableArray *dataSource;
}

@property(nonatomic, retain) UITableView *pickerTableView;

@property(nonatomic, assign) NSString* pickerString;

@property (nonatomic, assign) NSInteger pickerLoc;

@property(nonatomic, assign)id delegate;

@end

NS_ASSUME_NONNULL_END
