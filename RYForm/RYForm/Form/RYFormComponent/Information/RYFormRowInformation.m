//
//  RYFormRowInformation.m
//  RYForm
//
//  Created by xiaerfei on 16/5/15.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "RYFormRowInformation.h"
#import "RYForm.h"
#import "RYFormBaseCell.h"

@interface RYFormRowInformation ()

@property (nonatomic, strong) RYFormBaseCell *baseCell;

@end


@implementation RYFormRowInformation

-(instancetype)init
{
    @throw [NSException exceptionWithName:NSGenericException reason:@"initWithTag:(NSString *)tag rowType:(NSString *)rowType title:(NSString *)title must be used" userInfo:nil];
}

-(instancetype)initWithTag:(NSString *)tag rowType:(NSString *)rowType title:(NSString *)title
{
    self = [super init];
    if (self) {
        _tag     = [tag copy];
        _rowType = [rowType copy];
        _title   = [title copy];
        self.rowHeight = 44;
        
        self.cellStyle          = UITableViewCellStyleDefault;
        self.titleTextAlignment = NSTextAlignmentLeft;
        self.valueTextAlignment = NSTextAlignmentRight;
        self.selectionStyle     = UITableViewCellSelectionStyleNone;
        self.accessoryType      = UITableViewCellAccessoryNone;
        self.stepCounterValue = 0;
        self.stepCounterMinimumValue = 0;
        self.stepCounterMaximumValue = 100;
        self.formRowValidatorType = RYFormRowValidatorTypeNotNull;
        
    }
    return self;
}

- (void)dealloc
{
    UITableViewCell *cell = self.baseCell;
    _baseCell = nil;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [cell class];
    });
    
    NSLog(@"RYFormRowInformation--->dealloc");
}

- (nonnull RYFormBaseCell *)cellForForm
{
    if (_baseCell == nil) {
        id cellClass = [RYForm cellClassesForRowInformationTypes][self.rowType];
        
        _baseCell = [[cellClass alloc] initWithStyle:self.cellStyle reuseIdentifier:nil];
        _baseCell.rowInformation = self;        
    }
    
    return _baseCell;
}

#pragma mark - validation
- (BOOL)valueIsEmpty
{
    return self.value == nil || [self.value isKindOfClass:[NSNull class]] || ([self.value respondsToSelector:@selector(length)] && [self.value length]==0);
}

- (BOOL)formRowValidatorValue
{
    BOOL result = NO;
    switch (self.formRowValidatorType) {
        case RYFormRowValidatorTypeNone:
            result = YES;
            break;
        case RYFormRowValidatorTypeNotNull:
            return ![self valueIsEmpty];
            break;
        case RYFormRowValidatorTypeRegex:
        {
            /// 验证是否为空
            if ([self valueIsEmpty]) {
                result = NO;
                break;
            }
            
            id value = self.value;
            if ([value isKindOfClass:[NSNumber class]]){
                value = [value stringValue];
            }
            if ([value isKindOfClass:[NSString class]] && [value length] > 0) {
                result = [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", self.regularExpression] evaluateWithObject:[value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
            } else {
                result = NO;
            }
        }
            break;
        default:
            result = NO;
            break;
    }
    self.isvalidator = result;
    return result;
    
}



@end
