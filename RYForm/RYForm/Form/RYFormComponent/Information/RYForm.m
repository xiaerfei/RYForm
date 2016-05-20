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
#import "RYFormPickerCell.h"
#import "RYFormStepCounterCell.h"
#import "RYFormActionSheetCell.h"

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
NSString *const RYFormRowInformationTypeDate                        = @"date";
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
        _cellClassesForRowInformationTypes = [@{RYFormRowInformationTypeText:                    [RYFormTextFieldCell class],
                                                RYFormRowInformationTypeName:                    [RYFormTextFieldCell class],
                                                RYFormRowInformationTypePhone:                   [RYFormTextFieldCell class],
                                                RYFormRowInformationTypeURL:                     [RYFormTextFieldCell class],
                                                RYFormRowInformationTypeEmail:                   [RYFormTextFieldCell class],
                                                RYFormRowInformationTypeNumber:                  [RYFormTextFieldCell class],
                                                RYFormRowInformationTypeDecimal:                 [RYFormTextFieldCell class],
                                                RYFormRowInformationTypeTextView:                [RYFormTextViewCell class],
                                                RYFormRowInformationTypeBooleanSwitch :          [RYFormSwitchCell class],
                                                RYFormRowInformationTypeBooleanCheck :           [RYFormCheckCell class],
                                                RYFormRowInformationTypeDate:                    [RYFormDateCell class],
                                                RYFormRowInformationTypePicker :                 [RYFormPickerCell class],
                                                RYFormRowInformationTypeStepCounter:             [RYFormStepCounterCell class],
                                                RYFormRowInformationTypeSelectorActionSheet:     [RYFormActionSheetCell class]
                                               } mutableCopy];
    });
    return _cellClassesForRowInformationTypes;
}

+ (CGSize)boundingWith:(NSString *)text attributes:(NSDictionary *)attributes size:(CGSize)size
{
    CGSize textSize = [text boundingRectWithSize:size // 用于计算文本绘制时占据的矩形块
                                                  options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading // 文本绘制时的附加选项
                                               attributes:attributes        // 文字的属性
                                                  context:nil].size; // context上下
    return textSize;
}



@end
