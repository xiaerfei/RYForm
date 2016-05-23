//
//  RYFormViewController.m
//  RYForm
//
//  Created by xiaerfei on 16/5/15.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "RYFormViewController.h"
#import "UIView+RYFormAdditions.h"
#import "RYFormBaseCell.h"
#import "UIView+SDAutoLayout.h"
#import "YYFPSLabel.h"
#import "YYKit.h"


@interface RYFormViewController ()

@property (nonatomic, copy) NSNumber *oldBottomTableContentInset;
@property (nonatomic, assign) CGRect keyboardFrame;
@property (nonatomic, strong) YYFPSLabel *fpsLabel;

@end

@implementation RYFormViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        if ([self conformsToProtocol:@protocol(RYFormViewControllerDelegate)]) {
            self.child = (id <RYFormViewControllerDelegate>)self;
        } else {
            @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"子类必须实现RYFormViewControllerDelegate代理方法" userInfo:nil];
        }
        
        [self initializeForm];
    }
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self){
        [self initializeForm];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
    [self configUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIContentSizeCategoryDidChangeNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
    _formInformation = nil;
    _formTableView   = nil;
}


- (void)initializeForm
{
    id <RYFormDataConfigureDelegate> class = [self.child configureFormDataClass];
    self.formInformation = [class configureFormInformation];
}

- (void)configUI
{
    [self.view addSubview:self.formTableView];
    self.formTableView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
    
    _fpsLabel = [YYFPSLabel new];
    [_fpsLabel sizeToFit];
    _fpsLabel.frame = CGRectMake(0,64,60,80);
//    _fpsLabel.alpha = 0;
    [self.view addSubview:_fpsLabel];
}

- (void)configData
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.formInformation.formSections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section >= self.formInformation.formSections.count){
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"section 大于数据池里的sections" userInfo:nil];
    }
    return [[[self.formInformation.formSections objectAtIndex:section] formRows] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RYFormRowInformation * rowDescriptor = [self.formInformation formRowAtIndex:indexPath];
    rowDescriptor.currentController = self;
    return [rowDescriptor cellForForm];
}

#pragma mark UITableViewDelegate

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    RYFormRowInformation * rowDescriptor = [self.formInformation formRowAtIndex:indexPath];
    [self updateFormRow:rowDescriptor];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    RYFormRowInformation * row = [self.formInformation formRowAtIndex:indexPath];
    [self tableViewDidSelectFormRow:row];
    
    if (row.isDisabled) {
        return;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RYFormRowInformation * rowDescriptor = [self.formInformation formRowAtIndex:indexPath];
    return rowDescriptor.rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    RYFormSectionInformation *sectionInformation = self.formInformation.formSections[section];
    return sectionInformation.headerHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    RYFormSectionInformation *sectionInformation = self.formInformation.formSections[section];
    return sectionInformation.footerHeight;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    RYFormSectionInformation *sectionInformation = self.formInformation.formSections[section];
    return sectionInformation.headerView;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;
{
    RYFormSectionInformation *sectionInformation = self.formInformation.formSections[section];
    return sectionInformation.footerView;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //dismiss keyboard
    [self.formTableView endEditing:YES];
}

#pragma mark - RYFormInformationCell
-(void)tableViewDidSelectFormRow:(RYFormRowInformation *)formRow
{
    UIView * firstResponderView = [self.formTableView findFirstResponder];
    UITableViewCell<RYFormInformationCellDelegate> * cell = [firstResponderView formInformationCell];
    [cell resignFirstResponder];
    if ([[formRow cellForForm] respondsToSelector:@selector(formInformationCellDidSelectedWithFormController:)]){
        [[formRow cellForForm] formInformationCellDidSelectedWithFormController:self];
    }
    
    if ([self.child respondsToSelector:@selector(didSelectFormRow:)]) {
        [self.child didSelectFormRow:formRow];
    }
}

#pragma mark - event responses
- (void)keyboardWillShow:(NSNotification *)notification
{
    UIView * firstResponderView = [self.formTableView findFirstResponder];
    UITableViewCell<RYFormInformationCellDelegate> * cell = [firstResponderView formInformationCell];
    if (cell){
        NSDictionary *keyboardInfo = [notification userInfo];
        _keyboardFrame = [self.formTableView.window convertRect:[keyboardInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue] toView:self.formTableView.superview];
        CGFloat newBottomInset = self.formTableView.frame.origin.y + self.formTableView.frame.size.height - _keyboardFrame.origin.y;
        UIEdgeInsets tableContentInset = self.formTableView.contentInset;
        UIEdgeInsets tableScrollIndicatorInsets = self.formTableView.scrollIndicatorInsets;
        _oldBottomTableContentInset = _oldBottomTableContentInset ?: @(tableContentInset.bottom);
        if (newBottomInset > [_oldBottomTableContentInset floatValue]){
            tableContentInset.bottom = newBottomInset;
            tableScrollIndicatorInsets.bottom = tableContentInset.bottom;
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:[keyboardInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]];
            [UIView setAnimationCurve:[keyboardInfo[UIKeyboardAnimationCurveUserInfoKey] intValue]];
            self.formTableView.contentInset = tableContentInset;
            self.formTableView.scrollIndicatorInsets = tableScrollIndicatorInsets;
            NSIndexPath *selectedRow = [self.formTableView indexPathForCell:cell];
            [self.formTableView scrollToRowAtIndexPath:selectedRow atScrollPosition:UITableViewScrollPositionNone animated:NO];
            [UIView commitAnimations];
        }
    }
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    UIView * firstResponderView = [self.formTableView findFirstResponder];
    UITableViewCell<RYFormInformationCellDelegate> * cell = [firstResponderView formInformationCell];
    if (cell){
        _keyboardFrame = CGRectZero;
        NSDictionary *keyboardInfo = [notification userInfo];
        UIEdgeInsets tableContentInset = self.formTableView.contentInset;
        UIEdgeInsets tableScrollIndicatorInsets = self.formTableView.scrollIndicatorInsets;
        tableContentInset.bottom = [_oldBottomTableContentInset floatValue];
        tableScrollIndicatorInsets.bottom = tableContentInset.bottom;
        _oldBottomTableContentInset = nil;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:[keyboardInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]];
        [UIView setAnimationCurve:[keyboardInfo[UIKeyboardAnimationCurveUserInfoKey] intValue]];
        self.formTableView.contentInset = tableContentInset;
        self.formTableView.scrollIndicatorInsets = tableScrollIndicatorInsets;
        [UIView commitAnimations];
    }
}

