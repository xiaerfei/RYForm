//
//  RYFormRowInformation.h
//  RYForm
//
//  Created by xiaerfei on 16/5/15.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef NS_ENUM(NSInteger,RYFormRowValidatorType) {
    /// 不验证
    RYFormRowValidatorTypeNone                   = 1,
    /// 验证不为空
    RYFormRowValidatorTypeNotNull                = 2,
    /// 验证身份证
    RYFormRowValidatorTypeValidateIdentityCardNo = 3,
    /// 验证邮箱
    RYFormRowValidatorTypeValidateEmail          = 4,
    /// 验证URL
    RYFormRowValidatorTypeValidateURL            = 5,
};


@class RYFormBaseCell;
@class RYFormViewController;
@interface RYFormRowInformation : NSObject
 
@property (nonatomic, weak,   nullable)         RYFormViewController *currentController;
@property (nonatomic, strong, nonnull)          id cellClass;
@property (nonatomic, readwrite, nullable)      NSString * tag;
@property (nonatomic, readonly, copy,nullable)  NSString * rowType;
@property (nonatomic, copy, nullable)           NSString * title;
@property (nonatomic, assign, readonly)         CGSize     titleSize;
@property (nonatomic, copy, nullable)           id         value;
@property (nonatomic, copy, nullable)           NSString * key;
@property (nonatomic, copy, nullable)           NSString * displayText;
@property (nonatomic, copy, nullable)           NSString * contentTips;

/// default is UITableViewCellStyleDefault
@property (nonatomic, assign) UITableViewCellStyle            cellStyle;
// default is UITableViewCellAccessoryNone. use to set standard type
@property (nonatomic, assign) UITableViewCellAccessoryType    accessoryType;
/// default is UITableViewCellSelectionStyleNone.
@property (nonatomic, assign) UITableViewCellSelectionStyle   selectionStyle;
/// default is 44
@property (nonatomic, assign) CGFloat                         rowHeight;
/// 
@property(nullable, nonatomic,copy)   NSAttributedString *attributedText;
/// default UITextField use
@property (nonatomic, copy, nullable) NSString  *placeholderText;
/// default is NSLeftTextAlignment
@property (nonatomic, assign) NSTextAlignment   titleTextAlignment;
/// default is NSTextAlignmentRight
@property (nonatomic, assign) NSTextAlignment   valueTextAlignment;
/// default is blackColor
@property (nonatomic, strong, nullable) UIColor *normalTitleColor;
/// default is blackColor
@property (nonatomic, strong, nullable) UIColor *disabledTitleColor;
/// default is blackColor
@property (nonatomic, strong, nullable) UIColor *normalValueColor;
/// default is blackColor
@property (nonatomic, strong, nullable) UIColor *disabledValueColor;
/// 获取实时变化的值
@property (nonatomic, assign) BOOL isRealTimeChange;
/// 单位
@property (nonatomic, copy, nullable) NSString  *unitsText;
/// 输入字数限制 default is 100
@property (nonatomic, assign) NSInteger wordLengthLimite;


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

@property (nonatomic, assign) BOOL isDisabled;
@property (nonatomic, assign) BOOL isHidden;
@property (nonatomic, assign) BOOL isRequired;

@property (nonatomic, assign) BOOL isvalidator;
/// default is RYFormRowValidatorTypeNotNull
@property (nonatomic, assign) RYFormRowValidatorType formRowValidatorType;

-(nonnull instancetype)initWithTag:(nullable NSString *)tag rowType:(nonnull NSString *)rowType title:(nullable NSString *)title;

-(nonnull RYFormBaseCell *)cellForForm;

- (BOOL)formRowValidatorValue;

@end
