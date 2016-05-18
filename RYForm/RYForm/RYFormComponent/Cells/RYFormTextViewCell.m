//
//  RYFormTextViewCell.m
//  RYForm
//
//  Created by xiaerfei on 16/5/16.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "RYFormTextViewCell.h"
#import "RYFormRowInformation.h"
#import "UIView+SDAutoLayout.h"

@interface RYFormTextViewCell () <UITextViewDelegate>

@property (nonatomic, readwrite, strong) RYFormTextView * textView;

@end

@implementation RYFormTextViewCell

-(void)configure
{
    [super configure];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [self.contentView addSubview:self.textView];
    [self autoLayoutSubViews];
}

-(void)update
{
    [super update];
    self.textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.textView.placeHolderLabel.font = self.textView.font;
    self.textView.delegate      = self;
    self.textView.keyboardType  = UIKeyboardTypeDefault;
    self.textView.text          = self.rowInformation.value;
    self.textView.placeholder   = self.rowInformation.placeholderText;
    [self.textView setEditable:!self.rowInformation.isDisabled];
    self.textView.textColor     = self.rowInformation.isDisabled ? [UIColor grayColor] : [UIColor blackColor];
}

#pragma mark - private methods

- (void)autoLayoutSubViews
{
    self.textView.sd_layout.leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,5)
    .rightSpaceToView(self.contentView,15)
    .bottomSpaceToView(self.contentView,5);
}

#pragma mark - getters

- (RYFormTextView *)textView
{
    if (_textView == nil) {
        _textView = [[RYFormTextView alloc] init];
    }
    return _textView;
}

@end