#pragma mark - private methods
-(RYFormBaseCell *)updateFormRow:(RYFormRowInformation *)formRow
{
    RYFormBaseCell * cell = [formRow cellForForm];
    [self configureCell:cell];
    return cell;
}

- (void)formRowValueHasChanged:(RYFormRowInformation *)formRow oldValue:(id)oldValue newValue:(id)newValue
{
    NSLog(@"oldValue = %@ newValue = %@",oldValue,newValue);
    if ([self.child respondsToSelector:@selector(formRowInformationValueHasChanged:oldValue:newValue:)]) {
        [self.child formRowInformationValueHasChanged:formRow oldValue:oldValue newValue:newValue];
    }
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSMutableArray *notValidatorArray = [NSMutableArray array];
        for (RYFormSectionInformation *sections in self.formInformation.formSections) {
            [sections.formRows enumerateObjectsUsingBlock:^(RYFormRowInformation *formRow, NSUInteger idx, BOOL * _Nonnull stop) {
                if (formRow.isRequired && formRow.isvalidator == NO && [formRow formRowValidatorValue] == NO) {
                    [notValidatorArray addObject:formRow];
                }
            }];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            printf("all:%.2f MB   used:%.2f MB   free:%.2f MB   active:%.2f MB  inactive:%.2f MB  wird:%.2f MB  purgable:%.2f MB\n",
                   [UIDevice currentDevice].memoryTotal / 1024.0 / 1024.0,
                   [UIDevice currentDevice].memoryUsed / 1024.0 / 1024.0,
                   [UIDevice currentDevice].memoryFree / 1024.0 / 1024.0,
                   [UIDevice currentDevice].memoryActive / 1024.0 / 1024.0,
                   [UIDevice currentDevice].memoryInactive / 1024.0 / 1024.0,
                   [UIDevice currentDevice].memoryWired / 1024.0 / 1024.0,
                   [UIDevice currentDevice].memoryPurgable / 1024.0 / 1024.0);
            
            if ([self.child respondsToSelector:@selector(allFormRowInformationValueNotValidator:)]) {
                [self.child allFormRowInformationValueNotValidator:notValidatorArray];
            }
        });
    });
}

-(void)configureCell:(RYFormBaseCell *) cell
{
    [cell update];
}

#pragma mark - getters

- (UITableView *)formTableView
{
    if (_formTableView == nil) {
        _formTableView = [[UITableView alloc] initWithFrame:CGRectZero style:self.formInformation.style];
        _formTableView.delegate   = self;
        _formTableView.dataSource = self;
    }
    return _formTableView;
}


@end
