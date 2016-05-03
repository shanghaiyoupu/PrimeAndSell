//
//  XZCMViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/25.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "XZCMViewController.h"
#import "SFTableViewCell.h"
#import "XTSTableViewCell.h"
#import "KCGTableViewCell.h"

@interface XZCMViewController ()

@end

@implementation XZCMViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"新增仓库/门店";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveeBtn)];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINib *nibSFT = [UINib nibWithNibName:@"SFTableViewCell" bundle:nil];
    [self.tableView registerNib:nibSFT forCellReuseIdentifier:@"SFTableViewCell"];
    UINib *nibXTS = [UINib nibWithNibName:@"XTSTableViewCell" bundle:nil];
    [self.tableView registerNib:nibXTS forCellReuseIdentifier:@"XTSTableViewCell"];
    UINib *nibKCG = [UINib nibWithNibName:@"KCGTableViewCell" bundle:nil];
    [self.tableView registerNib:nibKCG forCellReuseIdentifier:@"KCGTableViewCell"];
    self.tableView.rowHeight = 40;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    
}
#pragma mark-----UITableViewDelegate,UITableViewDataSource
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
        return 3;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ((indexPath.section == 0&&indexPath.row == 0)||(indexPath.section == 1&&indexPath.row == 1)) {
        XTSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XTSTableViewCell" forIndexPath:indexPath];
        [cell setLayoutMargins:UIEdgeInsetsZero];
        if (indexPath.section == 0&&indexPath.row == 0) {
            cell.name.text = @"名称*";
            cell.textFile.placeholder = @"仓库/门店名称";
        }
        else
        {
            cell.textFile.placeholder = @"三位数字(例如:001)";
            cell.name.text = @"仓库/门店编号*";
        }
        return cell;
    }
    if (indexPath.section == 1&&indexPath.row ==0 ) {
        KCGTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KCGTableViewCell" forIndexPath:indexPath];
        [cell setLayoutMargins:UIEdgeInsetsZero];
        return cell;
    }
    if (indexPath.section == 1&&indexPath.row == 2) {
        SFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SFTableViewCell" forIndexPath:indexPath];
        [cell setLayoutMargins:UIEdgeInsetsZero];
        cell.name.text = @"  备注";
        cell.money.alpha = 0;
        cell.money.enabled = NO;
        cell.name.font = [UIFont systemFontOfSize:15];
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
    return 15;
}
- (void)saveeBtn
{
    NSLog(@"保存");
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
