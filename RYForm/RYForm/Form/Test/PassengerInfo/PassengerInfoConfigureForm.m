//
//  PassengerInfoConfigureForm.m
//  RYForm
//
//  Created by rongyu100 on 2017/6/8.
//  Copyright © 2017年 Rongyu100. All rights reserved.
//

#import "PassengerInfoConfigureForm.h"
#import "DeleteButtonCell.h"

@implementation PassengerInfoConfigureForm

- (RYFormInformation *)configureFormInformation {
    RYFormInformation *formInformation = [[RYFormInformation alloc] init];
    formInformation.style = UITableViewStyleGrouped;
    
    RYFormSectionInformation *section01 = [[RYFormSectionInformation alloc] init];
    section01.headerHeight = 10;
    section01.footerHeight = 5;
    RYFormRowInformation *usernameRow = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeText title:@"姓名"];
    usernameRow.placeholderText = @"请输入姓名";
    usernameRow.key             = @"username";
    [section01.formRows addObject:usernameRow];
    
    RYFormRowInformation *firstnameRow = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeText title:@"姓(英)"];
    firstnameRow.placeholderText = @"请输入姓";
    firstnameRow.key             = @"firstname";
    [section01.formRows addObject:firstnameRow];
    
    RYFormRowInformation *lastnameRow = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeText title:@"名(英)"];
    lastnameRow.placeholderText = @"请输入名";
    lastnameRow.key             = @"lastname";
    [section01.formRows addObject:lastnameRow];
    
    
    
    RYFormSectionInformation *section02 = [[RYFormSectionInformation alloc] init];
    section02.headerHeight = 5;
    section02.footerHeight = 5;
    RYFormRowInformation *phoneRow = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeText title:@"手机号"];
    phoneRow.placeholderText = @"请输入手机号";
    phoneRow.key             = @"phone";
    [section02.formRows addObject:phoneRow];

    RYFormSectionInformation *section03 = [[RYFormSectionInformation alloc] init];
    section03.headerHeight = 5;
    RYFormRowInformation *passportRow = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeSelectorActionSheet title:@"证件类型"];
    passportRow.actionSheetArray = @[@"二代身份证",@"护照",@"台湾通行证",@"港澳通行证"];
    passportRow.placeholderText = @"请选择";
    passportRow.key             = @"passport";
    passportRow.accessoryType   = UITableViewCellAccessoryDisclosureIndicator;
    [section03.formRows addObject:passportRow];
    
    RYFormRowInformation *passportNumRow = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeText title:@"证件号码"];
    passportNumRow.placeholderText = @"请输入证件号码";
    passportNumRow.key             = @"passportNum";
    [section03.formRows addObject:passportNumRow];
    
    RYFormRowInformation *deleteBtnRow = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeCustom title:@"删除证件"];
    deleteBtnRow.cellClass = [DeleteButtonCell class];
    [section03.formRows addObject:deleteBtnRow];

    [formInformation.formTypeSections addObject:@[section01,section02,section03]];
    return formInformation;
}


@end
