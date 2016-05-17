//
//  RYFormDataConfigure.h
//  RYForm
//
//  Created by xiaerfei on 16/5/17.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RYFormInformation.h"
#import "RYForm.h"

@protocol RYFormDataConfigure <NSObject>


- (RYFormInformation *)configureFormInformation;

@end
