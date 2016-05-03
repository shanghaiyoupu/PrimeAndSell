//
//  LSJLViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/28.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "LSJLViewController.h"
#import "LSJLTableViewCell.h"
#import "LSCXViewController.h"
#import "LSDViewController.h"
#import "AddLSViewController.h"
@interface LSJLViewController ()

@end

@implementation LSJLViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
    self.tabBarController.tabBar.hidden = YES;
    self.title = @"零售记录";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(rightClick)];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor orangeColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINib *nib = [UINib nibWithNibName:@"LSJLTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"LSJLTableViewCell"];
    self.tableView.rowHeight = 84;
    self.tableView.separatorInset = UIEdgeInsetsZero;
}
#pragma mark-------------UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSJLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LSJLTableViewCell" forIndexPath:indexPath];
    [cell setLayoutMargins:UIEdgeInsetsZero];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        LSDViewController *lsdVC = [LSDViewController new];
        [self.navigationController pushViewController:lsdVC animated:YES];
    }
    
}
- (void)rightClick
{
    LSCXViewController *lscxVC = [LSCXViewController new];
    UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:lscxVC];
    [self presentViewController:navc animated:YES completion:nil];
}
- (IBAction)jiZhang:(id)sender {
    AddLSViewController *addlsVC = [AddLSViewController new];
    [self.navigationController pushViewController:addlsVC animated:YES];
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
