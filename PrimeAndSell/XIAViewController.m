//
//  XIAViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/22.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "XIAViewController.h"
#import "XPXXTableViewCell.h"
@interface XIAViewController ()

@end

@implementation XIAViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"已下架商品";
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINib *nib = [UINib nibWithNibName:@"XPXXTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"XPXXTableViewCell"];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.rowHeight = 90;
    self.automaticallyAdjustsScrollViewInsets = NO;
}
#pragma mark------UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XPXXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XPXXTableViewCell" forIndexPath:indexPath];
    cell.redTitle.alpha = 0;
    [cell setLayoutMargins:UIEdgeInsetsZero];
    return cell;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"撤销\n下架";
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (IBAction)clearBtn:(id)sender {
    NSLog(@"已经清空");
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
