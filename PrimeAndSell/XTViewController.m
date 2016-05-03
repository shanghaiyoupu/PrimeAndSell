//
//  XTViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/21.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "XTViewController.h"
#import "HXTTableViewCell.h"
#import "QQTableViewCell.h"
@interface XTViewController ()

@end

@implementation XTViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.title = self.titles;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtn)];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor orangeColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataSelect = [[NSMutableArray alloc]init];
    NSDictionary *dicRow = [[NSDictionary alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"selectRowList.plist" ofType:nil]];
    NSArray *array = [dicRow objectForKey:@"0"];
    for (int i = 1; i < [[array objectAtIndex:self.row]intValue] +1; i ++) {
        [self.dataSelect addObject:[NSString stringWithFormat:@"%d",i]];
    }
    NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:self.filePath];
    self.dataArray = [[NSMutableArray alloc]init];
    NSArray *array0 = [dic objectForKey:@"0"];
    NSArray *array1 = [dic objectForKey:@"1"];
    NSArray *array2 = [dic objectForKey:@"2"];
    NSArray *array3 = [dic objectForKey:@"3"];
    self.dataArray = [[NSMutableArray alloc]initWithObjects:array0,array1,array2,array3, nil];
    UINib *nib1 = [UINib nibWithNibName:@"HXTTableViewCell" bundle:nil];
    [self.tableView registerNib:nib1 forCellReuseIdentifier:@"HXTTableViewCell1"];
    UINib *nib3 = [UINib nibWithNibName:@"HXTTableViewCell" bundle:nil];
    [self.tableView registerNib:nib3 forCellReuseIdentifier:@"HXTTableViewCell3"];
    UINib *nibQQ = [UINib nibWithNibName:@"QQTableViewCell" bundle:nil];
    [self.tableView registerNib:nibQQ forCellReuseIdentifier:@"QQTableViewCell"];
    self.tableView.separatorInset = UIEdgeInsetsZero;
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
    if (indexPath.section == 0) {
        HXTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HXTTableViewCell1" forIndexPath:indexPath];
        cell.textLabel.text = array[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        [cell setLayoutMargins:UIEdgeInsetsZero];
        UISwitch *switch1 = [[UISwitch alloc]initWithFrame:CGRectMake(WIDTH-65, 4, 30, 30)];
        switch1.on = YES;
        switch1.tintColor = [UIColor blueColor];
        [cell addSubview:switch1];
        return cell;
    }
    if (indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
        }
        cell.detailTextLabel.text = @"针式基础模版";
        cell.detailTextLabel.textColor = [UIColor blackColor];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
        cell.textLabel.text = array[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        return cell;
    }
    if (indexPath.section == 2) {
        HXTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HXTTableViewCell3" forIndexPath:indexPath];
        cell.textLabel.text = array[indexPath.row];
        cell.textLabel.textColor = [UIColor grayColor];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
        return cell;
    }
    if (indexPath.section == 3) {
        QQTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QQTableViewCell" forIndexPath:indexPath];
        cell.name.text = array[indexPath.row];
        [cell setLayoutMargins:UIEdgeInsetsZero];
        cell.button.tag= indexPath.row;
        BOOL isSelect = NO;
        for (NSString *str in self.dataSelect) {
            if ([str intValue] == indexPath.row+1) {
                isSelect = YES;
                break;
            }
        }
        if (isSelect) {
            cell.button.selected = YES;
        }
        else
        {
            cell.button.selected = NO;
        }
        [cell.button addTarget:self action:@selector(addBtn:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 3) {
        return 25;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 3) {
        UIView *view = [UIView new];
        view.frame = CGRectMake(0, 0, WIDTH, 25);
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(8, 0, WIDTH, 25)];
        label.textColor = [UIColor grayColor];
        label.text = @"要显示的打印项";
        label.font = [UIFont systemFontOfSize:16];
        [view addSubview:label];
        return view;
    }
    return nil;
}
- (void)rightBtn
{
    
}
- (void)addBtn:(Button *)btn
{
    btn.selected = !btn.selected;
    if (btn.isSelected) {
        [self.dataSelect addObject:[NSString stringWithFormat:@"%ld",btn.tag+1]];
        NSLog(@"%@",self.dataSelect);
    }
    else
    {
        [self.dataSelect removeObject:[NSString stringWithFormat:@"%d",btn.tag+1]];
         NSLog(@"===%@",self.dataSelect);
    }
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
