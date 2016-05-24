//
//  RYFormInformation.h
//  RYForm
//
//  Created by xiaerfei on 16/5/15.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYFormSectionInformation.h"
#import "RYFormRowInformation.h"

@interface RYFormInformation : NSObject

@property (nonatomic, copy, nonnull) NSMutableArray *formTypeSections;
/// default value is UITableViewStylePlain
@property (nonatomic, assign) UITableViewStyle style;

@property (nonatomic, assign, readonly) NSInteger currentDisplayTypeSctionIndex;

@property (nonatomic, weak, nullable) RYFormRowInformation *lastFormRow;
@property (nonatomic, weak, nullable) RYFormRowInformation *currentFormRow;

- (nullable RYFormRowInformation *)formRowAtIndex:(nonnull NSIndexPath *)indexPath;
- (nullable NSDictionary *)generateAllValue;
- (nullable RYFormRowInformation *)formRowWithTag:(nonnull NSString *)tag;

- (nullable NSArray *)formSections;

- (void)setCurrentDisplayTypeSctionAtIndex:(NSInteger)index;


@end
