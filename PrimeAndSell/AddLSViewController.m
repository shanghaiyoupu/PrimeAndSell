//
//  AddLSViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/28.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "AddLSViewController.h"
#import "CusTableViewCell.h"
#import "XTTableViewCell.h"
#import "SFTableViewCell.h"
#import "XTSTableViewCell.h"
#import "XTITableViewCell.h"
#import "AddTableViewCell.h"
#import "CHViewController.h"
@interface AddLSViewController ()

@end

@implementation AddLSViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"零售单";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor orangeColor]];
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.separatorInset = UIEdgeInsetsZero;
    [self setXIB];
}
//注册XIB
- (void)setXIB
{
    UINib *nibC = [UINib nibWithNibName:@"CusTableViewCell" bundle:nil];
    [self.tableView registerNib:nibC forCellReuseIdentifier:@"CusTableViewCell"];
    UINib *nibXT = [UINib nibWithNibName:@"XTTableViewCell" bundle:nil];
    [self.tableView registerNib:nibXT forCellReuseIdentifier:@"XTTableViewCell"];
    UINib *nibST = [UINib nibWithNibName:@"SFTableViewCell" bundle:nil];
    [self.tableView registerNib:nibST forCellReuseIdentifier:@"SFTableViewCell"];
    UINib *nibXTS = [UINib nibWithNibName:@"XTSTableViewCell" bundle:nil];
    [self.tableView registerNib:nibXTS forCellReuseIdentifier:@"XTSTableViewCell"];
    UINib *nibXTI = [UINib nibWithNibName:@"XTITableViewCell" bundle:nil];
    [self.tableView registerNib:nibXTI forCellReuseIdentifier:@"XTITableViewCell"];
    UINib *nibADD = [UINib nibWithNibName:@"AddTableViewCell" bundle:nil];
    [self.tableView registerNib:nibADD forCellReuseIdentifier:@"AddTableViewCell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}
#pragma mark-------------UITableViewDataSource,UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        return 4;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        XTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XTTableViewCell" forIndexPath:indexPath];
        cell.button.alpha = 0;
        cell.button.enabled  =NO;
        cell.label.alpha = 0;
        [cell.button addTarget:self action:@selector(homeBtn:) forControlEvents:UIControlEventTouchUpInside];
        cell.name.text = @"出货仓库";
        cell.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
        return cell;
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            SFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SFTableViewCell" forIndexPath:indexPath];
            cell.money.alpha = 0;
            cell.name.font = [UIFont systemFontOfSize:15];
            cell.name.text = @"零售明细";
            [cell setLayoutMargins:UIEdgeInsetsZero];
            return cell;
        }
        else if (indexPath.row == 3) {
            AddTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddTableViewCell" forIndexPath:indexPath];
            [cell.addBtn addTarget:self action:@selector(btnAdd:) forControlEvents:UIControlEventTouchUpInside];
            return cell;
        }
        else
        {
            XTITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XTITableViewCell" forIndexPath:indexPath];
            [cell setLayoutMargins:UIEdgeInsetsZero];
            return cell;
        }
        
        
    }
    if (indexPath.section == 2) {
        XTSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XTSTableViewCell" forIndexPath:indexPath];
        if (indexPath.row == 0) {
            cell.textFile.enabled = YES;
            cell.textFile.text = @"0.00";
            cell.view1.alpha = 1;
        }
        cell.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
        cell.name.text = @"实收金额";
        return cell;
    }
    if (indexPath.section == 3) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
        cell.textLabel.text = @"备注";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = [UIColor grayColor];
        return cell;
    }
    return nil;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 37;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section != 4) {
        return 15;
    }
    return 40;
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

- (IBAction)jieZhang:(id)sender {
}
@end
