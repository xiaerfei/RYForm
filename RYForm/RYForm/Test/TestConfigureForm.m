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
    
    RYFormSectionInformation *section = [[RYFormSectionInformation alloc] init];
    section.headerHeight = 10;
    section.footerHeight = 0.1;
    RYFormRowInformation *row = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeText title:@"test"];
    row.displayText = @"ldfkjalsdkfjal;sdkfalkdf";
    row.placeholderText = @"qqqqqqqqqqqqq";
    row.rowHeight = 88;
    [section.formRows addObject:row];
    
    RYFormRowInformation *row1 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypePhone title:@"test2"];
    row1.displayText = @"123456789";
    row1.placeholderText = @"qqqqqqqqqqqqq";
    [section.formRows addObject:row1];
    
    RYFormRowInformation *row2 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeEmail title:@"test3"];
    row2.displayText = @"123456789";
    row2.placeholderText = @"qqqqqqqqqqqqq";
    [section.formRows addObject:row2];
    
    RYFormRowInformation *row3 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeName title:@"test4"];
    row3.displayText = @"123456789";
    row3.placeholderText = @"qqqqqqqqqqqqq";
    [section.formRows addObject:row3];
    
    
    RYFormSectionInformation *section1 = [[RYFormSectionInformation alloc] init];
    RYFormRowInformation *row4 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeName title:@"test4"];
    row4.displayText = @"123456789";
    row4.placeholderText = @"qqqqqqqqqqqqq";
    [section1.formRows addObject:row4];
    
    
    
    RYFormRowInformation *row5 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeName title:@"test4"];
    row5.displayText = @"123456789";
    row5.placeholderText = @"qqqqqqqqqqqqq";
    [section1.formRows addObject:row5];
    
    
    
    RYFormRowInformation *row6 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeName title:@"test4"];
    row6.displayText = @"123456789";
    row6.placeholderText = @"qqqqqqqqqqqqq";
    [section1.formRows addObject:row6];
    
    
    RYFormSectionInformation *section2 = [[RYFormSectionInformation alloc] init];
    RYFormRowInformation *row7 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeName title:@"test4"];
    row7.displayText = @"123456789";
    row7.placeholderText = @"qqqqqqqqqqqqq";
    [section2.formRows addObject:row7];
    
    
    RYFormRowInformation *row8 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeName title:@"test4"];
    row8.displayText = @"123456789";
    row8.placeholderText = @"qqqqqqqqqqqqq";
    [section2.formRows addObject:row8];
    
    
    RYFormRowInformation *row9 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeName title:@"test4"];
    row9.displayText = @"123456789";
    row9.placeholderText = @"qqqqqqqqqqqqq";
    [section2.formRows addObject:row9];
    
    RYFormRowInformation *row10 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeName title:@"test4"];
    row10.displayText = @"123456789";
    row10.placeholderText = @"qqqqqqqqqqqqq";
    [section2.formRows addObject:row10];
    
    RYFormRowInformation *row11 = [[RYFormRowInformation alloc] initWithTag:@"" rowType:RYFormRowInformationTypeName title:@"test4"];
    row11.displayText = @"123456789";
    row11.placeholderText = @"qqqqqqqqqqqqq";
    [section2.formRows addObject:row11];
    
    
    
    [formInformation.formSections addObjectsFromArray:@[section,section1,section2]];
    
    return formInformation;
}


@end
