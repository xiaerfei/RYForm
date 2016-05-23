//
//  RYFormStepCounterCell.m
//  RYForm
//
//  Created by xiaerfei on 16/5/16.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "RYFormStepCounterCell.h"
#import "RYFormRowInformation.h"
#import "UIViewExt.h"
#import "RYForm.h"

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
    [self autoLayoutSubViews];
}

- (void)update
{
    [super update];
    self.ry_textLabel.text = self.rowInformation.title;
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
    self.stepControl.center = CGPointMake(0, 44/2.0);
    self.stepControl.right  = [UIScreen mainScreen].bounds.size.width - 20;
    self.currentStepValue.frame = CGRectMake(0, (44 - 20)/2.0f, 50, 20);
    self.currentStepValue.right = self.stepControl.left-1;
}

#pragma mark - event responses

- (void)valueChanged:(id)sender
{
    UIStepper *stepper = self.stepControl;
    if ([self.rowInformation.currentController respondsToSelector:@selector(formRowValueHasChanged:oldValue:newValue:)]) {
        [self.rowInformation.currentController formRowValueHasChanged:self.rowInformation oldValue:self.rowInformation.value newValue:@(stepper.value)];
    }
    
    self.rowInformation.value  = @(stepper.value);
    self.currentStepValue.text = [NSString stringWithFormat:@"%.f", stepper.value];
    if ([self.rowInformation.currentController respondsToSelector:@selector(switchDisPlayValueToCompetentTypeWithFormRow:)]) {
        id value = [self.rowInformation.currentController switchDisPlayValueToCompetentTypeWithFormRow:self.rowInformation];
        self.rowInformation.value = (value == nil)?@(stepper.value):value;
    }
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
        _currentStepValue.textAlignment = NSTextAlignmentCenter;
//        _currentStepValue.backgroundColor = [UIColor lightGrayColor];
    }
    return _currentStepValue;
}

@end
