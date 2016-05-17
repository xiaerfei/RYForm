//
//  ViewController.m
//  RYForm
//
//  Created by xiaerfei on 16/5/15.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()

- (IBAction)testFormAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testFormAction:(id)sender {
    
    TestViewController *testView = [[TestViewController alloc] init];
    [self.navigationController pushViewController:testView animated:YES];
    
}
@end
