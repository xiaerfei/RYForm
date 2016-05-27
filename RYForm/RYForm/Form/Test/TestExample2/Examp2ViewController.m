//
//  Examp2ViewController.m
//  RYForm
//
//  Created by xiaerfei on 16/5/24.
//  Copyright © 2016年 Rongyu100. All rights reserved.
//

#import "Examp2ViewController.h"
#import "Examp2ConfigureForm.h"

@interface Examp2ViewController ()<RYFormViewControllerDelegate>

@property (nonatomic, strong) UIButton *valitorButton;

@end

@implementation Examp2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
    
    _valitorButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _valitorButton.frame = CGRectMake(20, 20, [UIScreen mainScreen].bounds.size.width - 40, 40);
    [_valitorButton setTitle:@"开始问卷调查" forState:UIControlStateNormal];
    [_valitorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [view addSubview:_valitorButton];
    [self enableButtonOrNot:NO];
    self.formTableView.tableFooterView = view;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - RYFormViewControllerDelegate

- (id <RYFormDataConfigureDelegate>)configureFormDataClass
{
    return [[Examp2ConfigureForm alloc] init];
}

- (void)allFormRowInformationValueNotValidator:(NSArray *)notValidatorArray
{
    if (notValidatorArray.count == 0) {
        [self enableButtonOrNot:YES];
    } else {
        [self enableButtonOrNot:NO];
    }
}

- (void)didSelectFormRow:(RYFormRowInformation *)formRow isClickCell:(BOOL)isClickCell
{
    NSLog(@"title = %@",formRow.title);
}

#pragma mark - private methods

- (void)enableButtonOrNot:(BOOL)enable
{
    if (enable) {
        [_valitorButton setBackgroundColor:[UIColor colorWithRed:16.0f/255.0f green:123.0f/255.0f blue:193.0f/255.0f alpha:1]];
        _valitorButton.enabled = YES;
    } else {
        [_valitorButton setBackgroundColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1]];
        _valitorButton.enabled = NO;
    }
}
@end
