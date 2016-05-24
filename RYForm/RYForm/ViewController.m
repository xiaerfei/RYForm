//
//  ViewController.m
//  RYForm
//
//  Created by xiaerfei on 16/5/18.
//  Copyright © 2016年 Rongyu100. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "Examp2ViewController.h"
#import "Examp3ViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, copy) NSMutableArray *dataSourceArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSourceArray = [NSMutableArray arrayWithObjects:[TestViewController class],[Examp2ViewController class],[Examp3ViewController class], nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid"];
    }
    
    cell.textLabel.text = NSStringFromClass(self.dataSourceArray[indexPath.row]);
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class class = self.dataSourceArray[indexPath.row];
    UIViewController *testView = [[class alloc] init];
    [self.navigationController pushViewController:testView animated:YES];
}












@end
