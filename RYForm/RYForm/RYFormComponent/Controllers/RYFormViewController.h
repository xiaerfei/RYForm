//
//  RYFormViewController.h
//  RYForm
//
//  Created by xiaerfei on 16/5/15.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SDAutoLayout.h"
#import "RYFormDataConfigure.h"


@protocol RYFormViewControllerDelegate <NSObject>

- (id <RYFormDataConfigure>)configureFormDataClass;

@end

@interface RYFormViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) id<RYFormViewControllerDelegate> child;

@property (nonatomic, strong) UITableView *formTableView;

@property (nonatomic, strong) RYFormInformation *formInformation;



@end
