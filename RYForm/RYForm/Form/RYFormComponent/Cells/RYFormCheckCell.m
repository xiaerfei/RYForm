//
//  RYFormCheckCell.m
//  RYForm
//
//  Created by xiaerfei on 16/5/16.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "RYFormCheckCell.h"
#import "RYFormRowInformation.h"
#import "RYFormViewController.h"

@implementation RYFormCheckCell

- (void)configure
{
    [super configure];
    self.accessoryType = UITableViewCellAccessoryCheckmark;
    self.editingAccessoryType = self.accessoryType;
}

- (void)update
{
    [super update];
    self.ry_textLabel.text = self.rowInformation.title;
    self.accessoryType = [self.rowInformation.value boolValue] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    self.editingAccessoryType =  self.accessoryType;
    CGFloat red, green, blue, alpha;
    [self.tintColor getRed:&red green:&green blue:&blue alpha:&alpha];
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    if (self.rowInformation.isDisabled){
        [self setTintColor:[UIColor colorWithRed:red green:green blue:blue alpha:0.3]];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else{
        [self setTintColor:[UIColor colorWithRed:red green:green blue:blue alpha:1]];
    }
}

-(void)formInformationCellDidSelectedWithFormController:(RYFormViewController *)controller
{
    self.rowInformation.value = [NSNumber numberWithBool:![self.rowInformation.value boolValue]];
    [controller updateFormRow:self.rowInformation];
}

@end
