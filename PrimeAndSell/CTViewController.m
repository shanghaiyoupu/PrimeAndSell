//
//  CTViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/19.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "CTViewController.h"
#import "CusTableViewCell.h"
#import "XTTableViewCell.h"
#import "SFTableViewCell.h"
#import "XTSTableViewCell.h"
#import "XTITableViewCell.h"
#import "AddTableViewCell.h"
#import "CHViewController.h"
@interface CTViewController ()

@end

@implementation CTViewController
- (void)viewWillAppear:(BOOL)animated
{
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(rightBtn)];
    self.title = self.titles;
    NSRange range ;
    range.location = 0;
    range.length = self.titles.length-1;
    [self.btnSell setTitle:[self.titles substringWithRange:range] forState:UIControlStateNormal];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor orangeColor]];
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    self.tableView.separatorInset = UIEdgeInsetsZero;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSDictionary *dictionary = [[NSDictionary alloc]initWithContentsOfFile:self.filePath];
    self.dataArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < dictionary.count;i ++) {
        NSArray *array = [dictionary objectForKey:[NSString stringWithFormat:@"%d",i]];
        [self.dataArray addObject:array];
    }
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
    NSArray *array = self.dataArray[section];
    if (section == 1) {
        return array.count+4;
    }
    return array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSArray *array = self.dataArray[indexPath.section];
    if (indexPath.section == 0) {
        XTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XTTableViewCell" forIndexPath:indexPath];
        if (indexPath.row == 0) {
            cell.button.alpha = 0;
        }
        if (indexPath.row == 1) {
            cell.button.alpha = 1;
        }
        [cell.button addTarget:self action:@selector(homeBtn:) forControlEvents:UIControlEventTouchUpInside];
        cell.name.text = array[indexPath.row];
        cell.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
        cell.frame = [self setFrame:cell.frame];
        return cell;
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            SFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SFTableViewCell" forIndexPath:indexPath];
            cell.money.alpha = 0;
            cell.name.font = [UIFont systemFontOfSize:15];
            cell.name.text = array[indexPath.row];
            [cell setLayoutMargins:UIEdgeInsetsZero];
            cell.frame = [self setFrame:cell.frame];
            return cell;
        }
        else if (indexPath.row == 3) {
            AddTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddTableViewCell" forIndexPath:indexPath];
            [cell.addBtn addTarget:self action:@selector(btnAdd:) forControlEvents:UIControlEventTouchUpInside];
            cell.frame = [self setFrame:cell.frame];
            return cell;
        }
        else
        {
            XTITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XTITableViewCell" forIndexPath:indexPath];
            [cell setLayoutMargins:UIEdgeInsetsZero];
            cell.frame = [self setFrame:cell.frame];
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
        if (indexPath.row == 1) {
            cell.textFile.enabled = NO;
            cell.textFile.text = @"999.9999.00元";
            cell.view1.alpha = 0;
        }
        cell.frame = [self setFrame:cell.frame];
        cell.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
        cell.name.text = array[indexPath.row];
        return cell;
    }
    if (indexPath.section == 3) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
            cell.textLabel.text = array[indexPath.row];
            cell.textLabel.font = [UIFont systemFontOfSize:15];
            cell.textLabel.textColor = [UIColor grayColor];
            cell.frame = [self setFrame:cell.frame];
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
#pragma mark--------按钮的点击事件
//导航条的右侧按钮事件
- (void)rightBtn
{
    [self dismissViewControllerAnimated:YES completion:nil];

}
//添加仓库
- (void)homeBtn:(UIButton *)btn
{
    NSLog(@"homeBtn");
}
//草稿
- (IBAction)btnCao:(id)sender {
    NSLog(@"草稿");
}
//销售
- (IBAction)btnSell:(id)sender {
     NSLog(@"销售");
}
//添加按钮
- (void)btnAdd:(UIButton *)btn
{
   CHViewController *chooseVC = [CHViewController new];
    UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:chooseVC];
    [self presentViewController:navc animated:YES completion:nil];
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
