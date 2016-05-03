//
//  QGKZViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/27.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "QGKZViewController.h"
#import "PassTableViewCell.h"
#import "SFTableViewCell.h"
#import "LDTableViewCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
@interface QGKZViewController ()

@end

@implementation QGKZViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.title  =@"期初欠供应商款记账";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataName = [[NSMutableArray alloc]initWithObjects:@"供应商",@"单号",@"制单人",@"业务日期", nil];
    self.dataText = [[NSMutableArray alloc]initWithObjects:@"小赵",@"DB123456789098765",@"姚明",@"2015-12-23 07:45", nil];
    self.dataSection2 = [[NSMutableArray alloc]initWithObjects:@"期初欠供应商款金额",@"累计欠供应商款", nil];
    UINib *nibPass = [UINib nibWithNibName:@"PassTableViewCell" bundle:nil];
    [self.tableView registerNib:nibPass forCellReuseIdentifier:@"PassTableViewCell"];
    UINib *nibSFT = [UINib nibWithNibName:@"SFTableViewCell" bundle:nil];
    [self.tableView registerNib:nibSFT forCellReuseIdentifier:@"SFTableViewCell"];
    UINib *nibKCDD = [UINib nibWithNibName:@"KCDDTableViewCell" bundle:nil];
    [self.tableView registerNib:nibKCDD forCellReuseIdentifier:@"KCDDTableViewCell"];
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
        return 4;
    }
    if (section == 1) {
        return 2;
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
        SFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SFTableViewCell" forIndexPath:indexPath];
            cell.money.alpha = 1;
            cell.name.text = self.dataSection2[indexPath.row];
            cell.name.font = [UIFont systemFontOfSize:15];
            cell.money.text  = @"32000.00元";
            cell.money.font = [UIFont systemFontOfSize:15];
            cell.money.textColor = [UIColor blackColor];
            cell.separatorInset = UIEdgeInsetsMake(0, 8, 0, 8);
        return cell;
    }
    if (indexPath.section == 2) {
        LDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LDTableViewCell" forIndexPath:indexPath];
        cell.name.text = @" 备注";
        cell.name.font = [UIFont systemFontOfSize:15];
        cell.jiSuan.font = [UIFont systemFontOfSize:15];
        cell.jiSuan.textColor = [UIColor grayColor];
        cell.jiSuan.text = @"新增供应商或账款阶段性结算时初始化欠供应商款";
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
    if (indexPath.section == 2) {
        return [tableView fd_heightForCellWithIdentifier:@"LDTableViewCell" configuration:^(LDTableViewCell *cell) {
             cell.jiSuan.text = @"新增供应商或账款阶段性结算时初始化欠供应商款";
        }];
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
