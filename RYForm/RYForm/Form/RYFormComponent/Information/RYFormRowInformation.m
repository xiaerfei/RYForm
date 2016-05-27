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
#import "ValidatorForm.h"

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
        
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
        CGSize size = [RYForm boundingWith:_title attributes:attributes size:CGSizeMake([UIScreen mainScreen].bounds.size.width/2.0f, MAXFLOAT)];
        
        if (size.height > 20) {
            self.rowHeight = size.height + 22;
            
        } else {
             self.rowHeight = 44;
        }
        
        if ([rowType isEqualToString:RYFormRowInformationTypeContentTips]) {
            self.rowHeight += 25;
        }
        
        _titleSize = CGSizeMake(size.width, size.height);
        
        
        self.cellStyle          = UITableViewCellStyleDefault;
        self.titleTextAlignment = NSTextAlignmentLeft;
        self.valueTextAlignment = NSTextAlignmentRight;
        self.selectionStyle     = UITableViewCellSelectionStyleNone;
        self.accessoryType      = UITableViewCellAccessoryNone;
        self.stepCounterValue = 0;
        self.stepCounterMinimumValue = 0;
        self.stepCounterMaximumValue = 100;
        self.formRowValidatorType = RYFormRowValidatorTypeNotNull;
        self.isRequired = YES;
        self.wordLengthLimite = 100;
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

- (void)setAttributedText:(NSAttributedString *)attributedText
{
    _attributedText = [attributedText copy];
    NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attributedText boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width/2.0f, CGFLOAT_MAX)
                                      options:options
                                      context:nil];
    
    CGSize size = CGSizeMake(rect.size.width, rect.size.height);
    
    if (size.height > 20) {
        self.rowHeight = size.height + 22;
        
    } else {
        self.rowHeight = 44;
    }
    
    if ([_rowType isEqualToString:RYFormRowInformationTypeContentTips]) {
        self.rowHeight += 14;
    }
    
    _titleSize = CGSizeMake(size.width +30, size.height);
    
    
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
            result = ![ValidatorForm validateValueIsEmptyWithValue:self.value];
            break;
        case RYFormRowValidatorTypeValidateIdentityCardNo:
            result = [ValidatorForm validateIdentityCardNo:self.value];
            break;
        case RYFormRowValidatorTypeValidateEmail:
            result = [ValidatorForm validateValueIsEmptyWithValue:self.value];
            break;
        case RYFormRowValidatorTypeValidateURL:
            result = [ValidatorForm validateURL:self.value];
            break;
    }
    self.isvalidator = result;
    return result;
    
}


@end
