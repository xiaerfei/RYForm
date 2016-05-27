//
//  RYFormViewController.h
//  RYForm
//
//  Created by xiaerfei on 16/5/15.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYFormDataConfigureDelegate.h"


@protocol RYFormViewControllerDelegate <NSObject>

@required
- (id <RYFormDataConfigureDelegate>)configureFormDataClass;

@optional
- (void)didSelectFormRow:(RYFormRowInformation *)formRow isClickCell:(BOOL)isClickCell;

- (void)formRowInformationValueHasChanged:(RYFormRowInformation *)formRow oldValue:(id)oldValue newValue:(id)newValue;

- (void)allFormRowInformationValueNotValidator:(NSArray *)notValidatorArray;

- (id)switchDisPlayValueToCompetentTypeWithFormRow:(RYFormRowInformation *)formRow;



@end

@interface RYFormViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) id<RYFormViewControllerDelegate> child;

@property (nonatomic, strong) UITableView *formTableView;

@property (nonatomic, strong) RYFormInformation *formInformation;

- (RYFormBaseCell *)updateFormRow:(RYFormRowInformation *)formRow;

- (void)formRowValueHasChanged:(RYFormRowInformation *)formRow oldValue:(id)oldValue newValue:(id)newValue;

- (void)switchNextDisplayCellsAtIndex:(NSInteger)index;

@end
