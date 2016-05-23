//
//  RYFormBaseCell.m
//  RYForm
//
//  Created by xiaerfei on 16/5/15.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "RYFormBaseCell.h"
#import "RYFormRowInformation.h"
#import "RYForm.h"

@interface RYFormBaseCell ()

@property (nonatomic, readwrite, strong) UILabel     *ry_textLabel;
@property (nonatomic, readwrite, strong) UILabel     *ry_unitsLabel;
@end

@implementation RYFormBaseCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configure];
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)configure
{
    self.ry_textLabel.frame = CGRectMake(15,(44 - 20)/2.0f , 100, 20);
    [self.contentView addSubview:self.ry_textLabel];
    self.ry_unitsLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 20, (44 - 20)/2.0f, 25, 20);
    [self.contentView addSubview:self.ry_unitsLabel];
}

- (void)update
{
    CGFloat tTop = (self.rowInformation.rowHeight - self.rowInformation.titleSize.height)/2.0f;
    self.ry_textLabel.frame = CGRectMake(15,tTop , self.rowInformation.titleSize.width, self.rowInformation.titleSize.height);
    self.ry_textLabel.text = self.rowInformation.title;
    self.accessoryType = self.rowInformation.accessoryType;
    if (self.accessoryType == UITableViewCellAccessoryNone && self.rowInformation.unitsText != nil) {
        self.ry_unitsLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 25, (self.rowInformation.rowHeight - 20)/2.0f, 25, 20);
        self.ry_unitsLabel.hidden = NO;
        self.ry_unitsLabel.text = self.rowInformation.unitsText;
    } else {
        self.ry_unitsLabel.hidden = YES;
    }
    
    if (self.rowInformation.isDisabled) {
        if (self.rowInformation.disabledTitleColor) {
            self.ry_textLabel.textColor = self.rowInformation.disabledTitleColor;
        }
        if (self.rowInformation.disabledValueColor) {
            self.ry_textLabel.textColor = self.rowInformation.disabledValueColor;
        }
    } else {
        if (self.rowInformation.normalTitleColor) {
            self.ry_textLabel.textColor = self.rowInformation.normalTitleColor;
        }
        if (self.rowInformation.normalValueColor) {
            self.ry_textLabel.textColor = self.rowInformation.normalValueColor;
        }
    }
    
}

-(void)highlight
{
    
}

-(void)unhighlight
{
    
}

-(BOOL)becomeFirstResponder
{
    BOOL result = [super becomeFirstResponder];
    if (result){
        
    }
    return result;
}

-(BOOL)resignFirstResponder
{
    BOOL result = [super resignFirstResponder];
    if (result){
        
    }
    return result;
}


#pragma mark - getters

- (UILabel *)ry_textLabel
{
    if (_ry_textLabel == nil) {
        _ry_textLabel = [[UILabel alloc] init];
        _ry_textLabel.textColor = [UIColor blackColor];
        _ry_textLabel.font = [UIFont systemFontOfSize:15];
        _ry_textLabel.numberOfLines = 0;
//        _ry_textLabel.backgroundColor = [UIColor lightGrayColor];
    }
    return _ry_textLabel;
}

- (UILabel *)ry_unitsLabel
{
    if (_ry_unitsLabel == nil) {
        _ry_unitsLabel = [[UILabel alloc] init];
        _ry_unitsLabel.textColor = [UIColor blackColor];
        _ry_unitsLabel.font = [UIFont systemFontOfSize:10];
//        _ry_unitsLabel.backgroundColor = [UIColor lightGrayColor];
        _ry_unitsLabel.hidden = YES;
    }
    return _ry_unitsLabel;
}


@end
