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
#import <Masonry.h>

@interface RYFormTextFieldCell ()<UITextFieldDelegate>

@property (nonatomic, readwrite, strong) UILabel     *ry_textLabel;
@property (nonatomic, readwrite, strong) UITextField *ry_textField;

@end

@implementation RYFormTextFieldCell


- (void)dealloc
{
    NSLog(@"RYFormTextFieldCell dealloc");
}

-(void)configure
{
    [super configure];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [self.contentView addSubview:self.ry_textLabel];
    [self.contentView addSubview:self.ry_textField];
    [self autoLayoutSubViews];
    [self.ry_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
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
    } else if ([self.rowInformation.rowType isEqualToString:RYFormRowInformationTypeNumber]) {
        self.ry_textField.keyboardType = UIKeyboardTypeNumberPad;
    }

    if (self.rowInformation.isRequired) {
        
    } else {
        self.ry_textLabel.text = self.rowInformation.title;
        self.ry_textLabel.textAlignment = self.rowInformation.titleTextAlignment;
    }
    
    self.ry_textField.text = self.rowInformation.placeholderText;
    self.ry_textField.text = self.rowInformation.displayText;
    self.ry_textField.textAlignment = self.rowInformation.valueTextAlignment;
    self.ry_textField.enabled = !self.rowInformation.isDisabled;
    if (self.rowInformation.isDisabled) {
        if (self.rowInformation.disabledTitleColor) {
            self.ry_textLabel.textColor = self.rowInformation.disabledTitleColor;
        }
        if (self.rowInformation.disabledValueColor) {
            self.ry_textField.textColor = self.rowInformation.disabledValueColor;
        }
    } else {
        if (self.rowInformation.normalTitleColor) {
            self.ry_textLabel.textColor = self.rowInformation.normalTitleColor;
        }
        if (self.rowInformation.normalValueColor) {
            self.ry_textField.textColor = self.rowInformation.normalValueColor;
        }
    }
}
#pragma mark - private methods

- (void)autoLayoutSubViews
{
    // 使用Masonry添加constraints
    [self.ry_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.right.equalTo(self.ry_textField.mas_left).offset(-10);
    }];
    
    [self.ry_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.ry_textLabel.mas_right).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        //宽度为父view的宽度的一半
        make.width.equalTo(self.contentView.mas_width).multipliedBy(0.6);
    }];
    
//    self.ry_textLabel.sd_layout.heightIs(20).leftSpaceToView(self.contentView,15).centerYEqualToView(self.contentView).rightSpaceToView(self.ry_textField,20);
//    self.ry_textField.sd_layout.heightIs(30).leftSpaceToView(self.ry_textLabel,20).centerYEqualToView(self.contentView).rightSpaceToView(self.contentView,15);
}

- (void)updateAutoLayout
{
    self.ry_textLabel.sd_layout.heightIs(20).leftSpaceToView(self.contentView,15).centerYEqualToView(self.contentView).rightSpaceToView(self.ry_textField,20);
    [self.ry_textLabel updateLayout];
    self.ry_textField.sd_layout.heightIs(30).leftSpaceToView(self.ry_textLabel,20).centerYEqualToView(self.contentView).rightSpaceToView(self.contentView,15);
    [self.ry_textField updateLayout];
}

- (void)textFieldDidChange:(UITextField *)textField{
    if([self.ry_textField.text length] > 0) {
        if ([self.rowInformation.rowType isEqualToString:RYFormRowInformationTypeNumber]){
            self.rowInformation.value =  @([self.ry_textField.text doubleValue]);
        } else {
            self.rowInformation.value = self.ry_textField.text;
        }
        self.rowInformation.displayText = self.ry_textField.text;
    } else {
        self.rowInformation.value = nil;
    }
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
