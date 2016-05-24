//
//  Example3ConfigureForm.m
//  RYForm
//
//  Created by xiaerfei on 16/5/24.
//  Copyright © 2016年 Rongyu100. All rights reserved.
//

#import "Example3ConfigureForm.h"
#import "UIView+SDAutoLayout.h"

@implementation Example3ConfigureForm

- (RYFormInformation *)configureFormInformation
{
    RYFormInformation *formInformation = [[RYFormInformation alloc] init];
    formInformation.style = UITableViewStyleGrouped;
    RYFormSectionInformation *section0 = [[RYFormSectionInformation alloc] init];
    section0.headerHeight = 10;
    section0.footerHeight = 0.1;
    
    RYFormRowInformation *row00 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeText title:@"姓名"];
    row00.displayText = @"习大大";
    row00.value       = @"习大大";
    row00.key         = @"00";
    row00.isDisabled  = YES;
    [section0.formRows addObject:row00];
    
    RYFormRowInformation *row01 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeText title:@"身份证号"];
    row01.displayText = @"123456789012345678";
    row01.value       = @"123456789012345678";
    row01.isDisabled  = YES;
    row01.key         = @"01";
    [section0.formRows addObject:row01];
    
    RYFormSectionInformation *section1 = [[RYFormSectionInformation alloc] init];
    RYFormRowInformation *row10 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeText title:@"公司名称"];
    row10.placeholderText       = @"请输入";
    row10.key                   = @"10";
    [section1.formRows addObject:row10];
    
    RYFormRowInformation *row11 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeNumber title:@"在该公司工作几个月"];
    row11.placeholderText = @"请输入";
    row11.key             = @"11";
    row11.unitsText       = @"月";
    [section1.formRows addObject:row11];
    
    RYFormRowInformation *row12 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeDate title:@"公司注册时间"];
    row12.placeholderText = @"请选择";
    row12.accessoryType   = UITableViewCellAccessoryDisclosureIndicator;
    row12.key             = @"12";
    [section1.formRows addObject:row12];
    
    RYFormRowInformation *row13 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeNumber title:@"当前经营地址使用时间"];
    row13.placeholderText = @"请输入";
    row13.key             = @"13";
    row13.unitsText       = @"月";
    [section1.formRows addObject:row13];
    
    RYFormRowInformation *row14 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeDecimal title:@"公司近半年含税营业额"];
    row14.placeholderText = @"请输入";
    row14.key             = @"14";
    row14.unitsText       = @"万元";
    [section1.formRows addObject:row14];
    
    RYFormSectionInformation *section2 = [[RYFormSectionInformation alloc] init];
    section2.headerHeight     = 40;
    UIView *section2HearView  = [[UIView alloc] init];
    UILabel *tipsLabel        = [[UILabel alloc] init];
    tipsLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    [section2HearView addSubview:tipsLabel];
    tipsLabel.text = @"公司最近半年的含税营业额指交了营业税或者增值税部分的营业额，不包含不含税的营业额";
    tipsLabel.numberOfLines = 0;
    tipsLabel.font = [UIFont systemFontOfSize:12];
    tipsLabel.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 40, 0, 15));
    section2.headerView = section2HearView;
    RYFormRowInformation *row20 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeText title:@"近两年内无逾期记录"];
    row20.placeholderText = @"请选择";
    row20.accessoryType   = UITableViewCellAccessoryDisclosureIndicator;
    row20.key             = @"20";
    [section2.formRows addObject:row20];
    
    RYFormRowInformation *row21 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeText title:@"手机号实名是否超过半年"];
    row21.placeholderText = @"请选择";
    row21.accessoryType   = UITableViewCellAccessoryDisclosureIndicator;
    row21.key             = @"21";
    [section2.formRows addObject:row21];
    
    RYFormRowInformation *row22 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeSelectorActionSheet title:@"测试转换cell"];
    row22.placeholderText = @"请选择";
    row22.actionSheetArray = @[@"0",@"1"];
    row22.accessoryType   = UITableViewCellAccessoryDisclosureIndicator;
    row22.key             = @"22";
    [section2.formRows addObject:row22];
    RYFormSectionInformation *section3 = [[RYFormSectionInformation alloc] init];
    
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
    
    
    [formInformation.formTypeSections addObject:@[section0,section1,section2,section3]];
    [formInformation.formTypeSections addObject:@[section0,section1,section2]];
    return formInformation;
}



@end
