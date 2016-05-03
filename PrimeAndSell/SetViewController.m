//
//  SetViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/21.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "SetViewController.h"
#import "UTSTableViewCell.h"
#import "PrintViewController.h"
@interface SetViewController ()

@end

@implementation SetViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
    self.title = @"设置";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *fileTitle = [[NSBundle mainBundle]pathForResource:@"setList.plist" ofType:nil];
    NSDictionary *dicT = [[NSDictionary alloc]initWithContentsOfFile:fileTitle];
    NSArray *arrayT0 = [dicT objectForKey:@"0"];
    NSArray *arrayT1 = [dicT objectForKey:@"1"];
    self.dataTitle = [[NSMutableArray alloc]initWithObjects:arrayT0,arrayT1, nil];
    NSString *fileImage = [[NSBundle mainBundle]pathForResource:@"setImageList.plist" ofType:nil];
    NSDictionary *dicI = [[NSDictionary alloc]initWithContentsOfFile:fileImage];
    NSArray *arrayI0 = [dicI objectForKey:@"0"];
    NSArray *arrayI1 = [dicI objectForKey:@"1"];
    self.dataImage = [[NSMutableArray alloc]initWithObjects:arrayI0,arrayI1, nil];
    UINib *nib = [UINib nibWithNibName:@"UTSTableViewCell" bundle:nil];
    [self.tableVIew registerNib:nib forCellReuseIdentifier:@"UTSTableViewCell"];
}
#pragma mark--------UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataTitle.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.dataTitle[section];
    return array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arrayI = self.dataImage[indexPath.section];
    NSArray *arrayT = self.dataTitle[indexPath.section];
    UTSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UTSTableViewCell" forIndexPath:indexPath];
    cell.imageV.image = [UIImage imageNamed:arrayI[indexPath.row]];
    cell.name.text = arrayT[indexPath.row];
    cell.number.alpha = 0;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [cell setLayoutMargins:UIEdgeInsetsZero];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0&&indexPath.row == 0) {
        PrintViewController *printVC = [PrintViewController new];
        [self.navigationController pushViewController:printVC animated:YES];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 39;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 15;
    }
    return 45;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
   

    if (section == 1) {
         UIView *view = [UIView new];
        view.frame = CGRectMake(0, 15, WIDTH, 30);
        UIButton *exitBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [exitBtn setTitle:@"推出登陆" forState:UIControlStateNormal];
        [exitBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:exitBtn];
        [exitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        exitBtn.backgroundColor = [UIColor whiteColor];
        exitBtn.bounds = CGRectMake(0, 0, WIDTH, 30);
        exitBtn.center = view.center;
        return view;
    }
    return nil;
}
//推出按钮点击事件
- (void)btnClick:(UIButton *)btn
{
    NSLog(@"推出成功");
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
