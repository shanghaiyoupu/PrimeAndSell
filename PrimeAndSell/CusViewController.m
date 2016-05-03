//
//  CusViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/19.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "CusViewController.h"
#import "CusTableViewCell.h"
@interface CusViewController ()

@end

@implementation CusViewController
- (void)viewWillAppear:(BOOL)animated
{
   
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(rightBtn)];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor orangeColor]];
    self.title = self.titles;
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    self.tableView.separatorInset = UIEdgeInsetsZero;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINib *nib = [UINib nibWithNibName:@"CusTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"CusTableViewCell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell1"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell2"];
   
    self.dataArray0 = [NSMutableArray new];
    self.dataArray1 = [NSMutableArray new];
    self.dataArray2 = [NSMutableArray new];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"CustomerMessList.plist" ofType:nil] ;
    NSDictionary *dictionary = [[NSDictionary alloc]initWithContentsOfFile:filePath];
    self.dataArray0 = [dictionary objectForKey:@"0"];
    self.dataArray1 = [dictionary objectForKey:@"1"];
    self.dataArray2 = [dictionary objectForKey:@"2"];
     self.dataArray = [[NSMutableArray alloc]initWithObjects:self.dataArray0,self.dataArray1,self.dataArray2, nil];
}
#pragma mark--------UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.dataArray[section];
    return array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = self.dataArray[indexPath.section];
    if (indexPath.section != 2) {
        CusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CusTableViewCell" forIndexPath:indexPath];
        cell.frame = [self setFrame:cell.frame];
        cell.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
        cell.name.text = array[indexPath.row];
        return cell;
    }
    else
    {
        if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell1" forIndexPath:indexPath];
         cell.frame = [self setFrame:cell.frame];
        UISwitch *switchs = [[UISwitch alloc]initWithFrame:CGRectMake(WIDTH- 70, 7, 50, 50)];
            [cell addSubview:switchs];
            switchs.on = YES;
            switchs.onTintColor = [UIColor blueColor];
        cell.textLabel.text = [NSString stringWithFormat:@"  %@",array[indexPath.row]];
            cell.textLabel.textColor = [UIColor grayColor];
            cell.textLabel.font = [UIFont systemFontOfSize:15];
        return cell;
        }
        else
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell2" forIndexPath:indexPath];
            cell.frame = [self setFrame:cell.frame];
           cell.textLabel.text = [NSString stringWithFormat:@"  %@",array[indexPath.row]];
            cell.textLabel.textColor = [UIColor grayColor];
            cell.textLabel.font = [UIFont systemFontOfSize:15];
            return cell;
        }
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section != 2) {
        return 15;
    }
    return 100;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 100)];
        UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        saveBtn.frame = CGRectMake(10, 20, WIDTH-20, 30);
        saveBtn.backgroundColor = [UIColor blueColor];
        [saveBtn addTarget:self action:@selector(saveBtn) forControlEvents:UIControlEventTouchUpInside];
        [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
        [saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [view addSubview:saveBtn];
        UIButton *deleBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        deleBtn.frame = CGRectMake(10, 60, WIDTH-20, 30);
        [deleBtn addTarget:self action:@selector(deleBtn) forControlEvents:UIControlEventTouchUpInside];
        [deleBtn setTitle:@"删除" forState:UIControlStateNormal];
        [deleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        deleBtn.backgroundColor = [UIColor redColor];
        [view addSubview:deleBtn];
        return view;
    }
    return nil;
}
- (CGRect)setFrame:(CGRect)rect1
{
    CGRect rect = rect1;
    rect.size.width = WIDTH;
    return rect;
}
#pragma mark-----------按钮点击事件
//导航条的右侧按钮点击事件
- (void)rightBtn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//保存
- (void)saveBtn
{
    
    CusTableViewCell *cell0 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    CusTableViewCell *cell1 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    CusTableViewCell *cell2 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    CusTableViewCell *cell3 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
    UITextField *name = (UITextField *)[cell0 viewWithTag:1];
    UITextField *zy = (UITextField *)[cell1 viewWithTag:1];
    UITextField *phone = (UITextField *)[cell2 viewWithTag:1];
    UITextField *dress = (UITextField *)[cell3 viewWithTag:1];
    NSLog(@"保存==%@==%@==%@==%@",name.text,zy.text,phone.text,dress.text);

}
//删除
- (void)deleBtn
{
    NSLog(@"删除");
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
