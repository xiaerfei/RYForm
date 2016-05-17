//
//  RYForm.m
//  RYForm
//
//  Created by xiaerfei on 16/5/16.
//  Copyright © 2016年 二哥. All rights reserved.
//Information

#import "RYForm.h"
#import "RYFormBaseCell.h"
#import "RYFormTextFieldCell.h"
#import "RYFormTextViewCell.h"
#import "RYFormSwitchCell.h"
#import "RYFormCheckCell.h"
#import "RYFormDateCell.h"
#import "RYFormDatePickerCell.h"
#import "RYFormPickerCell.h"
#import "RYFormStepCounterCell.h"

NSString *const RYFormRowInformationTypeText                        = @"text";
NSString *const RYFormRowInformationTypeName                        = @"name";
NSString *const RYFormRowInformationTypeURL                         = @"url";
NSString *const RYFormRowInformationTypeEmail                       = @"email";
NSString *const RYFormRowInformationTypePassword                    = @"password";
NSString *const RYFormRowInformationTypeNumber                      = @"number";
NSString *const RYFormRowInformationTypePhone                       = @"phone";
NSString *const RYFormRowInformationTypeImage                       = @"image";
NSString *const RYFormRowInformationTypeDecimal                     = @"decimal";
NSString *const RYFormRowInformationTypeTextView                    = @"textView";
NSString *const RYFormRowInformationTypeSelectorActionSheet         = @"selectorActionSheet";
NSString *const RYFormRowInformationTypeSelectorAlertView           = @"selectorAlertView";
NSString *const RYFormRowInformationTypeSelectorPickerView          = @"selectorPickerView";
NSString *const RYFormRowInformationTypeSelectorPickerViewInline    = @"selectorPickerViewInline";
NSString *const RYFormRowInformationTypeSelectorLeftRight           = @"selectorLeftRight";
NSString *const RYFormRowInformationTypeSelectorSegmentedControl    = @"selectorSegmentedControl";
NSString *const RYFormRowInformationTypeDateInline                  = @"dateInline";
NSString *const RYFormRowInformationTypeDateTimeInline              = @"datetimeInline";
NSString *const RYFormRowInformationTypeTimeInline                  = @"timeInline";
NSString *const RYFormRowInformationTypeCountDownTimerInline        = @"countDownTimerInline";
NSString *const RYFormRowInformationTypeDate                        = @"date";
NSString *const RYFormRowInformationTypeDateTime                    = @"datetime";
NSString *const RYFormRowInformationTypeTime                        = @"time";
NSString *const RYFormRowInformationTypeCountDownTimer              = @"countDownTimer";
NSString *const RYFormRowInformationTypeDatePicker                  = @"datePicker";
NSString *const RYFormRowInformationTypePicker                      = @"picker";
NSString *const RYFormRowInformationTypeSlider                      = @"slider";
NSString *const RYFormRowInformationTypeBooleanCheck                = @"booleanCheck";
NSString *const RYFormRowInformationTypeBooleanSwitch               = @"booleanSwitch";
NSString *const RYFormRowInformationTypeStepCounter                 = @"stepCounter";

@implementation RYForm

+ (NSMutableDictionary *)cellClassesForRowInformationTypes
{
    static NSMutableDictionary * _cellClassesForRowInformationTypes;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _cellClassesForRowInformationTypes = [@{RYFormRowInformationTypeText:                   [RYFormTextFieldCell class],
                                               RYFormRowInformationTypeName:                    [RYFormTextFieldCell class],
                                               RYFormRowInformationTypePhone:                   [RYFormTextFieldCell class],
                                               RYFormRowInformationTypeURL:                     [RYFormTextFieldCell class],
                                               RYFormRowInformationTypeEmail:                   [RYFormTextFieldCell class],
                                               RYFormRowInformationTypeTextView:                [RYFormTextViewCell class],
                                               RYFormRowInformationTypeBooleanSwitch :          [RYFormSwitchCell class],
                                               RYFormRowInformationTypeBooleanCheck :           [RYFormCheckCell class],
                                               RYFormRowInformationTypeDate:                    [RYFormDateCell class],
                                               RYFormRowInformationTypeTime:                    [RYFormDateCell class],
                                               RYFormRowInformationTypeDateTime :               [RYFormDateCell class],
                                               RYFormRowInformationTypeCountDownTimer :         [RYFormDateCell class],
                                               RYFormRowInformationTypeDateInline:              [RYFormDateCell class],
                                               RYFormRowInformationTypeTimeInline:              [RYFormDateCell class],
                                               RYFormRowInformationTypeDateTimeInline:          [RYFormDateCell class],
                                               RYFormRowInformationTypeCountDownTimerInline :   [RYFormDateCell class],
                                               RYFormRowInformationTypeDatePicker :             [RYFormDatePickerCell class],
                                               RYFormRowInformationTypePicker :                 [RYFormPickerCell class],
                                               RYFormRowInformationTypeStepCounter:             [RYFormStepCounterCell class]
                                               } mutableCopy];
    });
    return _cellClassesForRowInformationTypes;
}


@end
