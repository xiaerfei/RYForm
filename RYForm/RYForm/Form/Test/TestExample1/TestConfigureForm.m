//
//  TestConfigureForm.m
//  RYForm
//
//  Created by xiaerfei on 16/5/17.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "TestConfigureForm.h"
#import "UIView+SDAutoLayout.h"

@implementation TestConfigureForm


- (RYFormInformation *)configureFormInformation
{
    RYFormInformation *formInformation = [[RYFormInformation alloc] init];
    formInformation.style = UITableViewStyleGrouped;

    RYFormSectionInformation *section3 = [[RYFormSectionInformation alloc] init];
    
    RYFormRowInformation *row300 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeText title:@"测试Text"];
    row300.placeholderText = @"请输入";
    row300.key             = @"300";
    [section3.formRows addObject:row300];
    
    RYFormRowInformation *row30 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeStepCounter title:@"测试计步器"];
    row30.value = @(50);
    row30.key   = @"30";
    [section3.formRows addObject:row30];
    
    RYFormRowInformation *row31 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeBooleanSwitch title:@"测试Switch"];
    row31.value = @(YES);
    row31.key   = @"31";
    [section3.formRows addObject:row31];
    
    RYFormRowInformation *row32 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeBooleanCheck title:@"测试Check"];
    row32.value = @(YES);
    row32.key   = @"32";
    [section3.formRows addObject:row32];
    
    //RYFormRowInformationTypeDate
    RYFormRowInformation *row33 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeDate title:@"测试Date"];
    row33.key = @"33";
    [section3.formRows addObject:row33];
    
    RYFormRowInformation *row34 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeSelectorActionSheet title:@"测试UIActionSheet"];
    row34.actionSheetArray = @[@"否",@"是"];
    row34.key              = @"34";
    [section3.formRows addObject:row34];
    //RYFormRowInformationTypePicker
    RYFormRowInformation *row35 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypePicker title:@"测试UIPickerView"];
    row35.key = @"35";
    NSArray *province  = @[@"北京", @"广西", @"广东"];
    //市
    NSDictionary *city = @{
                           @"北京":@[@"朝阳区", @"东城区", @"西城区"],
                           @"广西":@[@"桂林市", @"南宁市"],
                           @"广东":@[@"惠州市", @"广州市", @"深圳市",@"东莞市"]};
    //县区
    NSDictionary *country = @{
                              @"朝阳区":@[@"朝阳区1", @"朝阳区2", @"朝阳区3"],
                              @"东城区":@[@"东城区1", @"东城区2",@"东城区3",@"东城区4"],
                              @"西城区":@[@"西城区1", @"西城区2", @"西城区3",@"西城区4"],
                              @"桂林市":@[@"桂林市1", @"桂林市2", @"桂林市3"],
                              @"南宁市":@[@"南宁市1", @"南宁市2",@"南宁市3",@"南宁市4"],
                              @"惠州市":@[@"惠州市1", @"惠州市2", @"惠州市3",@"惠州市4"],
                              @"广州市":@[@"广州市1", @"广州市2", @"广州市3"],
                              @"深圳市":@[@"深圳市1", @"深圳市2",@"深圳市3",@"深圳市4"],
                              @"东莞市":@[@"东莞市1", @"东莞市2", @"东莞市3",@"东莞市4"],
                              };
    row35.pickerViewDataSourceArray = @[province,city,country];
    [section3.formRows addObject:row35];
    
    RYFormRowInformation *row36 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeNoteTextView title:@"备注:"];
    row36.rowHeight = 100;
    row36.placeholderText = @"请输入...";
    row36.wordLengthLimite = 10;
    row36.key       = @"36";
    [section3.formRows addObject:row36];
    
    
    [formInformation.formTypeSections addObject:@[section3]];
    return formInformation;
}


@end
