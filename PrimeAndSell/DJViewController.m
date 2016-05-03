//
//  DJViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/27.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "DJViewController.h"
#import "MFTableViewCell.h"
#import "MSTableViewCell.h"
#import "YSMXViewController.h"
#import "CGJHViewController.h"
#import "CGTHViewController.h"
#import "DJTableViewCell.h"
#import "XGJZViewController.h"
#import "QGKZViewController.h"
#import "MXSCHViewController.h"
#import "MXSTHViewController.h"
#import "KSJDViewController.h"
#import "KHDJViewController.h"
@interface DJViewController ()

@end

@implementation DJViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.scrollView.contentSize = CGSizeMake(WIDTH*2, 0);
    self.tabBarController.tabBar.hidden = YES;
    self.title = self.titles;
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(rightClick)];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor orangeColor]];
    self.automaticallyAdjustsScrollViewInsets = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.scrollView addSubview:self.tableViewL];
    [self.scrollView addSubview:self.tableViewR];
    
}
- (UITableView *)tableViewL
{
    if (!_tableViewL) {
        _tableViewL = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, self.scrollView.frame.size.height) style:UITableViewStyleGrouped];
        _tableViewL.tag = 1000;
        UINib *nibF = [UINib nibWithNibName:@"MFTableViewCell" bundle:nil];
        [self.tableViewL registerNib:nibF forCellReuseIdentifier:@"MFTableViewCell"];
        UINib *nibS = [UINib nibWithNibName:@"MSTableViewCell" bundle:nil];
        [self.tableViewL registerNib:nibS forCellReuseIdentifier:@"MSTableViewCell"];
        UINib *nibDJ = [UINib nibWithNibName:@"DJTableViewCell" bundle:nil];
        [self.tableViewL registerNib:nibDJ forCellReuseIdentifier:@"DJTableViewCell"];
        self.tableViewL.separatorInset = UIEdgeInsetsZero;
        _tableViewL.delegate = self;
        _tableViewL.dataSource = self;
        _tableViewL.separatorInset = UIEdgeInsetsZero;
    }
    return _tableViewL;
}
- (UITableView *)tableViewR
{
    if (!_tableViewR) {
        _tableViewR = [[UITableView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, self.scrollView.frame.size.height) style:UITableViewStyleGrouped];
        _tableViewR.tag = 1001;
        UINib *nibF = [UINib nibWithNibName:@"MFTableViewCell" bundle:nil];
        [self.tableViewR registerNib:nibF forCellReuseIdentifier:@"MFTableViewCell1"];
        UINib *nibS = [UINib nibWithNibName:@"MSTableViewCell" bundle:nil];
        [self.tableViewR registerNib:nibS forCellReuseIdentifier:@"MSTableViewCell1"];
        UINib *nibDJ = [UINib nibWithNibName:@"DJTableViewCell" bundle:nil];
        [self.tableViewR registerNib:nibDJ forCellReuseIdentifier:@"DJTableViewCell1"];
        _tableViewR.delegate = self;
        _tableViewR.dataSource = self;
        _tableViewR.separatorInset = UIEdgeInsetsZero;
    }
    return _tableViewR;
}
#pragma mark-------------UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag == 1000) {
        return 3;
    }
    if (tableView.tag == 1001) {
        return 3;
    }
    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 1000) {
        if (section == 0) {
            return 1;
        }
        if (section == 1) {
            return 1;
        }
        if (section == 2) {
            return 10;
        }
    }
    if (tableView.tag == 1001) {
        if (section == 0) {
            return 1;
        }
        if (section == 1) {
            return 1;
        }
        if (section == 2) {
            return 5;
        }
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1000) {
        if (indexPath.section == 0) {
            DJTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DJTableViewCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.btnL.backgroundColor = [UIColor blueColor];
            [cell.btnL setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [cell.btnR addTarget:self action:@selector(btnR:) forControlEvents:UIControlEventTouchUpInside];
            return cell;
        }
        if (indexPath.section == 1) {
            MFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MFTableViewCell" forIndexPath:indexPath];
            [cell setLayoutMargins:UIEdgeInsetsZero];
            cell.frame = [self setFrame:cell.frame];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
        if (indexPath.section == 2) {
            MSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MSTableViewCell" forIndexPath:indexPath];
            [cell setLayoutMargins:UIEdgeInsetsZero];
            cell.frame = [self setFrame:cell.frame];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
    }
    if (tableView.tag == 1001) {
        if (indexPath.section == 0) {
            DJTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DJTableViewCell1" forIndexPath:indexPath];
            cell.btnR.backgroundColor = [UIColor blueColor];
            [cell.btnR setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell.btnL addTarget:self action:@selector(btnL:) forControlEvents:UIControlEventTouchUpInside];
            return cell;
        }
        if (indexPath.section == 1) {
            MFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MFTableViewCell1" forIndexPath:indexPath];
            [cell setLayoutMargins:UIEdgeInsetsZero];
            cell.frame = [self setFrame:cell.frame];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor greenColor];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
        if (indexPath.section == 2) {
            MSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MSTableViewCell1" forIndexPath:indexPath];
            [cell setLayoutMargins:UIEdgeInsetsZero];
            cell.frame = [self setFrame:cell.frame];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor greenColor];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
    }
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1000) {
        if (indexPath.section == 1) {
            YSMXViewController *ysmxVC = [YSMXViewController new];
            ysmxVC.titles = @"供应商对账明细";
            [self.navigationController pushViewController:ysmxVC animated:YES];
        }
        if (indexPath.section == 2&&indexPath.row == 0) {
            CGJHViewController *cgjhVC = [CGJHViewController new];
            [self.navigationController pushViewController:cgjhVC animated:YES];
        }
        if (indexPath.section == 2&&indexPath.row == 1) {
            CGJHViewController *cgjhVC = [CGJHViewController new];
            [self.navigationController pushViewController:cgjhVC animated:YES];
        }
        if (indexPath.section == 2&&indexPath.row == 2) {
            CGTHViewController *cgthVC = [CGTHViewController new];
            [self.navigationController pushViewController:cgthVC animated:YES];
        }
        if (indexPath.section == 2&&indexPath.row == 3) {
            XGJZViewController *sgjzVC = [XGJZViewController new];
            [self.navigationController pushViewController:sgjzVC animated:YES];
        }
        if (indexPath.section == 2&&indexPath.row == 4) {
            QGKZViewController *qgkzVC = [QGKZViewController new];
            [self.navigationController pushViewController:qgkzVC animated:YES];
        }
    }
    if (tableView.tag == 1001) {
        if (indexPath.section == 1) {
            MXSCHViewController *mxschVC = [MXSCHViewController new];
            [self.navigationController pushViewController:mxschVC animated:YES];
        }
        if (indexPath.section == 2&&indexPath.row == 0) {
            MXSCHViewController *mxschVC = [MXSCHViewController new];
            [self.navigationController pushViewController:mxschVC animated:YES];
        }
        if (indexPath.section == 2&&indexPath.row == 1) {
            MXSTHViewController *mxsthVC = [MXSTHViewController new];
            [self.navigationController pushViewController:mxsthVC animated:YES];
        }
        if (indexPath.section == 2&&indexPath.row == 2) {
            KSJDViewController *ksjdVC = [KSJDViewController new];
            [self.navigationController pushViewController:ksjdVC animated:YES];
        }
        if (indexPath.section == 2&&indexPath.row == 3) {
            KHDJViewController *khdjVC = [KHDJViewController new];
            [self.navigationController pushViewController:khdjVC animated:YES];
        }
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
-  (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 15;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 40;
    }
    return 95;
}
#pragma mark----------UIScrollViewDelegate
- (void)rightClick
{
    
}
- (void)btnL:(UIButton *)btn
{
    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}
- (void)btnR:(UIButton *)btn
{
    [self.scrollView setContentOffset:CGPointMake(WIDTH, 0) animated:YES];
}
- (CGRect)setFrame:(CGRect)rect1
{
    CGRect rect = rect1;
    rect.size.width = WIDTH;
    return rect;
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
