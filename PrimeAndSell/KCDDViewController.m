//
//  KCDDViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/26.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "KCDDViewController.h"
#import "KCPDTableViewCell.h"
#import "KCDSTableViewCell.h"
#import "PassTableViewCell.h"
#import "SFTableViewCell.h"
#import "LDTableViewCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
@interface KCDDViewController ()

@end

@implementation KCDDViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.title  =@"库存盘点单";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataName = [[NSMutableArray alloc]initWithObjects:@"单号",@"制单人",@"调出仓库",@"调入仓库",@"业务日期", nil];
    self.dataText = [[NSMutableArray alloc]initWithObjects:@"DB123456789098765",@"小赵",@"总店门店",@"6楼仓库",@"2015-12-23 07:45", nil];
    UINib *nibPass = [UINib nibWithNibName:@"PassTableViewCell" bundle:nil];
    [self.tableView registerNib:nibPass forCellReuseIdentifier:@"PassTableViewCell"];
    UINib *nibSFT = [UINib nibWithNibName:@"SFTableViewCell" bundle:nil];
    [self.tableView registerNib:nibSFT forCellReuseIdentifier:@"SFTableViewCell"];
    UINib *nibKCDD = [UINib nibWithNibName:@"KCPDTableViewCell" bundle:nil];
    [self.tableView registerNib:nibKCDD forCellReuseIdentifier:@"KCPDTableViewCell"];
    UINib *nibKCDS = [UINib nibWithNibName:@"KCDSTableViewCell" bundle:nil];
    [self.tableView registerNib:nibKCDS forCellReuseIdentifier:@"KCDSTableViewCell"];
    UINib *nibLD = [UINib nibWithNibName:@"LDTableViewCell" bundle:nil];
    [self.tableView registerNib:nibLD forCellReuseIdentifier:@"LDTableViewCell"];
    self.tableView.separatorInset = UIEdgeInsetsZero;
}
#pragma mark---------UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView

{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 5;
    }
    if (section == 1) {
        return 4;
    }
    if (section == 2) {
        return 1;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        PassTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PassTableViewCell" forIndexPath:indexPath];
        cell.name.text = self.dataName[indexPath.row];
        cell.textFiled.text = self.dataText[indexPath.row];
        cell.textFiled.clearButtonMode = UITextFieldViewModeNever;
        cell.textFiled.enabled  = NO;
        cell.textFiled.secureTextEntry = NO;
        cell.separatorInset = UIEdgeInsetsMake(0, 8, 0, 8);
        return cell;
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            LDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LDTableViewCell" forIndexPath:indexPath];
            [cell setLayoutMargins:UIEdgeInsetsZero];
            cell.name.text = @"盘点明细";
            cell.jiSuan.text = @"盘点合计:106";
            return cell;
        }
        
        else if (indexPath.row == 1) {
            KCPDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KCPDTableViewCell" forIndexPath:indexPath];
            [cell setLayoutMargins:UIEdgeInsetsZero];
            return cell;
        }
        else
        {
            KCDSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KCDSTableViewCell" forIndexPath:indexPath];
            [cell setLayoutMargins:UIEdgeInsetsZero];
            cell.huo.text = @"1530";
            cell.pin.text = @"微红盛龙夹克";
            cell.numberQ.text = @"8";
            cell.numberH.text = @"0";
            cell.number.text = @"8";
            return cell;
        }
    }
    if (indexPath.section == 2) {
        SFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SFTableViewCell" forIndexPath:indexPath];
        cell.money.alpha = 0;
        cell.name.text = @" 备注";
        cell.name.font = [UIFont systemFontOfSize:15];
        return cell;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1&&indexPath.row != 0) {
        if (indexPath.row == 1) {
            return [tableView fd_heightForCellWithIdentifier:@"KCPDTableViewCell" configuration:^(KCPDTableViewCell *cell) {
                
            }];
        }
        else
        {
            return [tableView fd_heightForCellWithIdentifier:@"KCDSTableViewCell" configuration:^(KCDSTableViewCell *cell) {
                cell.huo.text = @"1530";
                cell.pin.text = @"微红盛龙夹克";
                cell.numberQ.text = @"8";
                cell.numberH.text = @"0";
                cell.number.text = @"8";
            }];
        }
        
    }
    return 40;
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
