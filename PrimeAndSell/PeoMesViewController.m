//
//  PeoMesViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/22.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "PeoMesViewController.h"
#import "CusTableViewCell.h"
#import "AlertPassViewController.h"
@interface PeoMesViewController ()

@end

@implementation PeoMesViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.title = self.titles;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArray = [[NSMutableArray alloc]init];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"peopleMesList.plist" ofType:nil];
    NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:filePath];
    for (int i = 0; i < dic.count; i ++) {
        NSArray *array = [dic objectForKey:[NSString stringWithFormat:@"%d",i]];
        [self.dataArray addObject:array];
    }
    UINib *nibCus = [UINib nibWithNibName:@"CusTableViewCell" bundle:nil];
    [self.tableView registerNib:nibCus forCellReuseIdentifier:@"CusTableViewCell"];
    self.tableView.separatorInset = UIEdgeInsetsZero;
}
#pragma mark-------UITableViewDelegate,UITableViewDataSource
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
    if (indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
            cell.textLabel.font = [UIFont systemFontOfSize:15];
            cell.textLabel.textColor = [UIColor grayColor];
        }
        
        cell.textLabel.text = [NSString stringWithFormat:@"  %@",array[indexPath.row]];
        return cell;
    }
    else
    {
        CusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CusTableViewCell" forIndexPath:indexPath];
        cell.textFiled.text = @"";
        cell.textFiled.placeholder = @"请输入地址";
        cell.textFiled.enabled = NO;
        cell.name.text = array[indexPath.row];
        cell.view.alpha = 0;
        cell.separatorInset = UIEdgeInsetsMake(0, 8, 0, 8);
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
    if (section == 0) {
        return 15;
    }
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 1) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 45)];
        UIButton *alertBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        alertBtn.frame = CGRectMake(10, 15, WIDTH-20, 40);
        alertBtn.backgroundColor = [UIColor blueColor];
        [alertBtn addTarget:self action:@selector(alertPass) forControlEvents:UIControlEventTouchUpInside];
        [alertBtn setTitle:@"修改登录密码" forState:UIControlStateNormal];
        [alertBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        alertBtn.layer.cornerRadius = 3;
        alertBtn.clipsToBounds = YES;
        [view addSubview:alertBtn];
        return view;
    }
    return nil;
}
- (void)alertPass
{
    AlertPassViewController *alertVC = [AlertPassViewController new];
    [self.navigationController pushViewController:alertVC animated:YES];
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
