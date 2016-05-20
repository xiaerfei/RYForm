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
}

- (void)update
{
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
    CGSize size = [RYForm boundingWith:self.rowInformation.title attributes:attributes size:CGSizeMake(MAXFLOAT, 20)];
    CGFloat tTop = (self.rowInformation.rowHeight - 20)/2.0f;
    self.ry_textLabel.frame = CGRectMake(15,tTop , size.width, 20);
    self.accessoryType = self.rowInformation.accessoryType;
    self.ry_textLabel.text = self.rowInformation.title;
    
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



- (UILabel *)ry_textLabel
{
    if (_ry_textLabel == nil) {
        _ry_textLabel = [[UILabel alloc] init];
        _ry_textLabel.textColor = [UIColor blackColor];
        _ry_textLabel.font = [UIFont systemFontOfSize:15];
//        _ry_textLabel.backgroundColor = [UIColor lightGrayColor];
    }
    return _ry_textLabel;
}


@end
