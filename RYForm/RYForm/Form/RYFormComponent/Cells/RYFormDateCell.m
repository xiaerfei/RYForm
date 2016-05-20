//
//  RYFormDateCell.m
//  RYForm
//
//  Created by xiaerfei on 16/5/16.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "RYFormDateCell.h"
#import "RYFormRowInformation.h"
#import "UIViewExt.h"
#import "RYFormViewController.h"

@interface RYFormDateCell ()

@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) UIView *ry_inputAccessoryView;

@property (nonatomic, strong) UILabel     *ry_valueTextLabel;

@end

@implementation RYFormDateCell

- (void)configure
{
    [super configure];
    
    [self.contentView addSubview:self.ry_valueTextLabel];
}

- (void)update
{
    [super update];
    self.ry_textLabel.textColor  = self.rowInformation.isDisabled ? [UIColor grayColor] : [UIColor blackColor];
    self.ry_valueTextLabel.text     = self.rowInformation.displayText;
    [self autoLayoutSubViews];
}

- (UIView *)inputView
{
    return self.datePicker;
}

-(UIView *)inputAccessoryView
{
    return self.ry_inputAccessoryView;
}

- (BOOL)canBecomeFirstResponder
{
    return !self.rowInformation.isDisabled;
}

-(void)formInformationCellDidSelectedWithFormController:(RYFormViewController *)controller
{
    [self becomeFirstResponder];
}


- (void)autoLayoutSubViews
{
    CGFloat vTop = (self.rowInformation.rowHeight - 20)/2.0f;
    CGFloat pad = 5;
    self.ry_valueTextLabel.frame = CGRectMake(self.ry_textLabel.right + pad, vTop, ([UIScreen mainScreen].bounds.size.width - 20 - self.ry_textLabel.width - pad - 25), 20);
}

#pragma mark - event responses

- (void)datePickerValueChanged:(UIDatePicker *)sender
{
    [self parsePickerDate:sender.date];
}

- (void)completeAction
{
    [self resignFirstResponder];
    [self parsePickerDate:self.datePicker.date];
}

- (void)parsePickerDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [formatter stringFromDate:date];
    
    
    [self.rowInformation.currentController formRowValueHasChanged:self.rowInformation oldValue:self.rowInformation.value newValue:dateString];
    
    self.rowInformation.value       = dateString;
    self.rowInformation.displayText = dateString;
    self.ry_valueTextLabel.text     = dateString;
}


#pragma mark - getters

-(UIDatePicker *)datePicker
{
    if (_datePicker == nil) {
        _datePicker = [[UIDatePicker alloc] init];
        [_datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _datePicker;
}

- (UIView *)ry_inputAccessoryView
{
    if (_ry_inputAccessoryView == nil) {
        _ry_inputAccessoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-50, 0, 40, 40);
        [button setTitle:@"完成" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(completeAction) forControlEvents:UIControlEventTouchUpInside];
        [_ry_inputAccessoryView addSubview:button];
        [_ry_inputAccessoryView setBackgroundColor:[UIColor colorWithRed:247.0f/255.0f green:247.0f/255.0f blue:247.0f/255.0f alpha:1]];
    }
    return _ry_inputAccessoryView;
}

- (UILabel *)ry_valueTextLabel
{
    if (_ry_valueTextLabel == nil) {
        _ry_valueTextLabel = [[UILabel alloc] init];
        _ry_valueTextLabel.textColor = [UIColor blackColor];
        _ry_valueTextLabel.font = [UIFont systemFontOfSize:13];
        _ry_valueTextLabel.textAlignment = NSTextAlignmentRight;
//        _ry_valueTextLabel.backgroundColor = [UIColor lightGrayColor];
    }
    return _ry_valueTextLabel;
}


@end
