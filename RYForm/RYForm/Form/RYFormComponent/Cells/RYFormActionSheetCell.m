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


@interface RYFormActionSheetCell () <UIActionSheetDelegate>

@property (nonatomic, strong) UILabel       *ry_valueTextLabel;
@property (nonatomic, strong) UIActionSheet *ry_actionSheet;

@end


@implementation RYFormActionSheetCell



- (void)configure
{
    [super configure];
    
    [self.contentView addSubview:self.ry_valueTextLabel];
}

- (void)update
{
    [super update];
    self.ry_textLabel.textColor  = self.rowInformation.isDisabled ? [UIColor grayColor] : [UIColor blackColor];
    self.ry_valueTextLabel.text  = self.rowInformation.displayText;
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
        self.ry_valueTextLabel.text  = self.rowInformation.displayText;
        if ([self.rowInformation.currentController respondsToSelector:@selector(switchDisPlayValueToCompetentTypeWithFormRow:)]) {
            id value = [self.rowInformation.currentController switchDisPlayValueToCompetentTypeWithFormRow:self.rowInformation];
            self.rowInformation.value = (value == nil)?@(buttonIndex - 1):value;
        }
    }
}

#pragma mark - private methods

- (void)autoLayoutSubViews
{
    CGFloat vTop = (self.rowInformation.rowHeight - 20)/2.0f;
    CGFloat pad = 5;
    self.ry_valueTextLabel.frame = CGRectMake(self.ry_textLabel.right + pad, vTop, ([UIScreen mainScreen].bounds.size.width - 20 - self.ry_textLabel.width - pad - 25), 20);
}

#pragma mark - getters
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
