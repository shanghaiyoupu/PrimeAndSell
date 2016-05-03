//
//  ComMeViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/22.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "ComMeViewController.h"
#import "CusTableViewCell.h"
@interface ComMeViewController ()

@end

@implementation ComMeViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.title = self.titles;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtn)];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor orangeColor]];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArray = [[NSMutableArray alloc]init];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"companyMeList.plist" ofType:nil];
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
    if (indexPath.section == 2) {
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
        cell.name.text = array[indexPath.row];
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
    return 15;
}
- (void)rightBtn
{
    NSIndexPath *indexPath0 = [NSIndexPath indexPathForRow:0 inSection:0];
    CusTableViewCell *cell0 = [self.tableView cellForRowAtIndexPath:indexPath0];
    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:1 inSection:0];
    CusTableViewCell *cell1 = [self.tableView cellForRowAtIndexPath:indexPath1];
    NSIndexPath *indexPath2 = [NSIndexPath indexPathForRow:0 inSection:1];
    CusTableViewCell *cell2 = [self.tableView cellForRowAtIndexPath:indexPath2];
    NSIndexPath *indexPath3 = [NSIndexPath indexPathForRow:1 inSection:1];
    CusTableViewCell *cell3 = [self.tableView cellForRowAtIndexPath:indexPath3];
    NSLog(@"%@===%@====%@===%@",cell0.textFiled.text,cell1.textFiled.text,cell2.textFiled.text,cell3.textFiled.text);
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
