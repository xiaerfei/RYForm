//
//  RYForm.h
//  RYForm
//
//  Created by xiaerfei on 16/5/16.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import <UIKit/UIKit.h>


extern NSString *const RYFormRowInformationTypeText;
extern NSString *const RYFormRowInformationTypeName;
extern NSString *const RYFormRowInformationTypeURL;
extern NSString *const RYFormRowInformationTypeEmail;
extern NSString *const RYFormRowInformationTypePassword;
extern NSString *const RYFormRowInformationTypeNumber;
extern NSString *const RYFormRowInformationTypePhone;
extern NSString *const RYFormRowInformationTypeImage;
extern NSString *const RYFormRowInformationTypeDecimal;
extern NSString *const RYFormRowInformationTypeContentTips;
extern NSString *const RYFormRowInformationTypeTextView;
extern NSString *const RYFormRowInformationTypeNoteTextView;
extern NSString *const RYFormRowInformationTypeSelectorActionSheet;
extern NSString *const RYFormRowInformationTypeSelectorAlertView;
extern NSString *const RYFormRowInformationTypeSelectorPickerView;
extern NSString *const RYFormRowInformationTypeSelectorPickerViewInline;
extern NSString *const RYFormRowInformationTypeDate;
extern NSString *const RYFormRowInformationTypeDatePicker;
extern NSString *const RYFormRowInformationTypePicker;
extern NSString *const RYFormRowInformationTypeSlider;
extern NSString *const RYFormRowInformationTypeBooleanCheck;
extern NSString *const RYFormRowInformationTypeBooleanSwitch;
extern NSString *const RYFormRowInformationTypeStepCounter;
extern NSString *const RYFormRowInformationTypeCustom;

@interface RYForm : NSObject

+ (NSMutableDictionary *)cellClassesForRowInformationTypes;

+ (CGSize)boundingWith:(NSString *)text attributes:(NSDictionary *)attributes size:(CGSize)size;

@end
