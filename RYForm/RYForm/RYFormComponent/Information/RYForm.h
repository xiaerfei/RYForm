//
//  RYForm.h
//  RYForm
//
//  Created by xiaerfei on 16/5/16.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RYFormBaseCell.h"
#import "RYFormTextFieldCell.h"
#import "RYFormTextViewCell.h"
#import "RYFormSwitchCell.h"
#import "RYFormCheckCell.h"
#import "RYFormDateCell.h"
#import "RYFormDatePickerCell.h"
#import "RYFormPickerCell.h"
#import "RYFormStepCounterCell.h"



extern NSString *const XLFormRowInformationTypeText;
extern NSString *const XLFormRowInformationTypeName;
extern NSString *const XLFormRowInformationTypeURL;
extern NSString *const XLFormRowInformationTypeEmail;
extern NSString *const XLFormRowInformationTypePassword;
extern NSString *const XLFormRowInformationTypeNumber;
extern NSString *const XLFormRowInformationTypePhone;
extern NSString *const XLFormRowInformationTypeImage;
extern NSString *const XLFormRowInformationTypeDecimal;
extern NSString *const XLFormRowInformationTypeTextView;
extern NSString *const XLFormRowInformationTypeSelectorActionSheet;
extern NSString *const XLFormRowInformationTypeSelectorAlertView;
extern NSString *const XLFormRowInformationTypeSelectorPickerView;
extern NSString *const XLFormRowInformationTypeSelectorPickerViewInline;
extern NSString *const XLFormRowInformationTypeSelectorLeftRight;
extern NSString *const XLFormRowInformationTypeSelectorSegmentedControl;
extern NSString *const XLFormRowInformationTypeDateInline;
extern NSString *const XLFormRowInformationTypeDateTimeInline;
extern NSString *const XLFormRowInformationTypeTimeInline;
extern NSString *const XLFormRowInformationTypeCountDownTimerInline;
extern NSString *const XLFormRowInformationTypeDate;
extern NSString *const XLFormRowInformationTypeDateTime;
extern NSString *const XLFormRowInformationTypeTime;
extern NSString *const XLFormRowInformationTypeCountDownTimer;
extern NSString *const XLFormRowInformationTypeDatePicker;
extern NSString *const XLFormRowInformationTypePicker;
extern NSString *const XLFormRowInformationTypeSlider;
extern NSString *const XLFormRowInformationTypeBooleanCheck;
extern NSString *const XLFormRowInformationTypeBooleanSwitch;
extern NSString *const XLFormRowInformationTypeStepCounter;


@interface RYForm : NSObject

+ (NSMutableDictionary *)cellClassesForRowInformationTypes;

@end
