//
//  ValidatorForm.h
//  RYForm
//
//  Created by xiaerfei on 16/5/24.
//  Copyright © 2016年 Rongyu100. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ValidatorForm : NSObject
/**
 *   @author xiaerfei, 16-05-24 15:05:35
 *
 *   验证值是否为空
 *
 *   @param value
 *
 *   @return bool
 */
+ (BOOL)validateValueIsEmptyWithValue:(id)value;
/**
 *   @author xiaerfei, 16-05-24 15:05:54
 *
 *   验证身份证
 *
 *   @param cardNo
 *
 *   @return bool
 */
+ (BOOL)validateIdentityCardNo:(NSString*)cardNo;
/**
 *   @author xiaerfei, 16-05-24 15:05:19
 *
 *   验证Email
 *
 *   @param email
 *
 *   @return
 */
+ (BOOL)validateEmail:(NSString *)email;

/**
 *   @author xiaerfei, 16-05-24 16:05:51
 *
 *   验证URL
 *
 *   @param url url
 *
 *   @return bool
 */
+ (BOOL)validateURL:(NSString *)url;

@end
