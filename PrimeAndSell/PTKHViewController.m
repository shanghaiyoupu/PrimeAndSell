//
//  PTKHViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/26.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT self.tableView.bounds.size.height
#import "PTKHViewController.h"
#import "MFTableViewCell.h"
#import "MSTableViewCell.h"
#import "MXViewController.h"
#import "XSCHViewController.h"
#import "KHQZViewController.h"
#import "XSTHViewController.h"
#import "SXViewController.h"
@interface PTKHViewController ()

@end

@implementation PTKHViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
    self.title = self.titles;
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(rightClick)];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor orangeColor]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINib *nibF = [UINib nibWithNibName:@"MFTableViewCell" bundle:nil];
    [self.tableView registerNib:nibF forCellReuseIdentifier:@"MFTableViewCell"];
    UINib *nibS = [UINib nibWithNibName:@"MSTableViewCell" bundle:nil];
    [self.tableView registerNib:nibS forCellReuseIdentifier:@"MSTableViewCell"];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    
}
#pragma mark-------------UITableViewDelegate,UITableViewDataSource
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
        return 5;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MFTableViewCell" forIndexPath:indexPath];
        [cell setLayoutMargins:UIEdgeInsetsZero];
        cell.frame = [self setFrame:cell.frame];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    if (indexPath.section == 1) {
        MSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MSTableViewCell" forIndexPath:indexPath];
        [cell setLayoutMargins:UIEdgeInsetsZero];
        cell.name.text = @"销售出货单";
        cell.frame = [self setFrame:cell.frame];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MXViewController *mxVC = [MXViewController new];
        mxVC.titles = @"客户对账明细";
        [self.navigationController pushViewController:mxVC animated:YES];
    }
    if (indexPath.section == 1&&indexPath.row == 0) {
        XSCHViewController *xschVC = [XSCHViewController new];
        [self.navigationController pushViewController:xschVC animated:YES];
    }
    if (indexPath.section == 1&&indexPath.row == 1) {
        KHQZViewController *khskVC = [KHQZViewController new];
        [self.navigationController pushViewController:khskVC animated:YES];
    }
    if (indexPath.section == 1&&indexPath.row == 2) {
        XSTHViewController *xsthVC = [XSTHViewController new];
        [self.navigationController pushViewController:xsthVC animated:YES];
    }
    if (indexPath.section == 1&&indexPath.row == 3) {
        KHQZViewController *khskVC = [KHQZViewController new];
        [self.navigationController pushViewController:khskVC animated:YES];
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95;
}

- (void)rightClick
{
    SXViewController *sxVC = [SXViewController new];
    UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:sxVC];
    [self presentViewController:navc animated:YES completion:nil];
}
- (CGRect)setFrame:(CGRect)rect1
{
    CGRect rect = rect1;
    rect.size.width = WIDTH;
    return rect;
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
