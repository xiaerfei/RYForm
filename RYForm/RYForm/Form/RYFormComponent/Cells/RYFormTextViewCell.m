//
//  RYFormTextViewCell.m
//  RYForm
//
//  Created by xiaerfei on 16/5/24.
//  Copyright © 2016年 Rongyu100. All rights reserved.
//

#import "RYFormTextViewCell.h"
#import "RYFormRowInformation.h"
#import "UIViewExt.h"
#import "RYForm.h"
#import "RYFormViewController.h"

@interface RYFormTextViewCell ()<UITextViewDelegate>

@property (nonatomic, readwrite, strong) UITextView * textView;

@property (nonatomic, strong) UILabel *placeHolderText;

@end

@implementation RYFormTextViewCell

-(void)configure
{
    [super configure];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [self.textView addSubview:self.placeHolderText];
    [self.contentView addSubview:self.textView];
}


-(void)update
{
    [super update];
    [self autoLayoutSubViews];
    self.placeHolderText.font = [UIFont systemFontOfSize:13];
    self.placeHolderText.text = self.rowInformation.placeholderText;
    self.textView.text          = self.rowInformation.value;
    [self.textView setEditable:!self.rowInformation.isDisabled];
    self.textView.textColor     = self.rowInformation.isDisabled ? [UIColor grayColor] : [UIColor blackColor];
}

- (BOOL)canBecomeFirstResponder
{
    return !self.rowInformation.isDisabled;
}


#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([self.rowInformation.currentController.child respondsToSelector:@selector(didSelectFormRow:isClickCell:)]) {
        [self.rowInformation.currentController.child didSelectFormRow:self.rowInformation isClickCell:NO];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    UITextRange *selectedRange = [textView markedTextRange];
    //获取高亮部分
    UITextPosition *pos = [textView positionFromPosition:selectedRange.start offset:0];
    
    //如果有高亮且当前字数开始位置小于最大限制时允许输入
    if (selectedRange && pos) {
        NSInteger startOffset = [textView offsetFromPosition:textView.beginningOfDocument toPosition:selectedRange.start];
        NSInteger endOffset = [textView offsetFromPosition:textView.beginningOfDocument toPosition:selectedRange.end];
        NSRange offsetRange = NSMakeRange(startOffset, endOffset - startOffset);
        
        if (offsetRange.location < self.rowInformation.wordLengthLimite) {
            return YES;
        } else {
            return NO;
        }
    }
    
    NSString *comcatstr = [textView.text stringByReplacingCharactersInRange:range withString:text];
    
    NSInteger caninputlen = self.rowInformation.wordLengthLimite - comcatstr.length;
    
    if (caninputlen >= 0) {
        return YES;
    } else {
        NSInteger len = text.length + caninputlen;
        //防止当text.length + caninputlen < 0时，使得rg.length为一个非法最大正数出错
        NSRange rg = {0,MAX(len,0)};
        if (rg.length > 0) {
            NSString *s = @"";
            //判断是否只普通的字符或asc码(对于中文和表情返回NO)
            BOOL asc = [text canBeConvertedToEncoding:NSASCIIStringEncoding];
            if (asc) {
                s = [text substringWithRange:rg];//因为是ascii码直接取就可以了不会错
            } else {
                __block NSInteger idx = 0;
                __block NSString  *trimString = @"";//截取出的字串
                //使用字符串遍历，这个方法能准确知道每个emoji是占一个unicode还是两个
                [text enumerateSubstringsInRange:NSMakeRange(0, [text length])
                                         options:NSStringEnumerationByComposedCharacterSequences
                                      usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                                          if (idx >= rg.length) {
                                              *stop = YES; //取出所需要就break，提高效率
                                              return ;
                                          }
                                          trimString = [trimString stringByAppendingString:substring];
                                          idx++;
                                      }];
                s = trimString;
            }
            //rang是指从当前光标处进行替换处理(注意如果执行此句后面返回的是YES会触发didchange事件)
            [textView setText:[textView.text stringByReplacingCharactersInRange:range withString:s]];
        }
        return NO;
    }
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (self.textView.text.length == 0) {
        self.placeHolderText.hidden = NO;
    } else {
        self.placeHolderText.hidden = YES;
    }
    
    UITextRange *selectedRange = [textView markedTextRange];
    //获取高亮部分
    UITextPosition *pos = [textView positionFromPosition:selectedRange.start offset:0];
    
    //如果在变化中是高亮部分在变，就不要计算字符了
    if (selectedRange && pos) {
        return;
    }
    
    NSString  *nsTextContent = textView.text;
    NSInteger existTextNum = nsTextContent.length;
    
    if (existTextNum > self.rowInformation.wordLengthLimite) {
        //截取到最大位置的字符
        NSString *s = [nsTextContent substringToIndex:self.rowInformation.wordLengthLimite];
        
        [textView setText:s];
    }
    
    
    NSLog(@"change - %@",self.textView.text);
    
    self.rowInformation.value = self.textView.text;
}

#pragma mark - private methods

- (void)autoLayoutSubViews
{
    if ([self.rowInformation.rowType isEqualToString:RYFormRowInformationTypeNoteTextView]) {
        
        NSLog(@"%@",NSStringFromUIEdgeInsets(self.textView.contentInset));
        
        
        self.ry_textLabel.frame = CGRectMake(15,7 , self.rowInformation.titleSize.width, self.rowInformation.titleSize.height);
        
        self.textView.frame = CGRectMake(self.ry_textLabel.right+2, 0, [UIScreen mainScreen].bounds.size.width - self.ry_textLabel.right-2, self.rowInformation.rowHeight);
        self.placeHolderText.frame = CGRectMake(2, 7, self.textView.width, 20);
    } else {
        self.textView.frame = CGRectMake(15, 5, [UIScreen mainScreen].bounds.size.width - 30, self.rowInformation.rowHeight - 10);
    }
}

#pragma mark - getters

- (UITextView *)textView
{
    if (_textView == nil) {
        _textView = [[UITextView alloc] init];
        _textView.delegate = self;
        _textView.font = [UIFont systemFontOfSize:15];
        _textView.keyboardType  = UIKeyboardTypeDefault;
    }
    return _textView;
}

- (UILabel *)placeHolderText
{
    if (_placeHolderText == nil) {
        _placeHolderText = [[UILabel alloc] init];
        _placeHolderText.textColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1];
    }
    return _placeHolderText;
}

@end
