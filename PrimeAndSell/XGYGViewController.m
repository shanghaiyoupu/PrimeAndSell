//
//  XGYGViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/25.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "XGYGViewController.h"
#import "SelectViewController.h"
#import "SFTableViewCell.h"
#import "YGXXTableViewCell.h"
#import "HXTTableViewCell.h"
#import "CusTableViewCell.h"
@interface XGYGViewController ()

@end

@implementation XGYGViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"员工信息";
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveeBtn)];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArray = [[NSMutableArray alloc]init];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"ygxx3List.plist" ofType:nil];
    NSDictionary *dic =[[NSDictionary alloc]initWithContentsOfFile:filePath];
    for (int i = 0; i < dic.count; i ++) {
        NSArray *array = [dic objectForKey:[NSString stringWithFormat:@"%d",i]];
        [self.dataArray addObject:array];
    }
    UINib *nibCus = [UINib nibWithNibName:@"CusTableViewCell" bundle:nil];
    [self.tableView registerNib:nibCus forCellReuseIdentifier:@"CusTableViewCell"];
    UINib *nibHX = [UINib nibWithNibName:@"HXTTableViewCell" bundle:nil];
    [self.tableView registerNib:nibHX forCellReuseIdentifier:@"HXTTableViewCell"];
    UINib *nibYGXX1 = [UINib nibWithNibName:@"YGXXTableViewCell" bundle:nil];
    [self.tableView registerNib:nibYGXX1 forCellReuseIdentifier:@"YGXXTableViewCell1"];
    UINib *nibYGXX2 = [UINib nibWithNibName:@"YGXXTableViewCell" bundle:nil];
    [self.tableView registerNib:nibYGXX2 forCellReuseIdentifier:@"YGXXTableViewCell2"];
    UINib *nibST = [UINib nibWithNibName:@"SFTableViewCell" bundle:nil];
    [self.tableView registerNib:nibST forCellReuseIdentifier:@"SFTableViewCell"];
    self.tableView.separatorInset = UIEdgeInsetsZero;
}
#pragma mark-------UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.dataArray[section];
    if (section == 3||section == 5) {
        if (!isSelect[section]) {
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
    NSArray *array = self.dataArray[indexPath.section];
    if (indexPath.section == 0&&indexPath.row != 2) {
        CusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CusTableViewCell" forIndexPath:indexPath];
        cell.name.text = array[indexPath.row];
        cell.separatorInset = UIEdgeInsetsMake(0, 8, 0, 8);
        return cell;
    }
    if ((indexPath.section == 0&&indexPath.row == 2)||(indexPath.section == 1&&indexPath.row == 1)) {
        SFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SFTableViewCell" forIndexPath:indexPath];
        cell.name.text = array[indexPath.row];
        cell.separatorInset = UIEdgeInsetsMake(0, 8, 0, 8);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.name.text = [NSString stringWithFormat:@"    %@",array[indexPath.row]];
        if (indexPath.section == 1) {
            cell.money.text = @"";
        }
        else
        {
            cell.money.text = [NSString stringWithFormat:@"     17586970987"];
        }
        cell.name.font = [UIFont systemFontOfSize:15];
        return cell;
    }
    if (indexPath.section == 1&&indexPath.row == 0) {
        HXTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HXTTableViewCell" forIndexPath:indexPath];
        [cell setLayoutMargins:UIEdgeInsetsZero];
        cell.textLabel.text = @"帐号是否启用";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = [UIColor grayColor];
        [cell setLayoutMargins:UIEdgeInsetsZero];
        UISwitch *switch1 = [[UISwitch alloc]initWithFrame:CGRectMake(WIDTH-65, 4, 30, 30)];
        switch1.on = YES;
        switch1.tintColor = [UIColor blueColor];
        [cell addSubview:switch1];
        return cell;
    }
   else
   {
       YGXXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YGXXTableViewCell1" forIndexPath:indexPath];
       cell.number.alpha = 0;
       cell.selectionStyle = UITableViewCellSelectionStyleNone;
       cell.imageR.indexPath = indexPath;
       [cell.imageR addTarget:self action:@selector(btnClick1:) forControlEvents:UIControlEventTouchUpInside];
       cell.name.text = array[indexPath.row];
       [cell setLayoutMargins:UIEdgeInsetsZero];
       if ((indexPath.section == 3&&indexPath.row == 0)||((indexPath.section == 5)&&(indexPath.row == 0))) {
           if (!isSelect[indexPath.section]) {
               [cell.imageR setBackgroundImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
               cell.number.alpha = 1;
               cell.number.text  = [NSString stringWithFormat:@"%lu",(unsigned long)array.count];
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
   }return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0||indexPath.section == 1) {
        return 40;
    }
    return 56;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        return 30;
    }
    return 10;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        return @"员工权限设置";
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 5) {
        return 120;
    }
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 5) {
        UIView *view =  [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 120)];
        UIButton *writeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        writeBtn.frame = CGRectMake(10, 20, WIDTH-20, 40);
        writeBtn.backgroundColor = [UIColor blueColor];
        [writeBtn addTarget:self action:@selector(writeBtn) forControlEvents:UIControlEventTouchUpInside];
        [writeBtn setTitle:@"员工密码重置" forState:UIControlStateNormal];
        [writeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [view addSubview:writeBtn];
        UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        deleteBtn.frame = CGRectMake(10, 80, WIDTH-20, 40);
        deleteBtn.backgroundColor = [UIColor redColor];
        [deleteBtn addTarget:self action:@selector(deleteBtn) forControlEvents:UIControlEventTouchUpInside];
        [deleteBtn setTitle:@"删除员工" forState:UIControlStateNormal];
        [deleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [view addSubview:deleteBtn];
        return view;
    }
    return nil;
}
- (void)deleteBtn
{
    NSLog(@"删除员工");
}
- (void)writeBtn
{
    NSLog(@"重设密码");
}
- (void)btnClick1:(Button *)btn
{
    isSelect[btn.indexPath.section] = !isSelect[btn.indexPath.section];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:btn.indexPath.section] withRowAnimation:UITableViewRowAnimationNone];
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
