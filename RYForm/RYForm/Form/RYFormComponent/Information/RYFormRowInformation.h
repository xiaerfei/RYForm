//
//  RYFormRowInformation.h
//  RYForm
//
//  Created by xiaerfei on 16/5/15.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RYFormBaseCell;

@interface RYFormRowInformation : NSObject
 

@property (nonatomic, strong, nonnull)          id cellClass;
@property (nonatomic, readwrite, nullable)      NSString * tag;
@property (nonatomic, readonly, copy,nullable)  NSString * rowType;
@property (nonatomic, copy, nullable)           NSString * title;
@property (nonatomic, copy, nullable)           id value;
@property (nonatomic, copy, nullable)           NSString *displayText;
/// default UITextField use
@property (nonatomic, copy, nullable)           NSString *placeholderText;
/// default is UITableViewCellStyleDefault
@property (nonatomic, assign) UITableViewCellStyle cellStyle;
// default is UITableViewCellAccessoryNone. use to set standard type
@property (nonatomic) UITableViewCellAccessoryType    accessoryType;
/// default is 44
@property (nonatomic, assign) CGFloat rowHeight;
/// default is UITableViewCellSelectionStyleNone.
@property (nonatomic, assign) UITableViewCellSelectionStyle   selectionStyle;
/// default is NSLeftTextAlignment
@property (nonatomic, assign) NSTextAlignment                 titleTextAlignment;
/// default is NSTextAlignmentRight
@property (nonatomic, assign) NSTextAlignment                 valueTextAlignment;
/// default is blackColor
@property (nonatomic, strong, nullable) UIColor *normalTitleColor;
/// default is blackColor
@property (nonatomic, strong, nullable) UIColor *disabledTitleColor;
/// default is blackColor
@property (nonatomic, strong, nullable) UIColor *normalValueColor;
/// default is blackColor
@property (nonatomic, strong, nullable) UIColor *disabledValueColor;

// default is 0. sends UIControlEventValueChanged. clamped to min/max
@property(nonatomic, assign) double stepCounterValue;
// default 0. must be less than maximumValue
@property(nonatomic, assign) double stepCounterMinimumValue;
// default 100. must be greater than minimumValue
@property(nonatomic, assign) double stepCounterMaximumValue;
/// default UIActionSheet use
@property (nonatomic, copy, nullable) NSArray *actionSheetArray;
/// default UIPickerView use
@property (nonatomic, copy, nullable) NSArray *pickerViewDataSourceArray;
/// 正则表达式
@property (nonatomic, copy, nullable) NSString *regularExpression;

@property (nonatomic, assign) BOOL isDisabled;
@property (nonatomic, assign) BOOL isHidden;
@property (nonatomic, assign) BOOL isRequired;

-(nonnull instancetype)initWithTag:(nullable NSString *)tag rowType:(nonnull NSString *)rowType title:(nullable NSString *)title;

-(nonnull RYFormBaseCell *)cellForForm;

@end
