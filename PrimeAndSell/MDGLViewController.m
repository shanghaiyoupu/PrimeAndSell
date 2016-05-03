//
//  MDGLViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/26.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "MDGLViewController.h"
#import "CHZTableViewCell.h"
#import "CHRTableViewCell.h"
#import "Masonry.h"
#import "KCMXViewController.h"
@interface MDGLViewController ()

@end

@implementation MDGLViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.title = self.titles;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setXIB];
    self.tableViewL.separatorStyle = UITableViewCellSeparatorStyleNone;
}
//设置XIB
- (void)setXIB
{
    UINib *nibL = [UINib nibWithNibName:@"CHZTableViewCell" bundle:nil];
    [self.tableViewL registerNib:nibL forCellReuseIdentifier:@"CHZTableViewCell"];
    UINib *nibR = [UINib nibWithNibName:@"CHRTableViewCell" bundle:nil];
    [self.tableViewR registerNib:nibR forCellReuseIdentifier:@"CHRTableViewCell"];
}
#pragma mark-----------UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 1) {
        return 5;
    }
    if (tableView.tag == 2) {
        return 10;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1) {
        CHZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CHZTableViewCell" forIndexPath:indexPath];
        cell.number.alpha  = 0;
        cell.titles.textColor = [UIColor blackColor];
        cell.titles.backgroundColor = [UIColor grayColor];
        if (indexPath.row == [self getSelectRow]) {
            cell.titles.textColor = [UIColor blueColor];
            cell.titles.backgroundColor = [UIColor whiteColor];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
    }
    if (tableView.tag == 2) {
        CHRTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CHRTableViewCell" forIndexPath:indexPath];
        cell.number.alpha = 0;
        cell.delete.enabled  =NO;
        cell.delete.alpha  =0;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView.tag == 1)
    {
        
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        self.isSelect = [self getSelectRow];
        CHZTableViewCell *cellO = [self.tableViewL cellForRowAtIndexPath:[NSIndexPath indexPathForRow:self.isSelect inSection:0]];
        cellO.titles.textColor = [UIColor blackColor];
        cellO.titles.backgroundColor = [UIColor grayColor];
        [userDefault setObject:[NSNumber numberWithInteger:indexPath.row] forKey:@"isSelect3"];
        [userDefault synchronize];
        CHZTableViewCell *cellX = [self.tableViewL cellForRowAtIndexPath:indexPath];
        cellX.titles.textColor = [UIColor blueColor];
        cellX.titles.backgroundColor = [UIColor whiteColor];
        [self.tableViewR reloadData];
    }
    if (tableView.tag == 2) {
        KCMXViewController *kcmxVC = [KCMXViewController new];
        [self.navigationController pushViewController:kcmxVC animated:YES];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1) {
        return 40;
    }
    if (tableView.tag == 2) {
        return 90;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)getSelectRow
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSInteger row = [[userDefault objectForKey:@"isSelect3"] integerValue];
    return row;
}
//计算宽度
- (CGRect)getFrame:(UILabel *)title
{
    CGSize size = [title.text sizeWithAttributes:[NSDictionary dictionaryWithObject:title.font forKey:NSFontAttributeName]];
    CGRect rect = title.frame;
    rect.size.width = size.width+5;
    NSLog(@"%@",NSStringFromCGRect(rect));
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
