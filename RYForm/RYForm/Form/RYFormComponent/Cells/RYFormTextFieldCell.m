//
//  RYFormTextFieldCell.m
//  RYForm
//
//  Created by xiaerfei on 16/5/16.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "RYFormTextFieldCell.h"
#import "RYForm.h"
#import "RYFormRowInformation.h"
#import "UIViewExt.h"
#import "RYFormViewController.h"

@interface RYFormTextFieldCell ()<UITextFieldDelegate>

@property (nonatomic, readwrite, strong) UITextField *ry_textField;
@property (nonatomic, strong)            UILabel     *contentTips;

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
    [self.contentView addSubview:self.ry_textField];
    [self updateAutoLayout];
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
    } else if ([self.rowInformation.rowType isEqualToString:RYFormRowInformationTypeDecimal]) {
        self.ry_textField.keyboardType = UIKeyboardTypeDecimalPad;
    } else if ([self.rowInformation.rowType isEqualToString:RYFormRowInformationTypeContentTips]) {
        if (_contentTips == nil) {
            [self.contentView addSubview:self.contentTips];
        }
    }

    if (self.rowInformation.isRequired) {
        
    } else {
        self.ry_textLabel.text = self.rowInformation.title;
        self.ry_textLabel.textAlignment = self.rowInformation.titleTextAlignment;
    }
    
    self.ry_textField.placeholder = self.rowInformation.placeholderText;
    self.ry_textField.text = self.rowInformation.displayText;
    self.ry_textField.textAlignment = self.rowInformation.valueTextAlignment;
    self.ry_textField.enabled = !self.rowInformation.isDisabled;
    if (_contentTips != nil) {
        self.contentTips.text = self.rowInformation.contentTips;
    }
    
    if (self.rowInformation.isDisabled) {
        if (self.rowInformation.disabledValueColor) {
            self.ry_textField.textColor = self.rowInformation.disabledValueColor;
        }
    } else {
        if (self.rowInformation.normalValueColor) {
            self.ry_textField.textColor = self.rowInformation.normalValueColor;
        }
    }
    
    [self updateAutoLayout];
}


#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([self.rowInformation.currentController.child respondsToSelector:@selector(didSelectFormRow:isClickCell:)]) {
        [self.rowInformation.currentController.child didSelectFormRow:self.rowInformation isClickCell:NO];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.rowInformation.isRealTimeChange == NO) {
        [self valueChange];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    UITextRange *selectedRange = [textField markedTextRange];
    //获取高亮部分
    UITextPosition *pos = [textField positionFromPosition:selectedRange.start offset:0];
    
    //如果有高亮且当前字数开始位置小于最大限制时允许输入
    if (selectedRange && pos) {
        NSInteger startOffset = [textField offsetFromPosition:textField.beginningOfDocument toPosition:selectedRange.start];
        NSInteger endOffset = [textField offsetFromPosition:textField.beginningOfDocument toPosition:selectedRange.end];
        NSRange offsetRange = NSMakeRange(startOffset, endOffset - startOffset);
        
        if (offsetRange.location < self.rowInformation.wordLengthLimite) {
            return YES;
        } else {
            return NO;
        }
    }
    return YES;
}


#pragma mark - event responses
- (void)textFieldDidChange:(UITextField *)textField{
    
    UITextRange *selectedRange = [textField markedTextRange];
    //获取高亮部分
    UITextPosition *pos = [textField positionFromPosition:selectedRange.start offset:0];
    
    //如果在变化中是高亮部分在变，就不要计算字符了
    if (selectedRange && pos) {
        return;
    }
    if (self.rowInformation.isRealTimeChange) {
        [self valueChange];
    }
}
#pragma mark - private methods

- (void)autoLayoutSubViews
{
    CGFloat top = (self.rowInformation.rowHeight - 20)/2.0f;
    CGFloat pad = 5;
    self.ry_textLabel.frame = CGRectMake(15,top , 100, 20);
    self.ry_textField.frame = CGRectMake(self.ry_textLabel.right + pad, top, ([UIScreen mainScreen].bounds.size.width - 20 - self.ry_textLabel.width - pad - 25), 30);
}

- (void)updateAutoLayout
{
    CGFloat vTop = (self.rowInformation.rowHeight - 30)/2.0f;
    CGFloat pad = 5;
    if (_contentTips != nil) {
        CGFloat tTop = (self.rowInformation.rowHeight - self.rowInformation.titleSize.height - 25)/2.0f;
        self.ry_textLabel.top = tTop;
        vTop = (self.rowInformation.rowHeight - 30 - 25)/2.0f;
    }
    
    self.ry_textField.frame = CGRectMake(self.ry_textLabel.right + pad, vTop, ([UIScreen mainScreen].bounds.size.width - 20 - self.ry_textLabel.width - pad - 25), 30);
    
    if (_contentTips != nil) {
        self.contentTips.frame = CGRectMake(15, self.ry_textField.bottom, [UIScreen mainScreen].bounds.size.width - 20 - 15, 20);
    }
    
    
}

- (void)valueChange
{
    self.rowInformation.isvalidator = NO;
    id oldValue = [self.rowInformation.value copy];
    if([self.ry_textField.text length] > 0) {
        if ([self.rowInformation.rowType isEqualToString:RYFormRowInformationTypeNumber]){
            self.rowInformation.value =  @([self.ry_textField.text doubleValue]);
            
            if ([self.rowInformation.currentController respondsToSelector:@selector(formRowValueHasChanged:oldValue:newValue:)]) {
                [self.rowInformation.currentController formRowValueHasChanged:self.rowInformation oldValue:oldValue newValue:@([self.ry_textField.text doubleValue])];
            }
        } else {
            self.rowInformation.value = self.ry_textField.text;
            if ([self.rowInformation.currentController respondsToSelector:@selector(formRowValueHasChanged:oldValue:newValue:)]) {
                [self.rowInformation.currentController formRowValueHasChanged:self.rowInformation oldValue:oldValue newValue:self.ry_textField.text];
            }
        }
        self.rowInformation.displayText = self.ry_textField.text;
    } else {
        self.rowInformation.value = nil;
        if ([self.rowInformation.currentController respondsToSelector:@selector(formRowValueHasChanged:oldValue:newValue:)]) {
            [self.rowInformation.currentController formRowValueHasChanged:self.rowInformation oldValue:oldValue newValue:nil];
        }
    }
    
    if ([self.rowInformation.currentController respondsToSelector:@selector(switchDisPlayValueToCompetentTypeWithFormRow:)]) {
        id value = [self.rowInformation.currentController.child switchDisPlayValueToCompetentTypeWithFormRow:self.rowInformation];
        if (value != nil) {
            self.rowInformation.value = value;
        }
    }
}

#pragma mark - getters


- (UITextField *)ry_textField
{
    if (_ry_textField == nil) {
        _ry_textField = [[UITextField alloc] init];
        _ry_textField.textColor = [UIColor blackColor];
        _ry_textField.font = [UIFont systemFontOfSize:13];
        _ry_textField.delegate = self;
//        _ry_textField.backgroundColor = [UIColor lightGrayColor];
    }
    return _ry_textField;
}

- (UILabel *)contentTips
{
    if (_contentTips == nil) {
        _contentTips = [[UILabel alloc] init];
        _contentTips.font = [UIFont systemFontOfSize:13];
        _contentTips.textColor = [UIColor colorWithRed:204.0f/255.0f green:204.0f/255.0f blue:204.0f/255.0f alpha:1];
//        _contentTips.backgroundColor = [UIColor lightGrayColor];
    }
    return _contentTips;
}

@end
