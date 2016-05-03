//
//  CHViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/20.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "CHViewController.h"
#import "CHZTableViewCell.h"
#import "CHRTableViewCell.h"
#import "Masonry.h"
@interface CHViewController ()

@end

@implementation CHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.isSelect = 0;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(rightBtn)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(leftBtn)];
    self.title = @"选择商品";
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor orangeColor]];
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor orangeColor]];
    [self setXIB];
    [self setView];
    self.tableViewL.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.scrollView.contentSize = CGSizeMake(700, 42);
    self.dataBtn = [[NSMutableArray alloc]init];
    [self setScrollView1];
}
//设置scrollview
- (void)setScrollView1
{
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
        cell.titles.textColor = [UIColor blackColor];
        cell.titles.backgroundColor = [UIColor grayColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        int number = [cell.number.text intValue];
        if (number > 0) {
            cell.number.alpha = 1;
        }
        else
        {
            cell.number.alpha = 0;
        }
        if (indexPath.row == [self getSelectRow]) {
            cell.titles.textColor = [UIColor blueColor];
            cell.titles.backgroundColor = [UIColor whiteColor];
        }
        return cell;
    }
    if (tableView.tag == 2) {
        CHRTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CHRTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delete.indexPath = indexPath;
        [cell.delete addTarget:self action:@selector(cellBtn:) forControlEvents:UIControlEventTouchUpInside];
        int number = [cell.number.text intValue];
        if (number > 0) {
            cell.delete.alpha = 1;
            cell.delete.enabled = YES;
            cell.number.alpha = 1;
        }
        else
        {
            cell.delete.alpha = 0;
            cell.delete.enabled = NO;
            cell.number.alpha = 0;
        }
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
        [userDefault setObject:[NSNumber numberWithInteger:indexPath.row] forKey:@"isSelect"];
        [userDefault synchronize];
        CHZTableViewCell *cellX = [self.tableViewL cellForRowAtIndexPath:indexPath];
        cellX.titles.textColor = [UIColor blueColor];
        cellX.titles.backgroundColor = [UIColor whiteColor];
        [self.tableViewR reloadData];
    }
    if (tableView.tag == 2) {
        int money = [self.money.text intValue];
        money += 100;
        self.money.text = [NSString stringWithFormat:@"%d",money];
        int num = [self.number.text intValue];
        num ++;
        self.number.text = [NSString stringWithFormat:@"%d",num];
        if (num >9) {
             self.number.frame = [self getFrame:self.number];
        }
        [self setView];
        CHRTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        CHZTableViewCell *cellL = [self.tableViewL cellForRowAtIndexPath:[NSIndexPath indexPathForRow:[self getSelectRow] inSection:0]];
        int numberL = [cellL.number.text intValue];
        numberL ++;
        cellL.number.text = [NSString stringWithFormat:@"%d",numberL];
        if (numberL > 0) {
            cellL.number.alpha = 1;
            if (numberL >= 10) {
                cellL.number.frame = [self getFrame:cellL.number];
            }
        }
        else
        {
          cellL.number.alpha = 0;
        }
        int number = [cell.number.text intValue];
        number ++;
        cell.number.text = [NSString stringWithFormat:@"%d",number];
        if (number > 0) {
            cell.delete.alpha = 1;
            cell.delete.enabled = YES;
            cell.number.alpha = 1;
            if (number >= 10) {
                cell.number.frame = [self getFrame:cell.number];
            }
        }
        else
        {
            cell.delete.alpha = 0;
            cell.delete.enabled = NO;
            cell.number.alpha = 0;
        }
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
#pragma mark----------按钮事件
//类别的点击事件
- (void)leiBtn:(UIButton *)btn
{
    NSLog(@"rrrrrrrr");
    [self.tableViewL reloadData];
    [self.tableViewR reloadData];
}
//导航条的左侧按钮事件
- (void)leftBtn
{
    
}
//导航条的右侧按钮事件
- (void)rightBtn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)cellBtn:(Button *)btn
{
    int money = [self.money.text intValue];
    money -= 100;
    if (money == 0) {
       self.money.text = @"0.00";
    }
    else
    {
    self.money.text = [NSString stringWithFormat:@"%d",money];
    }
    int num = [self.number.text intValue];
    num --;
    self.number.text = [NSString stringWithFormat:@"%d",num];
    if (num >9) {
        self.number.frame = [self getFrame:self.number];
    }
    [self setView];
    CHZTableViewCell *cellL = [self.tableViewL cellForRowAtIndexPath:[NSIndexPath indexPathForRow:[self getSelectRow] inSection:0]];
    int numberL = [cellL.number.text intValue];
    numberL --;
    cellL.number.text = [NSString stringWithFormat:@"%d",numberL];
    if (numberL > 0) {
       cellL.number.alpha = 1;
        if (numberL >= 10) {
            cellL.number.frame = [self getFrame:cellL.number];
        }
        
    }
    else
    {
       cellL.number.alpha = 0;
    }
    CHRTableViewCell *cell = [self.tableViewR cellForRowAtIndexPath:btn.indexPath];
    int number = [cell.number.text intValue];
    number --;
    cell.number.text = [NSString stringWithFormat:@"%d",number];
    if (number > 0) {
        cell.delete.alpha = 1;
        cell.delete.enabled = YES;
        cell.number.alpha = 1;
        if (number >= 10) {
            cell.number.frame = [self getFrame:cell.number];
        }
        
    }
    else
    {
        cell.delete.alpha = 0;
        cell.delete.enabled = NO;
        cell.number.alpha = 0;
    }
}
- (NSInteger)getSelectRow
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSInteger row = [[userDefault objectForKey:@"isSelect"] integerValue];
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
- (void)setView
{
    if ([self.number.text intValue] == 0) {
        int width = [UIScreen mainScreen].bounds.size.width - self.ok.frame.size.width;
       
        self.viewM.frame = CGRectMake(0, 0, width, 44);
    }
    else
    {
        int width = [UIScreen mainScreen].bounds.size.width - self.ok.frame.size.width;
        
        self.viewM.frame = CGRectMake(68, 0, width-68, 44);
   
    }
    self.number.layer.cornerRadius = 9;
    self.number.clipsToBounds = YES;
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

- (IBAction)ok:(id)sender {
}
@end
