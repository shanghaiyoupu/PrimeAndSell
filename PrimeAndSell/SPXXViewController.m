//
//  SPXXViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/22.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "SPXXViewController.h"
#import "UTSTableViewCell.h"
#import "XPXXTableViewCell.h"
#import "CHZTableViewCell.h"
#import "XIAViewController.h"
#import "GoodsViewController.h"
@interface SPXXViewController ()

@end

@implementation SPXXViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.title = self.titles;
     self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINib *nibUTS = [UINib nibWithNibName:@"UTSTableViewCell" bundle:nil];
    [self.tableViewS registerNib:nibUTS forCellReuseIdentifier:@"UTSTableViewCell"];
    UINib *nibXPXX = [UINib nibWithNibName:@"XPXXTableViewCell" bundle:nil];
    [self.tableViewR registerNib:nibXPXX forCellReuseIdentifier:@"XPXXTableViewCell"];
    UINib *nibXHZ = [UINib nibWithNibName:@"CHZTableViewCell" bundle:nil];
    [self.tableViewL registerNib:nibXHZ forCellReuseIdentifier:@"CHZTableViewCell"];
    self.tableViewS.scrollEnabled = NO;
    self.tableViewS.separatorInset = UIEdgeInsetsZero;
    self.tableViewL.separatorInset = UIEdgeInsetsZero;
    self.tableViewR.separatorInset = UIEdgeInsetsZero;
    [self setScrollView1];
}
- (void)setScrollView1
{
    self.scrollView.contentSize = CGSizeMake(700, 42);
    self.dataBtn = [[NSMutableArray alloc]init];
    for (int i= 0; i < 4; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(90*i, 1, 80, 40);
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor blueColor]];
        [button setTitle:@"裙子" forState:UIControlStateNormal];
        button.tag = i+1;
        UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longGesture:)];
        [button addGestureRecognizer:longGesture];
        [button addTarget:self action:@selector(leiBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:button];
        [self.dataBtn addObject:button];
    }
}
#pragma mark---------UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 1) {
        return 1;
    }
    if (tableView.tag == 2) {
        return 4;
    }
    if (tableView.tag == 3) {
        return 6;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1) {
        UTSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UTSTableViewCell" forIndexPath:indexPath];
        cell.number.alpha = 0;
        cell.name.text = @"已下架商品";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell setLayoutMargins:UIEdgeInsetsZero];
        return cell;
    }
    if (tableView.tag == 2) {
        CHZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CHZTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.separatorInset = UIEdgeInsetsMake(0, [UIScreen mainScreen].bounds.size.width/2, 0, [UIScreen mainScreen].bounds.size.width/2);
        cell.number.alpha = 0;
        if (indexPath.row == [self getSelectRow]) {
            cell.titles.textColor = [UIColor blueColor];
            cell.titles.backgroundColor = [UIColor whiteColor];
        }
        return cell;
    }
    if (tableView.tag == 3) {
        XPXXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XPXXTableViewCell" forIndexPath:indexPath];
        [cell setLayoutMargins:UIEdgeInsetsZero];
        return cell;
    }
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1) {
        XIAViewController *xiaVC = [XIAViewController new];
        [self.navigationController pushViewController:xiaVC animated:YES];
    }
    if (tableView.tag == 2) {
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        self.isSelect = [self getSelectRow];
        CHZTableViewCell *cellO = [self.tableViewL cellForRowAtIndexPath:[NSIndexPath indexPathForRow:self.isSelect inSection:0]];
        cellO.titles.textColor = [UIColor blackColor];
        cellO.titles.backgroundColor = [UIColor grayColor];
        [userDefault setObject:[NSNumber numberWithInteger:indexPath.row] forKey:@"isSelect1"];
        [userDefault synchronize];
        CHZTableViewCell *cellX = [self.tableViewL cellForRowAtIndexPath:indexPath];
        cellX.titles.textColor = [UIColor blueColor];
        cellX.titles.backgroundColor = [UIColor whiteColor];
        [self.tableViewR reloadData];
    }
    if (tableView.tag == 3) {
        GoodsViewController *goodsVC = [GoodsViewController new];
        [self.navigationController pushViewController:goodsVC animated:YES];
    }
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 3) {
        return UITableViewCellEditingStyleDelete;
    }
    
    return UITableViewCellEditingStyleNone;
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 3) {
        return YES;
    }
    return NO;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1) {
        return 39;
    }
    if (tableView.tag == 2) {
        return 43;
    }
    if (tableView.tag == 3) {
        return 90;
    }
    return 0;
}
- (void)longGesture:(UILongPressGestureRecognizer *)sender
{
    UIButton *btn = (UIButton *)sender.view;
    if (sender.state == UIGestureRecognizerStateBegan) {
        startPoint = [sender locationInView:sender.view];
        originPoint = btn.center;
        [UIView animateWithDuration:0.5 animations:^{
            btn.transform = CGAffineTransformMakeScale(1.1, 1.1);
            btn.alpha = 0.7;
        }];
    }
    else if (sender.state == UIGestureRecognizerStateChanged)
    {
        CGPoint newPoint = [sender locationInView:sender.view];
        CGFloat detaX = newPoint.x - startPoint.x;
        CGFloat detaY = newPoint.y - startPoint.y;
        btn.center = CGPointMake(btn.center.x+detaX, btn.center.y+detaY);
        NSInteger index = [self indexofPoint:btn.center with:btn];
        if (index < 0) {
            contain = NO;
        }
        else
        {
            [UIView animateWithDuration:0.5 animations:^{
                CGPoint temp = CGPointZero;
                UIButton *button = self.dataBtn[index];
                temp = button.center;
                button.center = originPoint;
                btn.center = temp;
                originPoint = btn.center;
                contain = YES;
            }];
        }
    }
    else if (sender.state == UIGestureRecognizerStateEnded)
    {
        [UIView
         animateWithDuration:0.5 animations:^{
             btn.transform = CGAffineTransformIdentity;
             btn.alpha = 1;
             if (!contain) {
                 btn.center = originPoint;
             }
         }];
    }
}
- (NSInteger)indexofPoint:(CGPoint)point with:(UIButton *)btn
{
    for (NSInteger i = 0; i < self.dataBtn.count; i++) {
        UIButton * button = self.dataBtn[i];
        if (button != btn) {
            if (CGRectContainsPoint(button.frame, point)) {
                return i;
            }
        }
    }
    return -1;
}
- (NSInteger)getSelectRow
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSInteger row = [[userDefault objectForKey:@"isSelect1"] integerValue];
    return row;
}
- (void)leiBtn:(UIButton *)btn
{
    NSLog(@"rrrrrrrr");
    [self.tableViewL reloadData];
    [self.tableViewR reloadData];
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
