//
//  QZJLViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/26.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "QZJLViewController.h"
#import "XTTableViewCell.h"
#import "XTSTableViewCell.h"
#import "LDTableViewCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
@interface QZJLViewController ()

@end

@implementation QZJLViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"初期客户欠帐记录";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(deleBtn)];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor orangeColor]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINib *nibLD = [UINib nibWithNibName:@"LDTableViewCell" bundle:nil];
    [self.tableView registerNib:nibLD forCellReuseIdentifier:@"LDTableViewCell"];
    UINib *nibXTS = [UINib nibWithNibName:@"XTSTableViewCell" bundle:nil];
    [self.tableView registerNib:nibXTS forCellReuseIdentifier:@"XTSTableViewCell"];
    UINib *nibXT = [UINib nibWithNibName:@"XTTableViewCell" bundle:nil];
    [self.tableView registerNib:nibXT forCellReuseIdentifier:@"XTTableViewCell"];
    
}
#pragma mark-------UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        XTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XTTableViewCell" forIndexPath:indexPath];
        cell.name.text = @"客户";
        cell.text.text = @"老英";
        cell.button.alpha = 0;
        cell.button.enabled = NO;
        return cell;
    }
    if (indexPath.section == 1) {
        XTSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XTSTableViewCell" forIndexPath:indexPath];
        cell.name.text = @"初期客户欠款金额";
        cell.textFile.text = @"0.00";
        return cell;
    }
    if (indexPath.section == 2) {
        LDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LDTableViewCell" forIndexPath:indexPath];
        cell.name.text = @" 备注";
        cell.name.font = [UIFont systemFontOfSize:15];
        cell.jiSuan.font = [UIFont systemFontOfSize:15];
        cell.jiSuan.textColor = [UIColor grayColor];
        cell.jiSuan.text = @"新增客户或账款阶段性结账时初始化客户欠款";
        return cell;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2) {
        return [tableView fd_heightForCellWithIdentifier:@"LDTableViewCell" configuration:^(LDTableViewCell *cell) {
            cell.jiSuan.text = @"新增客户或账款阶段性结账时初始化客户欠款";
        }];
    }
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        return 60;
    }
    return 15;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        UIView *view =  [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 60)];
        UIButton *alertBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        alertBtn.frame = CGRectMake(10, 20, WIDTH-20, 40);
        alertBtn.backgroundColor = [UIColor blueColor];
        [alertBtn addTarget:self action:@selector(queBtn) forControlEvents:UIControlEventTouchUpInside];
        [alertBtn setTitle:@"确认" forState:UIControlStateNormal];
        [alertBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        alertBtn.layer.cornerRadius = 3;
        alertBtn.clipsToBounds = YES;
        [view addSubview:alertBtn];
        return view;
    }
    return nil;
}
- (void)queBtn
{
    
}
- (void)deleBtn
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
