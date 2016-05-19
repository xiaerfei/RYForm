//
//  RYFormPickerCell.m
//  RYForm
//
//  Created by xiaerfei on 16/5/16.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "RYFormPickerCell.h"
#import "RYFormRowInformation.h"
#import "UIViewExt.h"

@interface RYFormPickerCell () <UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView *ry_pickerView;

@property (nonatomic, strong) UIView *ry_inputAccessoryView;

@property (nonatomic, strong) UILabel     *ry_valueTextLabel;

@end

@implementation RYFormPickerCell

- (UIView *)inputView
{
    return self.ry_pickerView;
}

-(UIView *)inputAccessoryView
{
    return self.ry_inputAccessoryView;
}

- (BOOL)canBecomeFirstResponder
{
    return !self.rowInformation.isDisabled;
}
#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.rowInformation.pickerViewDataSourceArray.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
//    return [self.rowInformation.pickerViewDataSourceArray[component] count];
    if (component == 0) {
        return [self.rowInformation.pickerViewDataSourceArray[component] count];
    } else if (component == 1) {
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        NSString *priviceName = self.rowInformation.pickerViewDataSourceArray[0][rowProvince];
        NSArray *cityArray = self.rowInformation.pickerViewDataSourceArray[1][priviceName];
        return cityArray.count;
    } else if (component == 2) {
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        NSString *priviceName = self.rowInformation.pickerViewDataSourceArray[0][rowProvince];
        NSArray *cityArray = self.rowInformation.pickerViewDataSourceArray[1][priviceName];
        NSInteger rowCity = [pickerView selectedRowInComponent:1];
        NSArray *countryArray = self.rowInformation.pickerViewDataSourceArray[2][cityArray[rowCity]];
        return countryArray.count;
    }
    
    return 0;
}
#pragma mark - UIPickerViewDelegate
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
//    return self.rowInformation.pickerViewDataSourceArray[component][row];
    if (component == 0) {
        return self.rowInformation.pickerViewDataSourceArray[component][row];
    } else if (component == 1) {
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        NSString *priviceName = self.rowInformation.pickerViewDataSourceArray[0][rowProvince];
        NSArray *cityArray = self.rowInformation.pickerViewDataSourceArray[1][priviceName];
        return cityArray[row];
    } else if (component == 2) {
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        NSString *priviceName = self.rowInformation.pickerViewDataSourceArray[0][rowProvince];
        NSArray *cityArray = self.rowInformation.pickerViewDataSourceArray[1][priviceName];
        NSInteger rowCity = [pickerView selectedRowInComponent:1];
        NSArray *countryArray = self.rowInformation.pickerViewDataSourceArray[2][cityArray[rowCity]];
        return countryArray[row];
    }
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
//    NSLog(@"%@",self.rowInformation.pickerViewDataSourceArray[component][row]);
    if (component == 0) {
        
        
        
        [pickerView reloadComponent:1];
    }
}
#pragma mark - RYFormInformationCell
-(void)formInformationCellDidSelectedWithFormController:(RYFormViewController *)controller
{
    [self becomeFirstResponder];
}

#pragma mark - event responses
- (void)completeAction
{
    [self resignFirstResponder];
}
#pragma mark - private methods
- (void)autoLayoutSubViews
{
    CGFloat vTop = (self.rowInformation.rowHeight - 20)/2.0f;
    CGFloat pad = 5;
    self.ry_valueTextLabel.frame = CGRectMake(self.ry_textLabel.right + pad, vTop, ([UIScreen mainScreen].bounds.size.width - 20 - self.ry_textLabel.width - pad - 25), 20);
}
#pragma mark - getters

- (UIPickerView *)ry_pickerView
{
    if (_ry_pickerView == nil) {
        _ry_pickerView = [[UIPickerView alloc] init];
        _ry_pickerView.delegate   = self;
        _ry_pickerView.dataSource = self;
    }
    return _ry_pickerView;
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

@end
