//
//  util.m
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import "util.h"

@implementation util

- (UIColor *) primaryColor {
    UIColor *primaryColor = [[UIColor alloc] initWithRed:0 green:0.247 blue:0.596 alpha:1];
    return primaryColor;
}

- (UIColor *) secondaryColor {
    UIColor *secondaryColor = [[UIColor alloc] initWithRed:0.613 green:0 blue:0.147 alpha:1];
    return secondaryColor;
}

- (UIFont *) titleFont:(CGFloat *)fontSize {
    UIFont *titleFont = [UIFont fontWithName:@"Poppins-Bold" size:*fontSize];
    return titleFont;
}

- (UIFont *) regularFont:(CGFloat *)fontSize {
    UIFont *regularFont = [UIFont fontWithName:@"Poppins-Regular" size:*fontSize];
    return regularFont;
}

- (UIFont *) italicFont:(CGFloat *)fontSize {
    UIFont *italicFont = [UIFont fontWithName:@"Poppins-Italic" size:*fontSize];
    return italicFont;
}

@end
