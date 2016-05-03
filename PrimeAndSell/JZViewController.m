//
//  JZViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/22.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "JZViewController.h"
#import "HXTTableViewCell.h"
@interface JZViewController ()

@end

@implementation JZViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.title = self.titles;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtn)];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor orangeColor]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:self.filePath];
    self.dataArray = [[NSMutableArray alloc]init];
    NSArray *array0 = [dic objectForKey:@"0"];
    NSArray *array1 = [dic objectForKey:@"1"];
    self.dataArray = [[NSMutableArray alloc]initWithObjects:array0,array1, nil];
    UINib *nib1 = [UINib nibWithNibName:@"HXTTableViewCell" bundle:nil];
    [self.tableView registerNib:nib1 forCellReuseIdentifier:@"HXTTableViewCell1"];
}
- (void)rightBtn
{
    
}
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
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
        }
        cell.detailTextLabel.text = @"针式基础模版";
        cell.detailTextLabel.textColor = [UIColor blackColor];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
        cell.textLabel.text = array[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        return cell;
    }
    if (indexPath.section == 1) {
        HXTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HXTTableViewCell1" forIndexPath:indexPath];
        cell.textLabel.text = array[indexPath.row];
        cell.textLabel.textColor = [UIColor grayColor];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
        return cell;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
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
