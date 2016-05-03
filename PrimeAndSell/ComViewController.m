//
//  ComViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/22.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "ComViewController.h"
#import "Com1TableViewCell.h"
#import "Com2TableViewCell.h"
#import "UTSTableViewCell.h"
#import "PrintTableViewCell.h"
#import "ComMeViewController.h"
#import "PeoMesViewController.h"
#import "SPXXViewController.h"
#import "YGXGViewController.h"
@interface ComViewController ()

@end

@implementation ComViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"店铺/公司";
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArray = [[NSMutableArray alloc]init];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"companyList.plist" ofType:nil];
    NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:filePath];
    NSLog(@"%@",dic);
    for (int i = 0;i < dic.count;i ++) {
       NSArray *array = [dic objectForKey:[NSString stringWithFormat:@"%d",i]];
        [self.dataArray addObject:array];
    }
    UINib *nibCom1 = [UINib nibWithNibName:@"Com1TableViewCell" bundle:nil];
    [self.tableView registerNib:nibCom1 forCellReuseIdentifier:@"Com1TableViewCell"];
    UINib *nibCom2 = [UINib nibWithNibName:@"Com2TableViewCell" bundle:nil];
    [self.tableView registerNib:nibCom2 forCellReuseIdentifier:@"Com2TableViewCell"];
    UINib *nibUs = [UINib nibWithNibName:@"UTSTableViewCell" bundle:nil];
    [self.tableView registerNib:nibUs forCellReuseIdentifier:@"UTSTableViewCell"];
    UINib *nibPri = [UINib nibWithNibName:@"PrintTableViewCell" bundle:nil];
    [self.tableView registerNib:nibPri forCellReuseIdentifier:@"PrintTableViewCell"];
    self.tableView.separatorInset = UIEdgeInsetsZero;
}
#pragma mark--------UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.dataArray[section];
    return array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = self.dataArray[indexPath.section];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            Com1TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Com1TableViewCell" forIndexPath:indexPath];
             cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            [cell setLayoutMargins:UIEdgeInsetsZero];
            cell.name.text = array[indexPath.row];
            return cell;
        }
        if (indexPath.row == 1) {
            Com2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Com2TableViewCell" forIndexPath:indexPath];
             cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            [cell setLayoutMargins:UIEdgeInsetsZero];
            cell.name.text = array[indexPath.row];
            return cell;
        }
        else
        {
            PrintTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PrintTableViewCell" forIndexPath:indexPath];
             cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            [cell setLayoutMargins:UIEdgeInsetsZero];
            cell.name.text = array[indexPath.row];
            return cell;
        }
    }
    if (indexPath.section == 1) {
        UTSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UTSTableViewCell" forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell setLayoutMargins:UIEdgeInsetsZero];
        cell.name.text = array[indexPath.row];
        cell.number.alpha = 0;
        return cell;
    }
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        if (indexPath.row == 2) {
            ComMeViewController *comVC = [ComMeViewController new];
            comVC.titles = self.dataArray[indexPath.section][indexPath.row];
            [self.navigationController pushViewController:comVC animated:YES];
        }
        if (indexPath.row == 3) {
            PeoMesViewController *peopleVC = [PeoMesViewController new];
            peopleVC.titles = self.dataArray[indexPath.section][indexPath.row];
            [self.navigationController pushViewController:peopleVC animated:YES];
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            SPXXViewController *spxxVC = [SPXXViewController new];
            spxxVC.titles = self.dataArray[indexPath.section][indexPath.row];
            [self.navigationController pushViewController:spxxVC animated:YES];
        }
        if (indexPath.row == 1) {
            YGXGViewController *ygglVC = [YGXGViewController new];
            ygglVC.titles = self.dataArray[indexPath.section][indexPath.row];
            [self.navigationController pushViewController:ygglVC animated:YES];
        }
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0&&indexPath.row == 0) {
        return 66;
    }
    return 40;
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
