//
//  DonorsFormTableViewCell.m
//  ECare
//
//  Created by iei19100004 on 13/09/21.
//

#import "ReqFormTableViewCell.h"
#import "util.h"

@implementation ReqFormTableViewCell

@synthesize formTextField, formDesc;

CGFloat fGSize = 16.0;

- (void) configureCell:(UIKeyboardType) type {
    formTextField = [[UITextField alloc]initWithFrame:CGRectMake(16, 0, self.contentView.frame.size.width, self.contentView.frame.size.height)];
    formTextField.keyboardType = type;
    [self.contentView addSubview:formTextField];
    [self setHiddenAttribute:false];
}

- (void) configureDate:(ItemTableCell*) item {
    _titleItemLabel.text = item.dateTitle;
    _imageItemLabel.image = [UIImage systemImageNamed:item.imageItemTable];
    [_imageItemLabel setTintColor:[[util new] secondaryColor]];
}

- (void) configureImageActivity {
    [self setHiddenAttribute:false];
}

- (void) configurePicker:(ItemTableCell*) item {
    UILabel *cellTitle = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, 100, self.contentView.frame.size.height)];
    
    _valueItemLabel.text = @"Select";
    cellTitle.font = [[util new] regularFont:&fGSize];
    cellTitle.text = item.fieldTitle;
    [self.contentView addSubview:cellTitle];
    [self setHiddenAttribute:true];
}

- (void) configureDesc {
    formDesc = [[UITextView alloc] initWithFrame:CGRectMake(16, 0, self.contentView.frame.size.width, 100)];
    [formDesc setEditable:true];
    [formDesc setSelectable:true];
    [formDesc setReturnKeyType:UIReturnKeyDone];
    [formDesc enablesReturnKeyAutomatically];
    [self.contentView addSubview:formDesc];
    [self setHiddenAttribute:false];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setHiddenAttribute:(BOOL) state {
    if (state) {
        _valueItemLabel.alpha = 1;
        _imageToPicker.alpha = 1;
    } else {
        _valueItemLabel.hidden = YES;
        _imageToPicker.hidden = YES;
    }
    _titleItemLabel.hidden = YES;
    _imageItemLabel.hidden = YES;
    _titleItemLabel.enabled = NO;
}

@end
