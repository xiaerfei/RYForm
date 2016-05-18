//
//  TestViewController.m
//  RYForm
//
//  Created by xiaerfei on 16/5/17.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "TestViewController.h"
#import "TestConfigureForm.h"

@interface TestViewController ()<RYFormViewControllerDelegate>

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - RYFormViewControllerDelegate

- (id <RYFormDataConfigure>)configureFormDataClass
{
    return [[TestConfigureForm alloc] init];
}


@end
