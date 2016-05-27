//
//  Examp3ViewController.m
//  RYForm
//
//  Created by xiaerfei on 16/5/24.
//  Copyright © 2016年 Rongyu100. All rights reserved.
//

#import "Examp3ViewController.h"
#import "Example3ConfigureForm.h"

@interface Examp3ViewController ()<RYFormViewControllerDelegate>

@end

@implementation Examp3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - RYFormViewControllerDelegate

- (id <RYFormDataConfigureDelegate>)configureFormDataClass
{
    return [[Example3ConfigureForm alloc] init];
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
    
}


@end
