//
//  RYFormBaseCell.h
//  RYForm
//
//  Created by xiaerfei on 16/5/15.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYFormInformationCell.h"

@class RYFormRowInformation;

@interface RYFormBaseCell : UITableViewCell <RYFormInformationCell>

@property (nonatomic, weak) RYFormRowInformation * rowInformation;

@property (nonatomic, readonly, strong) UILabel     *ry_textLabel;

@end
