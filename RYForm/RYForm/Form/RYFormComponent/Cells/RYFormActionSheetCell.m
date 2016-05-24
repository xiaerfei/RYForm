//
//  RYFormActionSheetCell.m
//  RYForm
//
//  Created by xiaerfei on 16/5/19.
//  Copyright © 2016年 Rongyu100. All rights reserved.
//

#import "RYFormActionSheetCell.h"
#import "RYFormRowInformation.h"
#import "UIViewExt.h"
#import "RYFormViewController.h"

@interface RYFormActionSheetCell () <UIActionSheetDelegate>

@property (nonatomic, strong) UIActionSheet *ry_actionSheet;

@property (nonatomic, strong) UITextField *ry_textField;

@end


@implementation RYFormActionSheetCell



- (void)configure
{
    [super configure];
    
    [self.contentView addSubview:self.ry_textField];
}

- (void)update
{
    [super update];
    self.ry_textLabel.textColor  = self.rowInformation.isDisabled ? [UIColor grayColor] : [UIColor blackColor];
    self.ry_textField.placeholder = self.rowInformation.placeholderText;
    self.ry_textField.text  = self.rowInformation.displayText;
    [self autoLayoutSubViews];
}
#pragma mark - RYFormInformationCell
-(void)formInformationCellDidSelectedWithFormController:(RYFormViewController *)controller
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles: nil];
    for (NSString *title in self.rowInformation.actionSheetArray) {
        [actionSheet addButtonWithTitle:title];
    }
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
}
#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex > 0) {
        if ([self.rowInformation.currentController respondsToSelector:@selector(formRowValueHasChanged:oldValue:newValue:)]) {
            [self.rowInformation.currentController formRowValueHasChanged:self.rowInformation oldValue:self.rowInformation.value newValue:@(buttonIndex - 1)];
        }
        self.rowInformation.value = @(buttonIndex - 1);
        self.rowInformation.displayText = self.rowInformation.actionSheetArray[buttonIndex - 1];
        self.ry_textField.text  = self.rowInformation.displayText;
        if ([self.rowInformation.currentController respondsToSelector:@selector(switchDisPlayValueToCompetentTypeWithFormRow:)]) {
            id value = [self.rowInformation.currentController.child switchDisPlayValueToCompetentTypeWithFormRow:self.rowInformation];
            self.rowInformation.value = (value == nil)?@(buttonIndex - 1):value;
        }
    }
}

#pragma mark - private methods

- (void)autoLayoutSubViews
{
    CGFloat vTop = (self.rowInformation.rowHeight - 20)/2.0f;
    CGFloat pad = 5;
    self.ry_textField.frame = CGRectMake(self.ry_textLabel.right + pad, vTop, ([UIScreen mainScreen].bounds.size.width - 20 - self.ry_textLabel.width - pad - 25), 20);
}

#pragma mark - getters

- (UITextField *)ry_textField
{
    if (_ry_textField == nil) {
        _ry_textField = [[UITextField alloc] init];
        _ry_textField.textColor = [UIColor blackColor];
        _ry_textField.font = [UIFont systemFontOfSize:13];
        _ry_textField.textAlignment = NSTextAlignmentRight;
        _ry_textField.enabled = NO;
        //        _ry_textField.backgroundColor = [UIColor lightGrayColor];
    }
    return _ry_textField;
}


@end
