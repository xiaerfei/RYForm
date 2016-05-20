//
//  RYFormViewController.h
//  RYForm
//
//  Created by xiaerfei on 16/5/15.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYFormDataConfigure.h"


@protocol RYFormViewControllerDelegate <NSObject>

@required
- (id <RYFormDataConfigure>)configureFormDataClass;

@optional
- (void)didSelectFormRow:(RYFormRowInformation *)formRow;

- (void)formRowInformationValueHasChanged:(RYFormRowInformation *)formRow oldValue:(id)oldValue newValue:(id)newValue;

- (void)allFormRowInformationValueNotValidator:(NSArray *)notValidatorArray;



@end

@interface RYFormViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) id<RYFormViewControllerDelegate> child;

@property (nonatomic, strong) UITableView *formTableView;

@property (nonatomic, strong) RYFormInformation *formInformation;

- (RYFormBaseCell *)updateFormRow:(RYFormRowInformation *)formRow;

- (void)formRowValueHasChanged:(RYFormRowInformation *)formRow oldValue:(id)oldValue newValue:(id)newValue;

@end
