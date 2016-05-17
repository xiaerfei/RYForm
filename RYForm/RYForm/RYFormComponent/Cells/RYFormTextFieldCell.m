//
//  RYFormTextFieldCell.m
//  RYForm
//
//  Created by xiaerfei on 16/5/16.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "RYFormTextFieldCell.h"
#import "UIView+SDAutoLayout.h"
#import "RYForm.h"
#import "RYFormRowInformation.h"

@interface RYFormTextFieldCell ()<UITextFieldDelegate>

@property (nonatomic, readwrite, strong) UILabel     *ry_textLabel;
@property (nonatomic, readwrite, strong) UITextField *ry_textField;

@end

@implementation RYFormTextFieldCell



-(void)configure
{
    [super configure];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [self.contentView addSubview:self.ry_textLabel];
    [self.contentView addSubview:self.ry_textField];
    [self autoLayoutSubViews];
}

- (void)update
{
    [super update];
    
    self.ry_textField.delegate = self;
    self.ry_textField.clearButtonMode = UITextFieldViewModeWhileEditing;

    if ([self.rowInformation.rowType isEqualToString:RYFormRowInformationTypeText]) {
        self.ry_textField.autocorrectionType = UITextAutocorrectionTypeDefault;
        self.ry_textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    } else if ([self.rowInformation.rowType isEqualToString:RYFormRowInformationTypeName]) {
        self.ry_textField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.ry_textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    } else if ([self.rowInformation.rowType isEqualToString:RYFormRowInformationTypePhone]) {
        self.ry_textField.keyboardType = UIKeyboardTypePhonePad;
    } else if ([self.rowInformation.rowType isEqualToString:RYFormRowInformationTypeURL]) {
        self.ry_textField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.ry_textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.ry_textField.keyboardType = UIKeyboardTypeURL;
    } else if ([self.rowInformation.rowType isEqualToString:RYFormRowInformationTypeEmail]) {
        self.ry_textField.keyboardType = UIKeyboardTypeEmailAddress;
        self.ry_textField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.ry_textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    }
    
    if (self.rowInformation.isRequired) {
        
    } else {
        self.ry_textLabel.text = self.rowInformation.title;
    }
    
    self.ry_textField.text = self.rowInformation.placeholderText;
    self.ry_textField.text = self.rowInformation.displayText;
    
    self.ry_textField.enabled = !self.rowInformation.isDisabled;
}


#pragma mark - private methods

- (void)autoLayoutSubViews
{
    self.ry_textLabel.sd_layout.heightIs(20).leftSpaceToView(self.contentView,15).centerYEqualToView(self.contentView);
    self.ry_textField.sd_layout.heightIs(30).leftSpaceToView(self.ry_textLabel,5).centerYEqualToView(self.contentView).rightSpaceToView(self.contentView,15);
}

#pragma mark - getters

- (UILabel *)ry_textLabel
{
    if (_ry_textLabel == nil) {
        _ry_textLabel = [[UILabel alloc] init];
        _ry_textLabel.textColor = [UIColor blackColor];
        _ry_textLabel.backgroundColor = [UIColor lightGrayColor];
        
    }
    return _ry_textLabel;
}

- (UITextField *)ry_textField
{
    if (_ry_textField == nil) {
        _ry_textField = [[UITextField alloc] init];
        _ry_textField.textColor = [UIColor blackColor];
        _ry_textField.backgroundColor = [UIColor lightGrayColor];
    }
    return _ry_textField;
}







@end
