//
//  YGSSViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/25.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "YGSSViewController.h"
#import "XTSTableViewCell.h"
#import "HXTTableViewCell.h"
@interface YGSSViewController ()

@end

@implementation YGSSViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
      self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    self.title = @"员工搜索";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor orangeColor]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINib *nibHXT = [UINib nibWithNibName:@"HXTTableViewCell" bundle:nil];
    [self.tableView registerNib:nibHXT forCellReuseIdentifier:@"HXTTableViewCell"];
    UINib *nibCus = [UINib nibWithNibName:@"XTSTableViewCell" bundle:nil];
    [self.tableView registerNib:nibCus forCellReuseIdentifier:@"XTSTableViewCell"];
    self.tableView.rowHeight = 40;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    
}
#pragma mark-------UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        HXTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HXTTableViewCell" forIndexPath:indexPath];
        cell.textLabel.text = @"是否启用";
        cell.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = [UIColor grayColor];
        [cell setLayoutMargins:UIEdgeInsetsZero];
        UISwitch *switch1 = [[UISwitch alloc]initWithFrame:CGRectMake(WIDTH-65, 4, 30, 30)];
        switch1.on = YES;
        switch1.tintColor = [UIColor blueColor];
        [cell addSubview:switch1];
        return cell;
    }
    else
    {
    XTSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XTSTableViewCell" forIndexPath:indexPath];
        cell.name.textColor = [UIColor grayColor];
        if (indexPath.row == 0) {
            cell.name.text = @"员工帐号";
            cell.textFile.text = @"";
            cell.textFile.placeholder = @"员工帐号";
        }
        if (indexPath.row == 1) {
            cell.name.text = @"员工姓名";
            cell.textFile.text = @"";
            cell.textFile.placeholder = @"员工姓名";
        }
    cell.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
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
    return 60;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view =  [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 60)];
    UIButton *alertBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    alertBtn.frame = CGRectMake(10, 20, WIDTH-20, 40);
    alertBtn.backgroundColor = [UIColor blueColor];
    [alertBtn addTarget:self action:@selector(searchBtn) forControlEvents:UIControlEventTouchUpInside];
    [alertBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [alertBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    alertBtn.layer.cornerRadius = 3;
    alertBtn.clipsToBounds = YES;
    [view addSubview:alertBtn];
    return view;
}
- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)searchBtn
{
    NSLog(@"搜索");
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
