//
//  RYFormSectionInformation.m
//  RYForm
//
//  Created by xiaerfei on 16/5/15.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "RYFormSectionInformation.h"

@implementation RYFormSectionInformation

- (instancetype)init
{
    self = [super init];
    if (self) {
        _formRows = [[NSMutableArray alloc] init];
        
    }
    return self;
}


- (void)dealloc
{
    NSArray *array = self.formRows;
    _formRows = nil;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [array class];
    });
    
    NSLog(@"RYFormSectionInformation--->dealloc");
}

@end
