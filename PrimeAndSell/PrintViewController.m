//
//  PrintViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/21.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "PrintViewController.h"
#import "PrintTableViewCell.h"
#import "XTViewController.h"
#import "JZViewController.h"
@interface PrintViewController ()

@end

@implementation PrintViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"打印设置";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"打印二维码" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtn)];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor orangeColor]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataList = [[NSMutableArray alloc]initWithObjects:@"xChuList.plist",@"xTuoList.plist",@"cJinList.plist",@"cTuiList.plist",@"lingShouList.plist",@"kuCunList.plist",@"jiZhangList.plist",@"qianKuList.plist",@"duiZhangList.plist", nil];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"setPrintList.plist" ofType:nil];
    NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:filePath];
    self.dataArray = [dic objectForKey:@"0"];
    UINib *nib = [UINib nibWithNibName:@"PrintTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"PrintTableViewCell"];
    self.tableView.separatorInset = UIEdgeInsetsZero;
}
#pragma mark-------UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PrintTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PrintTableViewCell" forIndexPath:indexPath];
    cell.name.text = self.dataArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [cell setLayoutMargins:UIEdgeInsetsZero];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 8) {
        JZViewController *jzmxVC = [JZViewController new];
        jzmxVC.titles = self.dataArray[indexPath.row];
        jzmxVC.filePath = [[NSBundle mainBundle]pathForResource:self.dataList[indexPath.row] ofType:nil];
        [self.navigationController pushViewController:jzmxVC animated:YES];
    }
    else
    {
        XTViewController *otherVC = [XTViewController new];
        otherVC.titles = self.dataArray[indexPath.row];
        otherVC.filePath = [[NSBundle mainBundle]pathForResource:self.dataList[indexPath.row] ofType:nil];
        otherVC.row = indexPath.row;
        [self.navigationController pushViewController:otherVC animated:YES];
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
//导航条的右侧按钮点击啊事件
- (void)rightBtn
{
    
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
