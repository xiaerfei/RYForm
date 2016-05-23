//
//  RYFormSectionInformation.h
//  RYForm
//
//  Created by xiaerfei on 16/5/15.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RYFormSectionInformation : NSObject
/// default is 0
@property (nonatomic, assign) CGFloat headerHeight;
/// default is 0
@property (nonatomic, assign) CGFloat footerHeight;

@property (nonatomic ,copy,readonly, nonnull) NSMutableArray * formRows;

/// default is nil
@property (nonatomic, strong, nullable) UIView *headerView;
/// default is nil
@property (nonatomic, strong, nullable) UIView *footerView;

@end
