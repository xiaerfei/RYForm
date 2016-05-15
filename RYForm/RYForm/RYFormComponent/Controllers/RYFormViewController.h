//
//  RYFormViewController.h
//  RYForm
//
//  Created by xiaerfei on 16/5/15.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SDAutoLayout.h"
#import "RYFormInformation.h"


@interface RYFormViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *formTableView;

@property (nonatomic, strong) RYFormInformation *formInformation;

@end
