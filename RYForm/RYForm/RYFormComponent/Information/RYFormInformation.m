//
//  RYFormInformation.m
//  RYForm
//
//  Created by xiaerfei on 16/5/15.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "RYFormInformation.h"

@implementation RYFormInformation

- (instancetype)init
{
    self = [super init];
    if (self) {
        _formSections = [[NSMutableArray alloc] init];
    }
    return self;
}


- (nullable RYFormRowInformation *)formRowAtIndex:(nonnull NSIndexPath *)indexPath
{
    if ((self.formSections.count > indexPath.section) && [[self.formSections objectAtIndex:indexPath.section] formRows].count > indexPath.row){
        return [[[self.formSections objectAtIndex:indexPath.section] formRows] objectAtIndex:indexPath.row];
    }
    return nil;
}



@end
