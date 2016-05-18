//
//  UIView+RYFormAdditions.h
//  RYForm
//
//  Created by xiaerfei on 16/5/17.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYFormInformationCell.h"

@interface UIView (RYFormAdditions)

- (UIView *)findFirstResponder;
- (UITableViewCell<RYFormInformationCell> *)formInformationCell;
@end
