//
//  Examp2ConfigureForm.m
//  RYForm
//
//  Created by xiaerfei on 16/5/24.
//  Copyright © 2016年 Rongyu100. All rights reserved.
//

#import "Examp2ConfigureForm.h"
#import "UIView+SDAutoLayout.h"


@implementation Examp2ConfigureForm

- (RYFormInformation *)configureFormInformation
{
    RYFormInformation *formInformation = [[RYFormInformation alloc] init];
    formInformation.style = UITableViewStyleGrouped;
    RYFormSectionInformation *section0 = [[RYFormSectionInformation alloc] init];
    section0.headerHeight = 40;
    section0.footerHeight = 0.1;
    
    UIView *section0HeaderView = [[UIView alloc] init];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tiptype"]];
    [section0HeaderView addSubview:imageView];
    imageView.sd_layout.centerYEqualToView(section0HeaderView).widthIs(20).heightIs(20).leftSpaceToView(section0HeaderView,15);
    
    UILabel *label = [[UILabel alloc] init];
    [section0HeaderView addSubview:label];
    
    label.text = @"请填写完整下列借款人信息后进行问卷调查";
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1];
    label.sd_layout.centerYEqualToView(section0HeaderView).heightIs(20).leftSpaceToView(imageView,2).rightSpaceToView(section0HeaderView,10);
    
    section0.headerView = section0HeaderView;
    
    RYFormRowInformation *row00 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeText title:@"姓名"];
    row00.placeholderText = @"请填写借款人姓名";
    row00.key             = @"00";
    row00.isRealTimeChange = YES;
    [section0.formRows addObject:row00];
    
    RYFormRowInformation *row01 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeText title:@"身份证号"];
    row01.placeholderText = @"请填写借款人身份证号";
    row01.key             = @"01";
    row01.isRealTimeChange = YES;
    row01.formRowValidatorType = RYFormRowValidatorTypeValidateIdentityCardNo;
    [section0.formRows addObject:row01];
    
    
    [formInformation.formTypeSections addObject:@[section0]];
    return formInformation;
}


@end
