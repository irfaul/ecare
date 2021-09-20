//
//  util.h
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface util : NSObject

- (UIColor *) primaryColor;
- (UIColor *) secondaryColor;
- (UIFont *) titleFont:(CGFloat *)fontSize;
- (UIFont *) regularFont:(CGFloat *)fontSize;
- (UIFont *) italicFont:(CGFloat *)fontSize;

@end

NS_ASSUME_NONNULL_END
