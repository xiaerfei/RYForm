//
//  RYFormSwitchCell.m
//  RYForm
//
//  Created by xiaerfei on 16/5/16.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "RYFormSwitchCell.h"
#import "RYFormRowInformation.h"
#import "UIView+SDAutoLayout.h"

@interface RYFormSwitchCell ()

@property (nonatomic, strong, readwrite) UISwitch *switchControl;

@end

@implementation RYFormSwitchCell

- (void)configure
{
    [super configure];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryView = [[UISwitch alloc] init];
    self.editingAccessoryView = self.accessoryView;
    [self.switchControl addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
}


- (void)update
{
    [super update];
    self.textLabel.text = self.rowInformation.title;
    self.switchControl.on = [self.rowInformation.value boolValue];
    self.switchControl.enabled = !self.rowInformation.isDisabled;
}


#pragma mark - event responses
- (void)valueChanged
{
    self.rowInformation.value = @(self.switchControl.on);
}

#pragma mark - private methods

- (void)autoLayoutSubViews
{
    self.switchControl.sd_layout.centerYEqualToView(self.contentView).rightSpaceToView(self.contentView,20);
}

#pragma mark - getters
- (UISwitch *)switchControl
{
    return (UISwitch *)self.accessoryView;
}

@end
