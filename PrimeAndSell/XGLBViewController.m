//
//  XGLBViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/25.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "XGLBViewController.h"
#import "SFTableViewCell.h"
#import "CusTableViewCell.h"
#import "SelectViewController.h"
@interface XGLBViewController ()

@end

@implementation XGLBViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"老板信息";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveeBtn)];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArray = [[NSMutableArray alloc]init];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"peopleMesList.plist" ofType:nil];
    NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:filePath];
    for (int i = 0; i < dic.count; i ++) {
        NSArray *array = [dic objectForKey:[NSString stringWithFormat:@"%d",i]];
        [self.dataArray addObject:array];
    }
    UINib *nibSF = [UINib nibWithNibName:@"SFTableViewCell" bundle:nil];
    [self.tableView registerNib:nibSF forCellReuseIdentifier:@"SFTableViewCell"];
    UINib *nibCus = [UINib nibWithNibName:@"CusTableViewCell" bundle:nil];
    [self.tableView registerNib:nibCus forCellReuseIdentifier:@"CusTableViewCell"];
    self.tableView.separatorInset = UIEdgeInsetsZero;
}
#pragma mark-------UITableViewDelegate,UITableViewDataSource
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
    if ((indexPath.section == 1)||(indexPath.section == 0&&indexPath.row == 4)||(indexPath.section == 0&&indexPath.row == 2)) {
        SFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SFTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.name.text = [NSString stringWithFormat:@"    %@",array[indexPath.row]];
        if (indexPath.section == 1) {
            cell.money.text = [NSString stringWithFormat:@"     注册人拥有所有权"];
        }
        else
        {
        cell.money.text = [NSString stringWithFormat:@"     17586970987"];
        }
        cell.name.font = [UIFont systemFontOfSize:15];
        return cell;
    }
    else
    {
        CusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CusTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == 3) {
            cell.button.alpha = 1;
            cell.button.enabled = YES;
            cell.button.indexPath = indexPath;
            [cell.button addTarget:self action:@selector(btnChoose:) forControlEvents:UIControlEventTouchUpInside];
            cell.view1.alpha = 1;
        }
        else
        {
            cell.button.alpha = 0;
            cell.view1.alpha = 0;
            cell.button.enabled = NO;
        }
        cell.name.text = array[indexPath.row];
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (void)btnChoose:(Button *)btn
{
    SelectViewController *selectVC = [SelectViewController new];
    UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:selectVC];
    CusTableViewCell *cell = [self.tableView cellForRowAtIndexPath:btn.indexPath];
    selectVC.titles = @"选择店名";
    selectVC.content = cell.textFiled.text;
    selectVC.shuXing = ^(NSString *name){
        cell.textFiled.text = name;
    };
    [self presentViewController:navc animated:YES completion:nil];
}
- (void)saveeBtn
{
    NSLog(@"保存");
    NSIndexPath *indexPath0 = [NSIndexPath indexPathForRow:0 inSection:0];
    CusTableViewCell *cell0 = [self.tableView cellForRowAtIndexPath:indexPath0];
     NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:1 inSection:0];
     CusTableViewCell *cell1 = [self.tableView cellForRowAtIndexPath:indexPath1];
    NSIndexPath *indexPath3 = [NSIndexPath indexPathForRow:3 inSection:0];
    CusTableViewCell *cell3 = [self.tableView cellForRowAtIndexPath:indexPath3];
     NSIndexPath *indexPath2 = [NSIndexPath indexPathForRow:2 inSection:0];
    SFTableViewCell *cell2 = [self.tableView cellForRowAtIndexPath:indexPath2];
    NSIndexPath *indexPath4 = [NSIndexPath indexPathForRow:4 inSection:0];
    SFTableViewCell *cell4 = [self.tableView cellForRowAtIndexPath:indexPath4];
    NSLog(@"%@==%@==%@==%@==%@",cell0.textFiled.text,cell1.textFiled.text,cell2.money.text,cell3.textFiled.text,cell4.money.text);
    
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
