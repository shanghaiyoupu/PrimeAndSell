//
//  YSMXViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/27.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "YSMXViewController.h"
#import "SFTableViewCell.h"
#import "STTableViewCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
@interface YSMXViewController ()

@end

@implementation YSMXViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
    self.title = self.titles;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataName = [[NSMutableArray alloc]initWithObjects:@"客户名称",@"总应收金额",@"总实收金额",@"总应收款余额", nil];
    UINib *nibSF = [UINib nibWithNibName:@"SFTableViewCell" bundle:nil];
    [self.tableView registerNib:nibSF forCellReuseIdentifier:@"SFTableViewCell"];
    UINib *nibST = [UINib nibWithNibName:@"STTableViewCell" bundle:nil];
    [self.tableView registerNib:nibST forCellReuseIdentifier:@"STTableViewCell"];
    self.tableView.separatorInset = UIEdgeInsetsZero;
}
#pragma mark----------UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 4;
    }
    if (section == 1) {
        return 5;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        SFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SFTableViewCell" forIndexPath:indexPath];
        cell.name.text = self.dataName[indexPath.row];
        cell.separatorInset = UIEdgeInsetsMake(0, 8, 0, 8);
        cell.frame = [self setFrame:cell.frame];
        return cell;
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            SFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SFTableViewCell" forIndexPath:indexPath];
            cell.name.text = self.titles;
            cell.money.text = @"";
            cell.frame = [self setFrame:cell.frame];
            [cell setLayoutMargins:UIEdgeInsetsZero];
            return cell;
        }
        else
        {
            STTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"STTableViewCell" forIndexPath:indexPath];
            if (indexPath.row != 1) {
                cell.title1.text = @"12222";
                cell.title2.text = @"44444444444444444444444444444222dddddddddddddddd";
                cell.title3.text = @"44444444444444444444444444444222dddddddddddddddd";
                cell.title4.text = @"44444444444444444444444444444222dddddddddddddddd";
                cell.title5.text = @"44444444444444444444444444444222dddddddddddddddd";
            }
            cell.frame = [self setFrame:cell.frame];
            [cell setLayoutMargins:UIEdgeInsetsZero];
            return cell;
        }
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 38;
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return 38;
        }
        else if (indexPath.row == 1)
        {
            return 49;
        }
        else
        {
            return [tableView fd_heightForCellWithIdentifier:@"STTableViewCell" configuration:^(STTableViewCell * cell) {
                cell.title1.text = @"12222";
                cell.title2.text = @"44444444444444444444444444444222dddddddddddddddd";
                cell.title3.text = @"44444444444444444444444444444222dddddddddddddddd";
                cell.title4.text = @"44444444444444444444444444444222dddddddddddddddd";
                cell.title5.text = @"44444444444444444444444444444222dddddddddddddddd";
            }];
        }
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 1) {
        return 30;
    }
    return 0;
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
