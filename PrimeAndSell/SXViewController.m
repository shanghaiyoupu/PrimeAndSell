//
//  SXViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/26.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "SXViewController.h"
#import "CusTableViewCell.h"
#import "SelectViewController.h"
@interface SXViewController ()

@end

@implementation SXViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(deleBtn)];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor orangeColor]];
    self.title = @"查询";
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
    self.dateCompont = [calendar components:unitFlags fromDate:now];
}
- (void)viewDidAppear:(BOOL)animated
{
    [self.pickView reloadAllComponents];
    [self.pickView selectRow:[self.dateCompont year]-1949 inComponent:0 animated:YES];
    [self.pickView selectRow:[self.dateCompont month]-1 inComponent:1 animated:YES];
    [self.pickView selectRow:[self.dateCompont day]-1 inComponent:2 animated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataName = [[NSMutableArray alloc]initWithObjects:@"开始日期",@"结束日期",@"单号", nil];
    UINib *nib = [UINib nibWithNibName:@"CusTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"CusTableViewCell"];
    self.tableView.rowHeight = 40;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    [self getRiQi];
}
#pragma mark------------UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CusTableViewCell" forIndexPath:indexPath];
    cell.view1.alpha = 0;
    cell.view.alpha = 0;
    cell.button.alpha = 0;
    cell.button.enabled  =NO;
    cell.button.indexPath = indexPath;
    cell.textFiled.enabled = YES;
    [cell.button addTarget:self action:@selector(btnSelect:) forControlEvents:UIControlEventTouchUpInside];
    if (indexPath.row == 2) {
        cell.view.alpha = 1;
        cell.textFiled.placeholder = @"请输入单号";
    }
    else
    {
        cell.view1.alpha = 1;
        cell.button.alpha = 1;
        cell.button.enabled = YES;
        cell.textFiled.enabled = NO;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.name.text = self.dataName[indexPath.row];
    cell.textFiled.text = @"";
    cell.separatorInset = UIEdgeInsetsMake(0, 8, 0, 8);
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 60;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
        UIView *view =  [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 60)];
        UIButton *alertBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        alertBtn.frame = CGRectMake(10, 20, WIDTH-20, 40);
        alertBtn.backgroundColor = [UIColor blueColor];
        [alertBtn addTarget:self action:@selector(searchBtn) forControlEvents:UIControlEventTouchUpInside];
        [alertBtn setTitle:@"搜索" forState:UIControlStateNormal];
        [alertBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        alertBtn.layer.cornerRadius = 3;
        alertBtn.clipsToBounds = YES;
        [view addSubview:alertBtn];
        return view;
}
#pragma mark-------UIPickerViewDelegate,UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.dataYear.count;
    }
    if (component == 1) {
        return self.dataMouth.count;
    }
    if (component == 2) {
        NSInteger selectRow0 = [pickerView selectedRowInComponent:0];
        NSInteger selectRow1 = [pickerView selectedRowInComponent:1];
        int year = [self.dataYear[selectRow0] intValue];
        int mouth = [self.dataMouth[selectRow1] intValue];
        NSLog(@"%d",year);
        if ((year%400 == 0)||((year%4==0)&&(year%100!=0))) {
            if (mouth == 2) {
                return 29;
            }
            
            else
            {
                if (mouth == 1||mouth == 3||mouth == 5|| mouth== 7|| mouth == 8|| mouth == 10 ||mouth == 12) {
                    return 31;
                }
                else
                {
                    return 30;
                }
            }
            
        }
        else
        {
            if (mouth == 2) {
                return 28;
            }
            
            else
            {
                if (mouth == 1||mouth == 3||mouth == 5|| mouth== 7|| mouth == 8|| mouth == 10 ||mouth == 12) {
                    return 31;
                }
                else
                {
                    return 30;
                }
            }
        }
        
    }
    return 0;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return self.dataYear[row];
    }
    if (component == 1) {
        return self.dataMouth[row];
    }
    if (component == 2) {
        return self.dataDay[row];
    }
    return nil;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        [pickerView reloadAllComponents];
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
    if (component == 1) {
        [pickerView reloadAllComponents];
        [pickerView selectRow:0 inComponent:2 animated:YES];
    }
    NSInteger selectRow0 = [pickerView selectedRowInComponent:0];
    NSInteger selectRow1 = [pickerView selectedRowInComponent:1];
    NSInteger selectRow2 = [pickerView selectedRowInComponent:2];
    CusTableViewCell *cell = [self.tableView cellForRowAtIndexPath:self.indexPath];
    cell.textFiled.text = [NSString stringWithFormat:@"%@-%@-%@",self.dataYear[selectRow0],self.dataMouth[selectRow1],self.dataDay[selectRow2]];
}
- (void)btnSelect:(Button *)btn
{
    self.indexPath = btn.indexPath;
    [UIView animateWithDuration:0.3 animations:^{
            self.pickBack.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
        }];
    
}
- (void)searchBtn
{
    NSLog(@"搜索");
}
- (void)deleBtn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)getRiQi
{
    self.pickBack = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT, WIDTH, HEIGHT)];
    self.pickBack.backgroundColor = [UIColor clearColor];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
    [self.pickBack addGestureRecognizer:tapGesture];
    [self.view addSubview:self.pickBack];
    self.pickView = [[UIPickerView alloc]initWithFrame:CGRectMake((WIDTH-250)/2, HEIGHT-200, 250, 100)];
    self.pickView.backgroundColor = [UIColor blueColor];
    self.pickView.delegate  =self;
    self.pickView.dataSource = self;
    [self.pickBack addSubview:self.pickView];
    self.dataYear = [[NSMutableArray alloc]init];
    self.dataMouth = [[NSMutableArray alloc]init];
    self.dataDay = [[NSMutableArray alloc]init];
    for (int i = 1949; i < 10000; i ++) {
        [self.dataYear addObject:[NSString stringWithFormat:@"%d",i]];
    }
    for (int i = 1; i < 13; i ++) {
        [self.dataMouth addObject:[NSString stringWithFormat:@"%d",i]];
    }
    for (int i = 1; i <= 31; i ++) {
        [self.dataDay addObject:[NSString stringWithFormat:@"%d",i]];
    }
}
- (void)tapGesture:(UITapGestureRecognizer *)tap
{
    [UIView animateWithDuration:0.3 animations:^{
        self.pickBack.frame = CGRectMake(0, HEIGHT, WIDTH, HEIGHT);
    }];
}
- (IBAction)clearBtn:(id)sender {
    NSLog(@"清空");
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
