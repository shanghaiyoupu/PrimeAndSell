//
//  SelectViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/23.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "SelectViewController.h"
#import "SelectTableViewCell.h"
#import "SelecMesViewController.h"
@interface SelectViewController ()

@end

@implementation SelectViewController
- (void)viewDidAppear:(BOOL)animated
{
    SelectTableViewCell *cell = [self.tableView cellForRowAtIndexPath:self.indexPath];
    cell.duiBtn.alpha  = 1;
    self.shuXing (cell.name.text);
}
- (void)viewWillAppear:(BOOL)animated
{
    self.one = 0;
    self.title = self.titles;
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:self.titlsBtn style:UIBarButtonItemStylePlain target:self action:@selector(leftClick)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(rightClick)];
     [self.navigationItem.rightBarButtonItem setTintColor:[UIColor orangeColor]];
     [self.navigationItem.leftBarButtonItem setTintColor:[UIColor orangeColor]];
    self.automaticallyAdjustsScrollViewInsets  = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArray = [[NSMutableArray alloc]initWithObjects:@"123",@"456",@"222",@"444",@"333",@"111",@"1432",@"666",@"1231",@"4561",@"2221",@"4441",@"3331",@"1111",@"14321",@"6661", nil];
    UINib *nibSele = [UINib nibWithNibName:@"SelectTableViewCell" bundle:nil];
    [self.tableView registerNib:nibSele forCellReuseIdentifier:@"SelectTableViewCell"];
    self.tableView.rowHeight = 50;
    self.tableView.separatorInset = UIEdgeInsetsZero;
}
- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ling1" object:nil];
}
#pragma mark-------UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.one = 0;
    SelectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SelectTableViewCell" forIndexPath:indexPath];
    [cell setLayoutMargins:UIEdgeInsetsZero];
    cell.scrollView.delegate = self;
    cell.scrollView.tag = indexPath.row;
    cell.selectBtn.indexPath = indexPath;
    [cell.selectBtn addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
    cell.editBtn.indexPath = indexPath;
    [cell.editBtn addTarget:self action:@selector(editBtn:) forControlEvents:UIControlEventTouchUpInside];
    cell.deleBtn.indexPath = indexPath;
    [cell.deleBtn addTarget:self action:@selector(deleBtn:) forControlEvents:UIControlEventTouchUpInside];
    cell.name.text = self.dataArray[indexPath.row];
    if ([cell.name.text isEqualToString:self.content]) {
        cell.duiBtn.alpha = 1;
        self.isRow = indexPath.row;
    }
    if (self.isRow != indexPath.row) {
        cell.scrollView.contentOffset = CGPointMake(0, 0);
        cell.viewB.center = CGPointMake(WIDTH/2, 25);
        cell.duiBtn.alpha = 0;
        
    }
    else
    {
//        if (self.tow!=0) {
//            CGFloat x = WIDTH/2;
//            CGFloat y = 25;
//            x= x - self.offent;
//            cell.viewB.center = CGPointMake(x, y);
//            cell.scrollView.contentOffset = CGPointMake(self.offent, 0);
//            self.tow++;
//        }
        
    }
    return cell;
   
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"向左滑动可以进行编辑/删除";
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

#pragma mark-------UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.isRow != scrollView.tag) {
        return;
    }
    CGFloat xS = scrollView.contentOffset.x;
    
    if (xS <= 0) {
        xS = 0;
    }
    if (xS > 80) {
        xS = 80;
    }
    CGFloat x = WIDTH/2;
    CGFloat y = 25;
    x= x - xS;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:scrollView.tag inSection:0];
    SelectTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.viewB.center = CGPointMake(x, y);
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (self.one == 0) {
        self.isRow = scrollView.tag;
        self.one ++;
    }
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    
    if (self.one == 0) {
        self.isRow = scrollView.tag;
        self.one ++;
    }
    if (self.isRow != scrollView.tag) {
        return;
    }
    [self setAnimation:scrollView];
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (self.one == 0) {
        self.isRow = scrollView.tag;
        self.one ++;
    }
    if (self.isRow != scrollView.tag) {
        return;
    }
   
    [self setAnimation:scrollView];
    
}

- (void)setAnimation:(UIScrollView *)scrollView
{
    CGFloat xS = scrollView.contentOffset.x;
    if (xS >= 0&&xS < 40) {
        [scrollView setContentOffset: CGPointMake(0, 0) animated:YES];
        self.offent = 0;
        self.one = 0;
    }
    
    if (xS > 80) {
        [scrollView setContentOffset: CGPointMake(80, 0) animated:YES];
        self.offent = 80;
    }
    if (xS <80 && xS >= 40) {
        [scrollView setContentOffset: CGPointMake(80, 0) animated:YES];
        self.offent = 80;
        
    }
    
}

- (void)selectBtn:(Button *)btn
{
    NSLog(@"selectBtn");
    SelectTableViewCell *cellQ = [self.tableView cellForRowAtIndexPath:self.indexPath];
    cellQ.duiBtn.alpha = 0;
    SelectTableViewCell *cell = [self.tableView cellForRowAtIndexPath:btn.indexPath];
    cell.duiBtn.alpha  = 1;
    self.indexPath = btn.indexPath;
    self.shuXing (cell.name.text);
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)editBtn:(Button *)btn
{
    NSLog(@"editBtn%ld",(long)btn.indexPath.row);
    SelectTableViewCell *cellQ = [self.tableView cellForRowAtIndexPath:self.indexPath];
    cellQ.duiBtn.alpha = 0;
    self.indexPath = btn.indexPath;
    SelecMesViewController *selectVC = [SelecMesViewController new];
     UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:selectVC];
    NSRange range;
    range.location = self.titles.length-2;
    range.length = 2;
    selectVC.titles = [NSString stringWithFormat:@"%@信息",[self.titles substringWithRange:range]];
    SelectTableViewCell *cell = [self.tableView cellForRowAtIndexPath:btn.indexPath];
    cell.alpha = 1;
    selectVC.content = cell.name.text;
    selectVC.chuanZhi = ^(NSString *name){
        cell.name.text = name;
        [self.dataArray replaceObjectAtIndex:btn.indexPath.row withObject:name];
        [self.tableView reloadData];
    };
    [self presentViewController:navc animated:YES completion:nil];
}
- (void)deleBtn:(Button *)btn
{
    [self.dataArray removeObjectAtIndex:btn.indexPath.row];
    [self.tableView reloadData];
    NSLog(@"deleBtn:");
}
- (void)leftClick
{
    
}
- (void)rightClick
{
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
