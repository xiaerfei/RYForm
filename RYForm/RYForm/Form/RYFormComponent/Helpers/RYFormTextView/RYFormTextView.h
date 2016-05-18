//
//  RYFormTextView.h
//  RYForm
//
//  Created by xiaerfei on 16/5/18.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RYFormTextView : UITextView

@property (nonatomic, copy)   NSString *placeholder;
@property (nonatomic, strong) UIColor  *placeholderColor;
@property (nonatomic, readonly,strong) UILabel *placeHolderLabel;
@end
