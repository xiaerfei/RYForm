//
//  UIView+RYFormAdditions.m
//  RYForm
//
//  Created by xiaerfei on 16/5/17.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "UIView+RYFormAdditions.h"
@implementation UIView (RYFormAdditions)

- (UIView *)findFirstResponder
{
    if (self.isFirstResponder) {
        return self;
    }
    for (UIView *subView in self.subviews) {
        UIView *firstResponder = [subView findFirstResponder];
        if (firstResponder != nil) {
            return firstResponder;
        }
    }
    return nil;
}

- (UITableViewCell<RYFormInformationCell> *)formInformationCell
{
    if ([self isKindOfClass:[UITableViewCell class]]) {
        if ([self conformsToProtocol:@protocol(RYFormInformationCell)]){
            return (UITableViewCell<RYFormInformationCell> *)self;
        }
        return nil;
    }
    if (self.superview) {
        UITableViewCell<RYFormInformationCell> * tableViewCell = [self.superview formInformationCell];
        if (tableViewCell != nil) {
            return tableViewCell;
        }
    }
    return nil;
}


@end
