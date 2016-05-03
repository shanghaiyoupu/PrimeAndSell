//
//  SelecMesViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/25.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "SelecMesViewController.h"
#import "XTSTableViewCell.h"
@interface SelecMesViewController ()

@end

@implementation SelecMesViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.title = self.titles;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UINib *nib = [UINib nibWithNibName:@"XTSTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"XTSTableViewCell"];
    self.tableView.separatorInset = UIEdgeInsetsZero;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XTSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XTSTableViewCell" forIndexPath:indexPath];
    cell.textFile.text = self.content;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 45;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
   UIView *view =  [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 45)];
   UIButton *alertBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    alertBtn.frame = CGRectMake(10, 20, WIDTH-20, 40);
    alertBtn.backgroundColor = [UIColor redColor];
    [alertBtn addTarget:self action:@selector(saveBtn) forControlEvents:UIControlEventTouchUpInside];
    [alertBtn setTitle:@"保存" forState:UIControlStateNormal];
    [alertBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    alertBtn.layer.cornerRadius = 3;
    alertBtn.clipsToBounds = YES;
    [view addSubview:alertBtn];
    return view;
}
- (void)saveBtn
{
    XTSTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    self.chuanZhi(cell.textFile.text);
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
