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
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"生成数据" style:UIBarButtonItemStyleDone target:self action:@selector(generate)];
    self.navigationItem.rightBarButtonItem = item;
    


    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)generate
{
    NSLog(@"%@",[self.formInformation generateAllValue]);
}



#pragma mark - RYFormViewControllerDelegate

- (id <RYFormDataConfigureDelegate>)configureFormDataClass
{
    return [[TestConfigureForm alloc] init];
}

- (void)formRowInformationValueHasChanged:(RYFormRowInformation *)formRow oldValue:(id)oldValue newValue:(id)newValue
{
    if ([formRow.key isEqualToString:@"22"]) {
        [self switchNextDisplayCellsAtIndex:[newValue integerValue]];
    }
}


- (void)allFormRowInformationValueNotValidator:(NSArray *)notValidatorArray
{
    NSLog(@"**********************************************************");
    for (RYFormRowInformation *rowForm in notValidatorArray) {
        NSLog(@"title = %@",rowForm.title);
    }
    NSLog(@"**********************************************************");
}

- (void)didSelectFormRow:(RYFormRowInformation *)formRow isClickCell:(BOOL)isClickCell
{
    NSLog(@"%@",isClickCell?@"cell":@"text");
}




@end
