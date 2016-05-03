//
//  KCPDViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/26.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "KCPDViewController.h"
#import "KCDBTableViewCell.h"
#import "KCDDViewController.h"
#import "KCCXViewController.h"
@interface KCPDViewController ()

@end

@implementation KCPDViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"库存盘点记录";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchBtn)];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINib *nib = [UINib nibWithNibName:@"KCDBTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"KCDBTableViewCell"];
    self.tableView.rowHeight = 70;
    self.tableView.separatorInset = UIEdgeInsetsZero;
}
#pragma mark-----------UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KCDBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KCDBTableViewCell" forIndexPath:indexPath];
    [cell setLayoutMargins:UIEdgeInsetsZero];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    KCDDViewController *xcddVC = [KCDDViewController new];
    [self.navigationController pushViewController:xcddVC animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
- (void)searchBtn
{
    NSLog(@"查询");
    KCCXViewController *kccxVC = [KCCXViewController new];
    UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:kccxVC];
    [self presentViewController:navc animated:YES completion:nil];
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
