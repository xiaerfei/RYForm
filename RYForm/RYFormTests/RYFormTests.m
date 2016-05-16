//
//  RYFormTests.m
//  RYFormTests
//
//  Created by xiaerfei on 16/5/15.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import <XCTest/XCTest.h>

#define api_aaaaaaaa     @"aaaaaaaa"
#define api_bbbbbbbb     @"bbbbbbbb"

#define api_cccccccc api_aaaaaaaa api_bbbbbbbb

#define api_dddddddd api_aaaaaaaa@"dddddddd"

#define __toString(x) __toString_0(x)

#define __toString_0(x) #x

#define LOG_MACRO(x) NSLog(@"%s=\n%s", #x, __toString(x))

#define str1 @"dddddddd"
#define str2 @"cccccccc"
#define str3 \
do {\
[NSString stringWithFormat:@"%@%@",str1,str2]\
}while(0)

@interface RYFormTests : XCTestCase

@end

@implementation RYFormTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    /*
     想要知道对不对自己可以做个测试嘛
     api_cccccccc 替换了 api_aaaaaaaa api_bbbbbbbb
     那宏展开之后是这个样子的：@"aaaaaaaa" @"bbbbbbbb"
     那按照这个样子打印一下：
     NSLog(@"\n************************************\n%@\n************************************\n",@"aaaaaaaa" @"bbbbbbbb");
     #define str1 @"dddddddd"
     #define str2 @"cccccccc"
     #define str3 [NSString stringWithFormat:@"%@%@",str1,str2]
     
     另外在写这种宏的时候
     #define str1 @"dddddddd"
     #define str2 @"cccccccc"
     #define str3 [NSString stringWithFormat:@"%@%@",str1,str2]
     
     str3 最好带 do{ }while(0)
     #define str3 \
     do {\
     [NSString stringWithFormat:@"%@%@",str1,str2]\
     }while(0)
     
     */
     NSLog(@"\n************************************\n%@\n************************************\n",@"aaaaaaaa" @"bbbbbbbb");
    NSLog(@"\n************************************\n%@\n************************************\n",@"111" @"222");
    LOG_MACRO(api_cccccccc);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
