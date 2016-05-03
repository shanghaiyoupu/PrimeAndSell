//
//  KCMXViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/26.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "KCMXViewController.h"
#import "PassTableViewCell.h"
#import "LDTableViewCell.h"
@interface KCMXViewController ()

@end

@implementation KCMXViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"商品库存明细";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSArray *array0 = [[NSArray alloc]initWithObjects:@"品名",@"货号",@"品牌", nil];
     NSArray *array1 = [[NSArray alloc]initWithObjects:@"库存明细",@"总店门店",@"6楼仓库",@"豫园分店", nil];
    self.dataName = [[NSMutableArray alloc]initWithObjects:array0,array1, nil];
    NSArray *array2 = [[NSArray alloc]initWithObjects:@"阿波路T桖",@"668",@"阿波路", nil];
     NSArray *array3 = [[NSArray alloc]initWithObjects:@"合计:60",@"51",@"0",@"9", nil];
    self.dataText = [[NSMutableArray alloc]initWithObjects:array2,array3, nil];
    UINib *nibPass = [UINib nibWithNibName:@"PassTableViewCell" bundle:nil];
    [self.tableView registerNib:nibPass forCellReuseIdentifier:@"PassTableViewCell"];
    UINib *nibLDT = [UINib nibWithNibName:@"LDTableViewCell" bundle:nil];
    [self.tableView registerNib:nibLDT forCellReuseIdentifier:@"LDTableViewCell"];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.rowHeight = 40;
}
#pragma mark----------UITableViewDataSource,UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataName.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray*array = self.dataName[section];
    return array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = self.dataName[indexPath.section];
    NSArray *arrayT = self.dataText[indexPath.section];
    if (indexPath.section == 1&&indexPath.row == 0) {
        LDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LDTableViewCell" forIndexPath:indexPath];
        cell.jiSuan.text = arrayT[indexPath.row];
        cell.name.text = array[indexPath.row];
        [cell setLayoutMargins:UIEdgeInsetsZero];
        return cell;
    }
    else
    {
        PassTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PassTableViewCell" forIndexPath:indexPath];
        cell.separatorInset = UIEdgeInsetsMake(0, 8, 0, 8);
        cell.name.text = array[indexPath.row];
        cell.textFiled.enabled = NO;
        cell.textFiled.text = arrayT[indexPath.row];
        cell.textFiled.clearButtonMode = UITextFieldViewModeNever;
        cell.textFiled.secureTextEntry = NO;
        cell.name.textColor = [UIColor grayColor];
        cell.textFiled.textColor = [UIColor blackColor];
        if ((indexPath.section == 1&&indexPath.row == 2)||(indexPath.section == 1&&indexPath.row == 3)) {
            cell.textFiled.textColor = [UIColor grayColor];
        }
        if (indexPath.section == 1&&indexPath.row == 1) {
            cell.name.textColor = [UIColor blackColor];
        }
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15;
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
