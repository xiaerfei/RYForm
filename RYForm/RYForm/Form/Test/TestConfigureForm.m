//
//  TestConfigureForm.m
//  RYForm
//
//  Created by xiaerfei on 16/5/17.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "TestConfigureForm.h"

@implementation TestConfigureForm


- (RYFormInformation *)configureFormInformation
{
    
    RYFormInformation *formInformation = [[RYFormInformation alloc] init];
    
    formInformation.style = UITableViewStyleGrouped;
    
    RYFormSectionInformation *section0 = [[RYFormSectionInformation alloc] init];
    section0.headerHeight = 10;
    section0.footerHeight = 0.1;
    
    RYFormRowInformation *row00 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeText title:@"姓名"];
    row00.displayText = @"习大大";
    row00.isDisabled  = YES;
    [section0.formRows addObject:row00];
    
    RYFormRowInformation *row01 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeText title:@"身份证号"];
    row01.displayText = @"123456789012345678";
    row01.isDisabled  = YES;
    [section0.formRows addObject:row01];
    
    

    RYFormSectionInformation *section1 = [[RYFormSectionInformation alloc] init];
    RYFormRowInformation *row10 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeText title:@"公司名称"];
    row10.placeholderText = @"请输入";
    [section1.formRows addObject:row10];
    
    RYFormRowInformation *row11 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeNumber title:@"在该公司工作几个月"];
    row11.placeholderText = @"请输入";
    [section1.formRows addObject:row11];
    
    RYFormRowInformation *row12 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeText title:@"公司注册时间"];
    row12.placeholderText = @"请选择";
    [section1.formRows addObject:row12];
    
    RYFormRowInformation *row13 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeNumber title:@"当前经营地址使用时间"];
    row13.placeholderText = @"请输入";
    row13.accessoryType   = UITableViewCellAccessoryDisclosureIndicator;
    [section1.formRows addObject:row13];
    
    RYFormRowInformation *row14 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeNumber title:@"公司近半年含税营业额"];
    row14.placeholderText = @"请输入";
    [section1.formRows addObject:row14];

    
    
    RYFormSectionInformation *section2 = [[RYFormSectionInformation alloc] init];
    RYFormRowInformation *row20 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeText title:@"近两年内无逾期记录"];
    row20.placeholderText = @"请选择";
    row20.accessoryType   = UITableViewCellAccessoryDisclosureIndicator;
    [section2.formRows addObject:row20];
    
    RYFormRowInformation *row21 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeText title:@"手机号实名是否超过半年"];
    row21.placeholderText = @"请选择";
    row21.accessoryType   = UITableViewCellAccessoryDisclosureIndicator;
    [section2.formRows addObject:row21];
    
    RYFormSectionInformation *section3 = [[RYFormSectionInformation alloc] init];
    
    RYFormRowInformation *row30 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeStepCounter title:@"测试计步器"];
    row30.value = @(50);
    [section3.formRows addObject:row30];
    
    RYFormRowInformation *row31 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeBooleanSwitch title:@"测试Switch"];
    row31.value = @(YES);
    [section3.formRows addObject:row31];
    
    RYFormRowInformation *row32 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeBooleanCheck title:@"测试Check"];
    row32.value = @(YES);
    [section3.formRows addObject:row32];
    
    
    [formInformation.formSections addObjectsFromArray:@[section0,section1,section2,section3]];
    
    return formInformation;
}


@end
