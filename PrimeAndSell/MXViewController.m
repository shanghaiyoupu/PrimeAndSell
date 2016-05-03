//
//  MXViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/18.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "MXViewController.h"
#import "SFTableViewCell.h"
#import "STTableViewCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
@interface MXViewController ()

@end

@implementation MXViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
    self.title = self.titles;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"font"] style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataName = [[NSMutableArray alloc]initWithObjects:@"客户名称",@"总应收金额",@"总实收金额",@"总应收款余额", nil];
    UINib *nibSF = [UINib nibWithNibName:@"SFTableViewCell" bundle:nil];
    [self.tableView registerNib:nibSF forCellReuseIdentifier:@"SFTableViewCell"];
    UINib *nibST = [UINib nibWithNibName:@"STTableViewCell" bundle:nil];
    [self.tableView registerNib:nibST forCellReuseIdentifier:@"STTableViewCell"];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    [self setAddView];
}
#pragma mark----------UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 4;
    }
    if (section == 1) {
        return 5;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        SFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SFTableViewCell" forIndexPath:indexPath];
        cell.name.text = self.dataName[indexPath.row];
        cell.separatorInset = UIEdgeInsetsMake(0, 8, 0, 8);
        cell.frame = [self setFrame:cell.frame];
        return cell;
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            SFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SFTableViewCell" forIndexPath:indexPath];
            cell.name.text = self.titles;
            cell.money.text = @"";
            cell.frame = [self setFrame:cell.frame];
            [cell setLayoutMargins:UIEdgeInsetsZero];
            return cell;
        }
        else
        {
            STTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"STTableViewCell" forIndexPath:indexPath];
            if (indexPath.row != 1) {
                cell.title1.text = @"12222";
                cell.title2.text = @"44444444444444444444444444444222dddddddddddddddd";
                cell.title3.text = @"44444444444444444444444444444222dddddddddddddddd";
                cell.title4.text = @"44444444444444444444444444444222dddddddddddddddd";
                cell.title5.text = @"44444444444444444444444444444222dddddddddddddddd";
            }
            cell.frame = [self setFrame:cell.frame];
            [cell setLayoutMargins:UIEdgeInsetsZero];
            return cell;
        }
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 38;
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return 38;
        }
        else if (indexPath.row == 1)
        {
            return 49;
        }
        else
        {
            return [tableView fd_heightForCellWithIdentifier:@"STTableViewCell" configuration:^(STTableViewCell * cell) {
                cell.title1.text = @"12222";
                cell.title2.text = @"44444444444444444444444444444222dddddddddddddddd";
                cell.title3.text = @"44444444444444444444444444444222dddddddddddddddd";
                cell.title4.text = @"44444444444444444444444444444222dddddddddddddddd";
                 cell.title5.text = @"44444444444444444444444444444222dddddddddddddddd";
            }];
        }
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 1) {
        return 30;
    }
    return 0;
}
- (void)setAddView
{
    backV = [[UIView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64)];
    backV.tag = 111111;
    //backV.backgroundColor = [UIColor redColor];
    backVH = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64)];
    backVH.backgroundColor = [UIColor grayColor];
    backVH.alpha = 0.3;
    [backV addSubview:backVH];
    UIView *backT = [[UIView alloc]initWithFrame:CGRectMake(WIDTH-35, 4, 22, 22)];
    backT.backgroundColor = [UIColor whiteColor];
    backT.transform = CGAffineTransformMakeRotation(M_PI/4);
    backT.layer.borderWidth = 0.5;
    backT.layer.borderColor = [UIColor grayColor].CGColor;
    [backV addSubview:backT];
    UIView *viewB = [[UIView alloc]initWithFrame:CGRectMake(WIDTH-134, 13, 130, 82)];
    viewB.backgroundColor = [UIColor whiteColor];
    [backV addSubview:viewB];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(0, 0, viewB.frame.size.width, 40);
    [button1 addTarget:self action:@selector(shareBtn:) forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitle:@"微信分享" forState:UIControlStateNormal];
    //button1.backgroundColor = [UIColor orangeColor];
    [viewB addSubview:button1];
    UIView *viewX = [[UIView alloc]initWithFrame:CGRectMake(0, 40, viewB.frame.size.width, 0.5)];
    viewX.backgroundColor = [UIColor grayColor];
    [viewB addSubview:viewX];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(0, button1.frame.size.height+1, viewB.frame.size.width, 40);
    [button2 addTarget:self action:@selector(toothBtn:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"蓝牙打印" forState:UIControlStateNormal];
    //button2.backgroundColor = [UIColor orangeColor];
    [viewB addSubview:button2];
    viewB.layer.borderColor = [UIColor grayColor].CGColor;
    viewB.layer.borderWidth = 0.5;
    viewB.layer.cornerRadius = 5;
    viewB.clipsToBounds = YES;
}
- (void)shareBtn:(UIButton *)btn
{
    NSLog(@"微信分享");
}
- (void)toothBtn:(UIButton *)btn
{
    NSLog(@"蓝牙");
}
- (void)rightClick
{
    isSelect = !isSelect;
    if (isSelect) {
        [self.view addSubview:backV];
    }
    else
    {
        [backV removeFromSuperview];
    }
    
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
