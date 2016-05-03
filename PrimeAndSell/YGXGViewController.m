//
//  YGXGViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/25.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "YGXGViewController.h"
#import "YGXGTableViewCell.h"
#import "YGSSViewController.h"
#import "YGXXViewController.h"
#import "XGYGViewController.h"
#import "XGLBViewController.h"
@interface YGXGViewController ()

@end

@implementation YGXGViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.title = self.titles;
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchBtn)];
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBtn)];
    [self.navigationItem setRightBarButtonItems:@[searchItem,addItem]];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor orangeColor]];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINib *nib = [UINib nibWithNibName:@"YGXGTableViewCell" bundle:nil];
    [self.tableVIew registerNib:nib forCellReuseIdentifier:@"YGXGTableViewCell"];
    self.tableVIew.separatorInset = UIEdgeInsetsZero;
    self.tableVIew.rowHeight = 84;
}
#pragma mark------UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 4;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YGXGTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YGXGTableViewCell" forIndexPath:indexPath];
    [cell setLayoutMargins:UIEdgeInsetsZero];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"  老板";
    }
    if (section == 1) {
        return @"  员工";
    }
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        XGLBViewController *ygxxVC = [XGLBViewController new];
        [self.navigationController pushViewController:ygxxVC animated:YES];
    }
    else
    {
        XGYGViewController *xgygVC = [XGYGViewController new];
        [self.navigationController pushViewController:xgygVC animated:YES];
    }
}
- (void)searchBtn
{
    NSLog(@"search");
    YGSSViewController *searchVC = [YGSSViewController new];
    UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:searchVC];
    [self presentViewController:navc animated:YES completion:nil];
}
- (void)addBtn
{
    YGXXViewController *ygxxView= [YGXXViewController new];
    self.title = @"员工信息";
    [self.navigationController pushViewController:ygxxView animated:YES];
    NSLog(@"add");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
