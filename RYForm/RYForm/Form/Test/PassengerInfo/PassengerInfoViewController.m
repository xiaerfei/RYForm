//
//  PassengerInfoViewController.m
//  RYForm
//
//  Created by rongyu100 on 2017/6/8.
//  Copyright © 2017年 Rongyu100. All rights reserved.
//

#import "PassengerInfoViewController.h"
#import "PassengerInfoConfigureForm.h"

@interface PassengerInfoViewController ()<RYFormViewControllerDelegate>

@end

@implementation PassengerInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    return [[PassengerInfoConfigureForm alloc] init];
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
        NSLog(@"title = %@",rowForm.value);
    }
    NSLog(@"**********************************************************");
}

- (void)didSelectFormRow:(RYFormRowInformation *)formRow isClickCell:(BOOL)isClickCell
{
    NSLog(@"%@",isClickCell?@"cell":@"text");
}

@end
