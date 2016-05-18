//
//  RYFormStepCounterCell.m
//  RYForm
//
//  Created by xiaerfei on 16/5/16.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "RYFormStepCounterCell.h"
#import "RYFormRowInformation.h"
#import "UIView+SDAutoLayout.h"


@interface RYFormStepCounterCell ()

@property (nonatomic, strong) UIStepper *stepControl;
@property (nonatomic, strong) UILabel   *currentStepValue;

@end

@implementation RYFormStepCounterCell



- (void)configure
{
    [super configure];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    // Add subviews
    [self.contentView addSubview:self.stepControl];
    [self.contentView addSubview:self.currentStepValue];
}

- (void)update
{
    [super update];
    self.textLabel.text = self.rowInformation.title;
    self.stepControl.value = [self.rowInformation.value doubleValue];
    self.stepControl.maximumValue = self.rowInformation.stepCounterMaximumValue;
    self.stepControl.minimumValue = self.rowInformation.stepCounterMinimumValue;
    self.currentStepValue.text = self.rowInformation.value ? [NSString stringWithFormat:@"%@", self.rowInformation.value] : nil;
    [self stepControl].enabled = !self.rowInformation.isDisabled;
    [self currentStepValue].font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    CGFloat red, green, blue, alpha;
    [self.tintColor getRed:&red green:&green blue:&blue alpha:&alpha];
    if (self.rowInformation.isDisabled)
    {
        [self setTintColor:[UIColor colorWithRed:red green:green blue:blue alpha:0.3]];
        [self currentStepValue].textColor = [UIColor colorWithRed:red green:green blue:blue alpha:0.3];
    }
    else{
        [self setTintColor:[UIColor colorWithRed:red green:green blue:blue alpha:1]];
        [self currentStepValue].textColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    }
}

- (void)autoLayoutSubViews
{
    self.stepControl.sd_layout.centerYEqualToView(self.contentView).leftSpaceToView(self.contentView,200);
    self.currentStepValue.sd_layout.centerYEqualToView(self.contentView).widthIs(100).heightIs(20).rightSpaceToView(self.stepControl,0);
}


#pragma mark - event responses

- (void)valueChanged:(id)sender
{
    UIStepper *stepper = self.stepControl;
    
    self.rowInformation.value  = @(stepper.value);
    self.currentStepValue.text = [NSString stringWithFormat:@"%.f", stepper.value];
}


#pragma mark - getters

- (UIStepper *)stepControl
{
    if (_stepControl == nil) {
        _stepControl = [[UIStepper alloc] init];
        [_stepControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _stepControl;
}

- (UILabel *)currentStepValue
{
    if (_currentStepValue == nil) {
        _currentStepValue = [[UILabel alloc] init];
        _currentStepValue.font = [UIFont systemFontOfSize:15];
        _currentStepValue.textAlignment = NSTextAlignmentRight;
    }
    return _currentStepValue;
}

@end
