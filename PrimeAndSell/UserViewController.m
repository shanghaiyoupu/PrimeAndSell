//
//  UserViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/18.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "UserViewController.h"
#import "UTTableViewCell.h"
#import "UTSTableViewCell.h"
#import "SetViewController.h"
#import "ComViewController.h"
#import "LSJLViewController.h"
@interface UserViewController ()

@end

@implementation UserViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
     self.title = @"柚铺公司";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    UINib *nibUT = [UINib nibWithNibName:@"UTTableViewCell" bundle:nil];
    [self.tableView registerNib:nibUT forCellReuseIdentifier:@"UTTableViewCell"];
    UINib *nibUST = [UINib nibWithNibName:@"UTSTableViewCell" bundle:nil];
    [self.tableView registerNib:nibUST forCellReuseIdentifier:@"UTSTableViewCell"];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"usetSetList.plist" ofType:nil];
    NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:filePath];
    NSArray *array0 = [dic objectForKey:@"0"];
    NSArray *array1 = [dic objectForKey:@"1"];
    NSArray *array2 = [dic objectForKey:@"2"];
    NSArray *array3 = [dic objectForKey:@"3"];
    self.dataArray = [[NSMutableArray alloc]initWithObjects:array0,array1,array2,array3, nil];
}
#pragma mark----------UITableViewDelegate,UITableViewDataSource
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
        UTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UTTableViewCell" forIndexPath:indexPath];
        [cell.button addTarget:self action:@selector(buttonWX) forControlEvents:UIControlEventTouchUpInside];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell setLayoutMargins:UIEdgeInsetsZero];
        return cell;
    }
   
        UTSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UTSTableViewCell" forIndexPath:indexPath];
      cell.selectionStyle = UITableViewCellSelectionStyleNone;
      cell.name1 = array[indexPath.row];
      cell.number.frame = [self getFrame:cell.number];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [cell setLayoutMargins:UIEdgeInsetsZero];
        return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        self.title = @"我";
        ComViewController *comVC = [ComViewController new];
        [self.navigationController pushViewController:comVC animated:YES];
    }
    if (indexPath.section == 1) {
        LSJLViewController *lsjlVC = [LSJLViewController new];
        self.title = @"我";
        [self.navigationController pushViewController:lsjlVC animated:YES];
    }
    if (indexPath.section == 3) {
        SetViewController *setVC = [SetViewController new];
        self.title = @"我";
        [self.navigationController pushViewController:setVC animated:YES];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 107;
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
//动态计算
- (CGRect)getFrame:(UILabel *)title
{
    CGSize size = [title.text sizeWithAttributes:[NSDictionary dictionaryWithObject:title.font forKey:NSFontAttributeName]];
    CGRect rect = title.frame;
    rect.size.width = size.width+5;
    return rect;
}
- (void)buttonWX
{
    ComViewController *comVC = [ComViewController new];
    [self.navigationController pushViewController:comVC animated:YES];
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
