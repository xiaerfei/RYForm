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
 

@property (nonatomic, strong, nonnull)     id cellClass;
@property (nonatomic, readwrite, nullable) NSString * tag;
@property (nonatomic, readonly, copy,nullable)  NSString * rowType;
@property (nonatomic, copy, nullable)       NSString * title;
@property (nonatomic, copy, nullable)       id value;
@property (nonatomic, copy, nullable)       NSString *displayText;
@property (nonatomic, copy, nullable)       NSString *placeholderText;
@property (nonatomic, assign) UITableViewCellStyle cellStyle;

@property (nonatomic, assign) UITableViewCellSelectionStyle   selectionStyle;             // default is UITableViewCellSelectionStyleBlue.

@property (nonatomic, strong, nullable) UIColor *normalColor;
@property (nonatomic, strong, nullable) UIColor *disabledColor;

@property (nonatomic, assign) BOOL isDisabled;
@property (nonatomic, assign) BOOL isHidden;
@property (nonatomic, assign) BOOL isRequired;

-(nonnull instancetype)initWithTag:(nullable NSString *)tag rowType:(nonnull NSString *)rowType title:(nullable NSString *)title;

-(nonnull RYFormBaseCell *)cellForForm;

@end
