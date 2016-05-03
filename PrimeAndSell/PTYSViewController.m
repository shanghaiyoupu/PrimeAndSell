//
//  PTYSViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/27.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT self.tableView.bounds.size.height
#import "PTYSViewController.h"
#import "MFTableViewCell.h"
#import "MSTableViewCell.h"
#import "YSMXViewController.h"
#import "CGJHViewController.h"
#import "CGJHViewController.h"
#import "XGJZViewController.h"
#import "QGKZViewController.h"
#import "CGTHViewController.h"
@interface PTYSViewController ()

@end

@implementation PTYSViewController

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
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    if (indexPath.section == 1) {
        MSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MSTableViewCell" forIndexPath:indexPath];
        [cell setLayoutMargins:UIEdgeInsetsZero];
        cell.frame = [self setFrame:cell.frame];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        YSMXViewController *ysmxVC = [YSMXViewController new];
        ysmxVC.titles = @"供应商对账明细";
        [self.navigationController pushViewController:ysmxVC animated:YES];
    }
    if (indexPath.section == 1&&indexPath.row == 0) {
        CGJHViewController *cgjhVC = [CGJHViewController new];
        [self.navigationController pushViewController:cgjhVC animated:YES];
    }
    if (indexPath.section == 1&&indexPath.row == 1) {
        CGJHViewController *cgjhVC = [CGJHViewController new];
        [self.navigationController pushViewController:cgjhVC animated:YES];
    }
    if (indexPath.section == 1&&indexPath.row == 2) {
        CGTHViewController *cgthVC = [CGTHViewController new];
        [self.navigationController pushViewController:cgthVC animated:YES];
    }
    if (indexPath.section == 1&&indexPath.row == 3) {
        XGJZViewController *sgjzVC = [XGJZViewController new];
        [self.navigationController pushViewController:sgjzVC animated:YES];
    }
    if (indexPath.section == 1&&indexPath.row == 4) {
        QGKZViewController *qgkzVC = [QGKZViewController new];
        [self.navigationController pushViewController:qgkzVC animated:YES];
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
