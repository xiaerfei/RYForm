//
//  ValidatorForm.m
//  RYForm
//
//  Created by xiaerfei on 16/5/24.
//  Copyright © 2016年 Rongyu100. All rights reserved.
//

#import "ValidatorForm.h"

@implementation ValidatorForm


+ (BOOL)validateValueIsEmptyWithValue:(id)value
{
    return value == nil || [value isKindOfClass:[NSNull class]] || ([value respondsToSelector:@selector(length)] && [value length] == 0);
}

+ (BOOL)validateIdentityCardNo:(NSString*)cardNo
{
    cardNo = [cardNo stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([cardNo length] != 18) {
        return NO;
    }
    NSString *mmdd = @"(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))";
    NSString *leapMmdd = @"0229";
    NSString *year = @"(19|20)[0-9]{2}";
    NSString *leapYear = @"(19|20)(0[48]|[2468][048]|[13579][26])";
    NSString *yearMmdd = [NSString stringWithFormat:@"%@%@", year, mmdd];
    NSString *leapyearMmdd = [NSString stringWithFormat:@"%@%@", leapYear, leapMmdd];
    NSString *yyyyMmdd = [NSString stringWithFormat:@"((%@)|(%@)|(%@))", yearMmdd, leapyearMmdd, @"20000229"];
    NSString *area = @"(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}";
    NSString *regex = [NSString stringWithFormat:@"%@%@%@", area, yyyyMmdd  , @"[0-9]{3}[0-9Xx]"];
    
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![regexTest evaluateWithObject:cardNo]) {
        return NO;
    }
    int summary = ([cardNo substringWithRange:NSMakeRange(0,1)].intValue + [cardNo substringWithRange:NSMakeRange(10,1)].intValue) *7
    + ([cardNo substringWithRange:NSMakeRange(1,1)].intValue + [cardNo substringWithRange:NSMakeRange(11,1)].intValue) *9
    + ([cardNo substringWithRange:NSMakeRange(2,1)].intValue + [cardNo substringWithRange:NSMakeRange(12,1)].intValue) *10
    + ([cardNo substringWithRange:NSMakeRange(3,1)].intValue + [cardNo substringWithRange:NSMakeRange(13,1)].intValue) *5
    + ([cardNo substringWithRange:NSMakeRange(4,1)].intValue + [cardNo substringWithRange:NSMakeRange(14,1)].intValue) *8
    + ([cardNo substringWithRange:NSMakeRange(5,1)].intValue + [cardNo substringWithRange:NSMakeRange(15,1)].intValue) *4
    + ([cardNo substringWithRange:NSMakeRange(6,1)].intValue + [cardNo substringWithRange:NSMakeRange(16,1)].intValue) *2
    + [cardNo substringWithRange:NSMakeRange(7,1)].intValue *1 + [cardNo substringWithRange:NSMakeRange(8,1)].intValue *6
    + [cardNo substringWithRange:NSMakeRange(9,1)].intValue *3;
    NSInteger remainder = summary % 11;
    NSString *checkBit = @"";
    NSString *checkString = @"10X98765432";
    checkBit = [checkString substringWithRange:NSMakeRange(remainder,1)];// 判断校验位
    return [checkBit isEqualToString:[[cardNo substringWithRange:NSMakeRange(17,1)] uppercaseString]];
}

+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (BOOL)validateURL:(NSString *)url
{
    NSString *emailRegex = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:url];
}


@end
