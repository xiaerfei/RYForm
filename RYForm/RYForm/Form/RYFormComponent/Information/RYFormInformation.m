//
//  RYFormInformation.m
//  RYForm
//
//  Created by xiaerfei on 16/5/15.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "RYFormInformation.h"

@interface RYFormInformation ()

@property (nonatomic, assign, readwrite) NSInteger currentDisplayTypeSctionIndex;

@end

@implementation RYFormInformation

- (instancetype)init
{
    self = [super init];
    if (self) {
        _formTypeSections = [[NSMutableArray alloc] init];
        _style = UITableViewStylePlain;
        _currentDisplayTypeSctionIndex = 0;
    }
    return self;
}

- (void)dealloc
{
    NSArray *array = self.formTypeSections;
    _formTypeSections = nil;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [array class];
    });
    
    NSLog(@"RYFormInformation--->dealloc");
}

- (nullable NSArray *)formSections
{
    return self.formTypeSections[self.currentDisplayTypeSctionIndex];
}

- (void)setCurrentDisplayTypeSctionAtIndex:(NSInteger)index
{
    self.currentDisplayTypeSctionIndex = index;
}



- (nullable RYFormRowInformation *)formRowAtIndex:(nonnull NSIndexPath *)indexPath
{
    if ((self.formSections.count > indexPath.section) && [[self.formSections objectAtIndex:indexPath.section] formRows].count > indexPath.row){
        return [[[self.formSections objectAtIndex:indexPath.section] formRows] objectAtIndex:indexPath.row];
    }
    return nil;
}

- (nullable RYFormRowInformation *)formRowWithTag:(NSString *)tag
{
    __block RYFormRowInformation *tagRow = nil;
    for (RYFormSectionInformation *sections in self.formSections) {
        [sections.formRows enumerateObjectsUsingBlock:^(RYFormRowInformation *formRow, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([formRow.tag isEqualToString:tag]) {
                tagRow = formRow;
                *stop = YES;
            }
        }];
    }
    return tagRow;
}

/**
 *   @author 二哥, 16-05-21 10:05:03
 *
 *   将所有的Value生成 key - Value
 *
 *   @return 
 */
- (nullable NSDictionary *)generateAllValue
{
    NSMutableDictionary *allValue = [[NSMutableDictionary alloc] init];
    for (RYFormSectionInformation *sections in self.formSections) {
        [sections.formRows enumerateObjectsUsingBlock:^(RYFormRowInformation *formRow, NSUInteger idx, BOOL * _Nonnull stop) {
            if (formRow.isvalidator) {
                allValue[formRow.key] = formRow.value;
            }
        }];
    }
    return allValue;
}

@end

