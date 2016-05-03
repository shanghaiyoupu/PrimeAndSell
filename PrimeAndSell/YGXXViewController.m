//
//  YGXXViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/25.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "YGXXViewController.h"
#import "CusTableViewCell.h"
#import "YGXXTableViewCell.h"
#import "PrintTableViewCell.h"
#import "SelectViewController.h"
@interface YGXXViewController ()

@end

@implementation YGXXViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"员工信息";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveeBtn)];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataName = [[NSMutableArray alloc]init];
    self.dataText = [[NSMutableArray alloc]init];
    NSString *filePath1 = [[NSBundle mainBundle]pathForResource:@"ygxx1List.plist" ofType:nil];
    NSDictionary *dic1 =[[NSDictionary alloc]initWithContentsOfFile:filePath1];
    for (int i = 0; i < dic1.count; i ++) {
        NSArray *array = [dic1 objectForKey:[NSString stringWithFormat:@"%d",i]];
        [self.dataName addObject:array];
    }
    NSString *filePath2 = [[NSBundle mainBundle]pathForResource:@"ygxx2List.plist" ofType:nil];
    NSDictionary *dic2 = [[NSDictionary alloc]initWithContentsOfFile:filePath2];
    for (int i = 0; i < dic2.count; i ++) {
        NSArray *array = [dic2 objectForKey:[NSString stringWithFormat:@"%d",i]];
        [self.dataText addObject:array];
    }
    UINib *nibGoods = [UINib nibWithNibName:@"CusTableViewCell" bundle:nil];
    [self.tableView registerNib:nibGoods forCellReuseIdentifier:@"CusTableViewCell"];
    UINib *nibYGXX = [UINib nibWithNibName:@"YGXXTableViewCell" bundle:nil];
    [self.tableView registerNib:nibYGXX forCellReuseIdentifier:@"YGXXTableViewCell"];
    UINib *nibPri = [UINib nibWithNibName:@"PrintTableViewCell" bundle:nil];
    [self.tableView registerNib:nibPri forCellReuseIdentifier:@"PrintTableViewCell"];
    self.tableView.separatorInset = UIEdgeInsetsZero;
}
#pragma mark----UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataName.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.dataName[section];
    if (section == 4||section == 6) {
        if (isSelect[section]) {
            return 1;
        }
        else
        {
            return array.count;
        }
    }
        return array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arrayName = self.dataName[indexPath.section];
   
    if (indexPath.section == 0||indexPath.section == 1) {
         NSArray *arrayText = self.dataText[indexPath.section];
        CusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CusTableViewCell" forIndexPath:indexPath];
        cell.name.text = arrayName[indexPath.row];
        cell.button.indexPath = indexPath;
        [cell.button addTarget:self action:@selector(btnChoose:) forControlEvents:UIControlEventTouchUpInside];
        cell.textFiled.text = @"";
        cell.textFiled.placeholder = arrayText[indexPath.row];
        cell.separatorInset = UIEdgeInsetsMake(0, 8, 0, 8);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.section == 0&&indexPath.row == 3) {
            cell.button.alpha = 1;
            cell.button.enabled  =YES;
            cell.view1.alpha = 1;
        }
        else
        {
            cell.button.alpha = 0;
            cell.button.enabled = NO;
            cell.view1.alpha = 0;
        }
        return cell;
    }
    if (indexPath.section == 2) {
        PrintTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PrintTableViewCell" forIndexPath:indexPath];
        cell.name.text = [NSString stringWithFormat:@"   %@",arrayName[indexPath.row]];
        cell.name.textColor = [UIColor grayColor];
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setLayoutMargins:UIEdgeInsetsZero];
        return cell;
    }
    else
    {
        YGXXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YGXXTableViewCell" forIndexPath:indexPath];
        cell.number.alpha = 0;
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.imageR.indexPath = indexPath;
        [cell.imageR addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        cell.name.text = arrayName[indexPath.row];
        [cell setLayoutMargins:UIEdgeInsetsZero];
        if ((indexPath.section == 4&&indexPath.row == 0)||((indexPath.section == 6)&&(indexPath.row == 0))) {
            if (isSelect[indexPath.section]) {
                [cell.imageR setBackgroundImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
                cell.number.alpha = 1;
                cell.number.text  = [NSString stringWithFormat:@"%lu",(unsigned long)arrayName.count];
            }
            else
            {
                [cell.imageR setBackgroundImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
                cell.number.alpha = 0;
            }
            
        }
        else
        {
            [cell.imageR setBackgroundImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
        }
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0||indexPath.section == 1||indexPath.section == 2) {
        return 40;
    }
    else
    {
        return 56;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 3) {
        return 40;
    }
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 3) {
        return @"  员工权限设置";
    }
    return nil;
}
- (void)saveeBtn
{
    NSLog(@"保存");
}
- (void)btnChoose:(Button *)btn
{
    SelectViewController *selectVC = [SelectViewController new];
    UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:selectVC];
    CusTableViewCell *cell = [self.tableView cellForRowAtIndexPath:btn.indexPath];
    
    selectVC.content = cell.textFiled.text;
    selectVC.shuXing = ^(NSString *name){
        cell.textFiled.text = name;
    };
    [self presentViewController:navc animated:YES completion:nil];
}
- (void)btnClick:(Button *)btn
{
    isSelect[btn.indexPath.section] = !isSelect[btn.indexPath.section];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:btn.indexPath.section] withRowAnimation:UITableViewRowAnimationNone];
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
