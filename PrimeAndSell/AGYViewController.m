//
//  AGYViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/27.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "AGYViewController.h"
#import "AddUTableViewCell.h"
#import "AddSTableViewCell.h"
@interface AGYViewController ()

@end

@implementation AGYViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.tableView.separatorInset = UIEdgeInsetsZero;
    [self getXIB];
}
//注册XIB
- (void)getXIB
{
    UINib *nibAddU = [UINib nibWithNibName:@"AddUTableViewCell" bundle:nil];
    [self.tableView registerNib:nibAddU forCellReuseIdentifier:@"AddUTableViewCell"];
    UINib *nibAddS = [UINib nibWithNibName:@"AddSTableViewCell" bundle:nil];
    [self.tableView registerNib:nibAddS forCellReuseIdentifier:@"AddSTableViewCell"];
}
#pragma mark-----------UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 7;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        AddUTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddUTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.phone.text = @" 添加手机联系人为生意伙伴供应商";
            cell.wx.text = @" 扫一扫添加生意伙伴供应商";
        return cell;
    }
    if (indexPath.section == 1) {
        AddSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddSTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setLayoutMargins:UIEdgeInsetsZero];
        return cell;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 102;
    }
    if (indexPath.section == 1) {
        return 85;
    }
    return 0;
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
