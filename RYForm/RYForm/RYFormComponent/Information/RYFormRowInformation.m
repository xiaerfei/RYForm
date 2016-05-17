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
        _normalColor = [UIColor blackColor];
        _disabledColor = [UIColor blackColor];
        self.cellStyle = UITableViewCellStyleDefault;
        self.rowHeight = 44;
        
    }
    return self;
}

- (void)dealloc
{
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

@end
