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

@property (nonatomic, copy, nonnull) NSMutableArray *formSections;

- (nullable RYFormRowInformation *)formRowAtIndex:(nonnull NSIndexPath *)indexPath;

@end
