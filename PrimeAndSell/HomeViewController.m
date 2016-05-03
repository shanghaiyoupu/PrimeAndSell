//
//  HomeViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/18.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "HomeViewController.h"
#import "UTSTableViewCell.h"
#import "KCGLTableViewCell.h"
#import "XZCMViewController.h"
#import "KCDBViewController.h"
#import "MDGLViewController.h"
#import "KCPDViewController.h"
static BOOL isSelect;

@interface HomeViewController ()

@end

@implementation HomeViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.one = 0;
    self.one1 = 0;
    self.title = @"库存管理";
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightClick)];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor orangeColor]];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    UINib *nibUTST = [UINib nibWithNibName:@"UTSTableViewCell" bundle:nil];
    [self.tableview registerNib:nibUTST forCellReuseIdentifier:@"UTSTableViewCell"];
    UINib *nibKGCL = [UINib nibWithNibName:@"KCGLTableViewCell" bundle:nil];
    [self.tableview registerNib:nibKGCL forCellReuseIdentifier:@"KCGLTableViewCell"];
    self.tableview.separatorInset = UIEdgeInsetsZero;
    self.automaticallyAdjustsScrollViewInsets = NO;
}
- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ling4" object:nil];
}
#pragma mark------UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }
    return 15;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UTSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UTSTableViewCell" forIndexPath:indexPath];
        [cell setLayoutMargins:UIEdgeInsetsZero];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.number.alpha = 0;
        if (indexPath.row == 0) {
            cell.name.text = @"库存调拨纪录";
        }
        else
        {
            cell.name.text = @"库存盘点纪录";
        }
        return cell;
    }
    if (indexPath.section == 1) {
        KCGLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KCGLTableViewCell" forIndexPath:indexPath];
        cell.scrollView.delegate = self;
        cell.scrollView.tag = indexPath.row+3;
        cell.button.indexPath = indexPath;
        [cell.button addTarget:self action:@selector(btnCell:) forControlEvents:UIControlEventTouchUpInside];
        cell.panBtn.indexPath = indexPath;
        [cell.panBtn addTarget:self action:@selector(btnPan:) forControlEvents:UIControlEventTouchUpInside];
        cell.sellBtn.indexPath = indexPath;
        [cell.sellBtn addTarget:self action:@selector(btnSel:) forControlEvents:UIControlEventTouchUpInside];
        cell.cusBtn.indexPath = indexPath;
        [cell.cusBtn addTarget:self action:@selector(btnCus:) forControlEvents:UIControlEventTouchUpInside];
        if (self.isRow != indexPath.row) {
            cell.scrollView.contentOffset = CGPointMake(50, 0);
            cell.view1.center = CGPointMake(WIDTH/2, 35);
            
        }
        else
        {
            if (self.tow!=0) {
                CGFloat x = WIDTH/2;
                CGFloat y = 45;
                x= x - self.offent+65;
                cell.view1.center = CGPointMake(x, y);
                cell.scrollView.contentOffset = CGPointMake(self.offent, 0);
                self.tow++;
            }
            
        }
        [cell setLayoutMargins:UIEdgeInsetsZero];
        return cell;
    }
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            KCDBViewController *kcdbVC = [KCDBViewController new];
            [self.navigationController pushViewController:kcdbVC animated:YES];
        }
        if (indexPath.row == 1) {
            KCPDViewController *kcpdVC = [KCPDViewController new];
            [self.navigationController pushViewController:kcpdVC animated:YES];
        }
        
    }
    if (indexPath.section == 1) {
       
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return @"仓库/门店";
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 40;
    }
    return 70;
}
#pragma mark-----------------UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag == 1) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"ling" object:nil];
        self.one = 0;
    }
    if (self.isRow != scrollView.tag-3) {
        return;
    }
    CGFloat xS = scrollView.contentOffset.x;
    
    if (xS <= 0) {
        xS = 0;
    }
    if (xS > 150) {
        xS = 150;
    }
    CGFloat x = WIDTH/2;
    x= x - xS+50;
        CGFloat y = 35;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:scrollView.tag-3 inSection:1];
        KCGLTableViewCell *cell = [self.tableview cellForRowAtIndexPath:indexPath];
        cell.view1.center = CGPointMake(x, y);
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (scrollView.tag == 1) {
        return;
    }
    if (self.one == 0) {
        self.isRow = scrollView.tag-3;
        self.one ++;
    }
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.tag == 1) {
        return;
    }
    if (self.one == 0) {
        self.isRow = scrollView.tag-3;
        self.one ++;
    }
    if (self.isRow != scrollView.tag-3) {
        return;
    }
    [self setAnimation:scrollView];
    //
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (scrollView.tag == 1) {
        return;
    }
    if (self.one == 0) {
        self.isRow = scrollView.tag-3;
        self.one ++;
    }
    if (self.isRow != scrollView.tag-3) {
        return;
    }
    [self setAnimation:scrollView];
    
}

- (void)setAnimation:(UIScrollView *)scrollView
{
    CGFloat xS = scrollView.contentOffset.x;
    if (xS >= 0&&xS <= 30) {
        [scrollView setContentOffset: CGPointMake(0, 0) animated:YES];
        self.offent = 0;
    }
    
    if (xS >= 100) {
        [scrollView setContentOffset: CGPointMake(150, 0) animated:YES];
        self.offent = 150;
    }
    if (xS <100 && xS >= 35) {
        [scrollView setContentOffset: CGPointMake(50, 0) animated:YES];
        self.offent = 50;
        self.one = 0;
        
    }
    
}
- (void)rightClick
{
    XZCMViewController *xzcmVC = [XZCMViewController new];
    [self.navigationController pushViewController:xzcmVC animated:YES];
}
- (void)btnCell:(Button *)btn
{
    KCGLTableViewCell *cell = [self.tableview cellForRowAtIndexPath:btn.indexPath];
    MDGLViewController *mdglVC = [MDGLViewController new];
    mdglVC.titles = [NSString stringWithFormat:@"%@库存",cell.name.text];
    [self.navigationController pushViewController:mdglVC animated:YES];
}
- (void)btnPan:(Button *)btn
{
    NSLog(@"pan");
}
- (void)btnSel:(Button *)btn
{
    NSLog(@"btnSel");
}
- (void)btnCus:(Button *)btn
{
    NSLog(@"btnCus:");
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
