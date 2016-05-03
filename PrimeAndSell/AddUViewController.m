//
//  AddUViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/21.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "AddUViewController.h"
#import "CusTableViewCell.h"
@interface AddUViewController ()

@end

@implementation AddUViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    self.title = self.titles;;
    UINib *nibC = [UINib nibWithNibName:@"CusTableViewCell" bundle:nil];
    [self.tableView registerNib:nibC forCellReuseIdentifier:@"CusTableViewCell"];
    UINib *nibC1 = [UINib nibWithNibName:@"CusTableViewCell" bundle:nil];
    [self.tableView registerNib:nibC1 forCellReuseIdentifier:@"CusTableViewCell1"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtn)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor orangeColor];
    self.dataMess = [[NSMutableArray alloc]init];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"AddUserMess.plist" ofType:nil];
    NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:filePath];
    NSArray *array0 = [dic objectForKey:@"0"];
    NSArray *array1 = [dic objectForKey:@"1"];
    [self.dataMess addObject:array0];
    [self.dataMess addObject:array1];
    self.dataTitle = [[NSMutableArray alloc]init];
    NSString *filePath1 = [[NSBundle mainBundle]pathForResource:@"CustomerMessList.plist" ofType:nil];
    NSDictionary *dic1 = [[NSDictionary alloc]initWithContentsOfFile:filePath1];
    NSArray *array2 = [dic1 objectForKey:@"0"];
    NSArray *array3 = [dic1 objectForKey:@"1"];
    NSArray *array4 = [dic1 objectForKey:@"2"];
    [self.dataTitle addObject:array2];
    [self.dataTitle addObject:array3];
    [self.dataTitle addObject:array4];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arrayTitlt = self.dataTitle[indexPath.section];
    NSArray *arrayMess = nil;
    if (indexPath.section != 2) {
        CusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CusTableViewCell" forIndexPath:indexPath];
        cell.textFiled.text = @"";
        cell.textFiled.alpha = 1;
        cell.view.alpha = 1;
        arrayMess = self.dataMess[indexPath.section];
         cell.name.text = arrayTitlt[indexPath.row];
        cell.textFiled.placeholder = arrayMess[indexPath.row];
        [cell setLayoutMargins:UIEdgeInsetsZero];
        return cell;
    }
    else
    {
        if (indexPath.row == 0) {
            CusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CusTableViewCell1" forIndexPath:indexPath];
            cell.textFiled.alpha = 0;
            cell.view.alpha = 0;
            cell.name.text = arrayTitlt[indexPath.row];
            UISwitch *switch1 = [[UISwitch alloc]initWithFrame:CGRectMake(cell.frame.size.width-60, 6, 40, 30)];
            switch1.on = YES;
            switch1.tintColor = [UIColor blueColor];
            [cell addSubview:switch1];
            [cell setLayoutMargins:UIEdgeInsetsZero];
            return cell;
        }
        else
        {
            CusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CusTableViewCell" forIndexPath:indexPath];
            [cell setLayoutMargins:UIEdgeInsetsZero];
            cell.name.text = arrayTitlt[indexPath.row];
            cell.textFiled.alpha = 0;
            cell.view.alpha = 0;
            return cell;
        }
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 42;
}
//导航条的右侧按钮事件
- (void)rightBtn
{
    
    CusTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    CusTableViewCell *cell1 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    CusTableViewCell *cell2 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    CusTableViewCell *cell3 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
    NSLog(@"%@==%@==%@==%@",cell.textFiled.text,cell1.textFiled.text,cell2.textFiled.text,cell3.textFiled.text);
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
