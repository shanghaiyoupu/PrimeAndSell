//
//  AlertPassViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/22.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "AlertPassViewController.h"
#import "PassTableViewCell.h"
@interface AlertPassViewController ()

@end

@implementation AlertPassViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"修改密码";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataTitle = [[NSArray alloc]initWithObjects:@"当前密码",@"新密码",@"确认新密码", nil];
    self.dataText = [[NSArray alloc]initWithObjects:@"请输入当前密码",@"请设置至少六位密码长度",@"请在次输入", nil];
    UINib *nib = [UINib nibWithNibName:@"PassTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"PassTableViewCell"];
    self.tableView.rowHeight = 40;
    self.tableView.separatorInset = UIEdgeInsetsZero;
}
#pragma mark-------UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataText.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PassTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PassTableViewCell" forIndexPath:indexPath];
    cell.name.text = self.dataTitle[indexPath.row];
    cell.textFiled.placeholder = self.dataText[indexPath.row];
    [cell setLayoutMargins:UIEdgeInsetsZero];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 55;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 45)];
    UIButton *alertBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    alertBtn.frame = CGRectMake(10, 15, WIDTH-20, 40);
    alertBtn.backgroundColor = [UIColor blueColor];
    [alertBtn addTarget:self action:@selector(saveBtn) forControlEvents:UIControlEventTouchUpInside];
    [alertBtn setTitle:@"保存" forState:UIControlStateNormal];
    [alertBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    alertBtn.layer.cornerRadius = 3;
    alertBtn.clipsToBounds = YES;
    [view addSubview:alertBtn];
    return view;
}
- (void)saveBtn
{
    NSIndexPath *indexPath0 = [NSIndexPath indexPathForRow:0 inSection:0];
    PassTableViewCell *cell0 = [self.tableView cellForRowAtIndexPath:indexPath0];
    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:1 inSection:0];
    PassTableViewCell *cell1 = [self.tableView cellForRowAtIndexPath:indexPath1];
    NSIndexPath *indexPath2 = [NSIndexPath indexPathForRow:0 inSection:1];
    PassTableViewCell *cell2 = [self.tableView cellForRowAtIndexPath:indexPath2];
    if ([cell0.textFiled.text isEqualToString:@""]||[cell1.textFiled.text isEqualToString:@""]||[cell2.textFiled.text isEqualToString:@""]) {
        NSLog(@"输入的内容不能为空");
        return;
    }
    if (cell1.textFiled.text.length <6) {
        NSLog(@"密码至少6位");
        return;
    }
    if (![cell1.textFiled.text isEqualToString:cell2.textFiled.text]) {
        NSLog(@"两次输入的密码不一致");
        return;
    }
    NSLog(@"保存成功");
    
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
