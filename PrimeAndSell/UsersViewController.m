//
//  UsersViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/18.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
#define HEIGHT self.scrollView.bounds.size.height
#import "UsersViewController.h"
#import "UFTableViewCell.h"
#import "USTableViewCell.h"
#import "UTFTableViewCell.h"
#import "MessViewController.h"
#import "CusViewController.h"
#import "CTViewController.h"
#import "AddViewController.h"
#import "AddUViewController.h"
#import "PTKHViewController.h"
#import "QZJLViewController.h"
static BOOL isSelect;
@interface UsersViewController ()

@end

@implementation UsersViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.one = 0;
    self.one1 = 0;
    self.tabBarController.tabBar.hidden = NO;
    backV = [[UIView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, Height-64-44)];
    backV.tag = 111111;
    //backV.backgroundColor = [UIColor redColor];
    backVH = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, Height-64-44)];
    backVH.backgroundColor = [UIColor grayColor];
    backVH.alpha = 0.3;
    [backV addSubview:backVH];
    UIView *backT = [[UIView alloc]initWithFrame:CGRectMake(WIDTH-35, 4, 22, 22)];
    backT.backgroundColor = [UIColor whiteColor];
    backT.transform = CGAffineTransformMakeRotation(M_PI/4);
    backT.layer.borderWidth = 0.5;
    backT.layer.borderColor = [UIColor grayColor].CGColor;
    [backV addSubview:backT];
    UIView *viewB = [[UIView alloc]initWithFrame:CGRectMake(WIDTH-134, 13, 130, 82)];
    viewB.backgroundColor = [UIColor whiteColor];
    [backV addSubview:viewB];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(0, 0, viewB.frame.size.width, 40);
    [button1 addTarget:self action:@selector(btnAddUser:) forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitle:@"新增普通客户" forState:UIControlStateNormal];
    //button1.backgroundColor = [UIColor orangeColor];
    [viewB addSubview:button1];
    UIView *viewX = [[UIView alloc]initWithFrame:CGRectMake(0, 40, viewB.frame.size.width, 0.5)];
    viewX.backgroundColor = [UIColor grayColor];
    [viewB addSubview:viewX];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(0, button1.frame.size.height+1, viewB.frame.size.width, 40);
    [button2 addTarget:self action:@selector(btnBook:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"通讯录导入" forState:UIControlStateNormal];
    //button2.backgroundColor = [UIColor orangeColor];
    [viewB addSubview:button2];
    viewB.layer.borderColor = [UIColor grayColor].CGColor;
    viewB.layer.borderWidth = 0.5;
    viewB.layer.cornerRadius = 5;
    viewB.clipsToBounds = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.scrollView.contentSize = CGSizeMake(WIDTH*2, 100);
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    self.searchBar.delegate = self;
    [self.scrollView addSubview:self.tableViewL];
    [self.scrollView addSubview:self.tableViewR];
    self.searchBar.showsCancelButton = NO;
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self setNAVC];
   
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationItem.rightBarButtonItem = nil;
     [self cancelView];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ling" object:nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ling4" object:nil];
}
- (UITableView *)tableViewL
{
    if (!_tableViewL) {
        _tableViewL = [[UITableView alloc]initWithFrame:CGRectMake(0, -34, WIDTH, HEIGHT+121) style:UITableViewStyleGrouped];
        _tableViewL.tag = 2;
        UINib *nibF = [UINib nibWithNibName:@"UFTableViewCell" bundle:nil];
        [_tableViewL registerNib:nibF forCellReuseIdentifier:@"UFTableViewCell"];
        UINib *nibT = [UINib nibWithNibName:@"UTFTableViewCell" bundle:nil];
        [_tableViewL registerNib:nibT forCellReuseIdentifier:@"UTFTableViewCell"];
        _tableViewL.delegate = self;
        _tableViewL.dataSource = self;
        _tableViewL.separatorInset = UIEdgeInsetsZero;
    }
    return _tableViewL;
}
- (UITableView *)tableViewR
{
    if (!_tableViewR) {
        _tableViewR = [[UITableView alloc]initWithFrame:CGRectMake(WIDTH, -34, WIDTH, HEIGHT+121) style:UITableViewStyleGrouped];
        _tableViewR.tag = 3;
        UINib *nibS = [UINib nibWithNibName:@"USTableViewCell" bundle:nil];
        [_tableViewR registerNib:nibS forCellReuseIdentifier:@"USTableViewCell"];
        _tableViewR.delegate = self;
        _tableViewR.dataSource = self;
        _tableViewR.separatorInset = UIEdgeInsetsZero;
    }
    return _tableViewR;
}
- (UIBarButtonItem *)buttonItem
{
    if (!_buttonItem) {
     _buttonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightClick)];
        [_buttonItem setTintColor:[UIColor orangeColor]];
    }
    return _buttonItem;
}
//设置导航条
- (void)setNAVC
{
    self.segment = [[UISegmentedControl alloc]initWithItems:@[@"生意伙伴客户",@"普通客户"]];
    self.segment.frame = CGRectMake(0, 0, 100, 30);
    self.segment.selectedSegmentIndex = 0;
    [self.segment addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventValueChanged];
    self.segment.tintColor = [UIColor orangeColor];
    self.navigationItem.titleView = self.segment;
    self.navigationItem.rightBarButtonItem = nil;
}
#pragma mark-----------------UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag == 2) {
        return 2;
    }
    if (tableView.tag == 3) {
        return 1;
    }
    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 2) {
        if (section == 0) {
            return 1;
        }
      else
      {
         return 10;
      }
    }
    if (tableView.tag == 3) {
        return 5;
    }
    return 0;
   
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 2) {
        if (indexPath.section == 0) {
            UFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UFTableViewCell" forIndexPath:indexPath];
            [cell setLayoutMargins:UIEdgeInsetsZero];
            cell.frame = [self setFrame:cell.frame];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        else
        {
            {
                self.one = 0;
                UTFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UTFTableViewCell" forIndexPath:indexPath];
                [cell setLayoutMargins:UIEdgeInsetsZero];
                cell.frame = [self setFrame:cell.frame];
                cell.scrollView.delegate = self;
                cell.scrollView.tag = indexPath.row+4;
                cell.button.indexPath = indexPath;
                [cell.button addTarget:self action:@selector(btnCell:) forControlEvents:UIControlEventTouchUpInside];
                cell.retBtn.indexPath = indexPath;
                [cell.retBtn addTarget:self action:@selector(btnRet:) forControlEvents:UIControlEventTouchUpInside];
                cell.sellBtn.indexPath = indexPath;
                [cell.sellBtn addTarget:self action:@selector(btnSel:) forControlEvents:UIControlEventTouchUpInside];
                UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longGesture:)];
                longGesture.minimumPressDuration = 3;
                [cell.button addGestureRecognizer:longGesture];
                cell.cusBtn.indexPath = indexPath;
                [cell.cusBtn addTarget:self action:@selector(btnCus:) forControlEvents:UIControlEventTouchUpInside];
                if (self.isRow != indexPath.row) {
                    cell.scrollView.contentOffset = CGPointMake(65, 0);
                    cell.view1.center = CGPointMake(WIDTH/2, 45);
                    
                }
                else
                {
                    if (self.tow!=0) {
                        CGFloat x = WIDTH/2;
                        CGFloat y = 45;
                        x= x - self.offent+65;
                        cell.view1.center = CGPointMake(x, y);
                        cell.scrollView.contentOffset = CGPointMake(self.offent, 0);
                        self.tow++;
                    }
                    
                }
                
                return cell;
 
            }
        }
        
    }
    if (tableView.tag == 3) {
    USTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"USTableViewCell" forIndexPath:indexPath];
            [cell setLayoutMargins:UIEdgeInsetsZero];
            cell.frame = [self setFrame:cell.frame];
        cell.scrollView.delegate = self;
        cell.scrollView.tag = indexPath.row+4;
        cell.button.indexPath = indexPath;
        [cell.button addTarget:self action:@selector(btnCell1:) forControlEvents:UIControlEventTouchUpInside];
        cell.retBtn.indexPath = indexPath;
        [cell.retBtn addTarget:self action:@selector(btnRet:) forControlEvents:UIControlEventTouchUpInside];
        cell.sellBtn.indexPath = indexPath;
        [cell.sellBtn addTarget:self action:@selector(btnSel:) forControlEvents:UIControlEventTouchUpInside];
        UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longGesture:)];
        longGesture.minimumPressDuration = 3;
        [cell.button addGestureRecognizer:longGesture];
        cell.cusBtn.indexPath = indexPath;
        [cell.cusBtn addTarget:self action:@selector(btnCus:) forControlEvents:UIControlEventTouchUpInside];
        if (self.isRow != indexPath.row) {
            cell.scrollView.contentOffset = CGPointMake(65, 0);
            cell.view1.center = CGPointMake(WIDTH/2, 39.5);
            
        }
        else
        {
            if (self.tow!=0) {
                CGFloat x = WIDTH/2;
                CGFloat y = 45;
                x= x - self.offent+65;
                cell.view1.center = CGPointMake(x, y);
                cell.scrollView.contentOffset = CGPointMake(self.offent, 0);
                self.tow++;
            }
            
        }
            return cell;
    }
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 2) {
        self.title = @"客户";
        AddViewController *addView = [AddViewController new];
        [self.navigationController pushViewController:addView animated:YES];
    }
   
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 2) {
        if (indexPath.section == 0) {
            return 46;
        }
        else
        {
           
            return 90
            ;
        }
    }
    if (tableView.tag == 3) {
        
        return 79;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 2) {
        if (section == 1) {
            return 10;
        }
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (tableView.tag == 2) {
        if (section == 0) {
            return 1;
        }
        else
        {
            return 290;
        }
    }
    if (tableView.tag == 3) {
        return 290;
    }
    return 0;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{

    if (tableView.tag == 2) {
        if (section == 1) {
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
            UILabel *label = [[UILabel alloc]init];
            label.bounds = CGRectMake(0, 0, 320, 40);
            label.center = view.center;
            label.textAlignment = NSTextAlignmentCenter;
            label.text = @"10位生意伙伴客户";
            [view addSubview:label];
            view.backgroundColor = [UIColor clearColor];
            return view;
        }
    }
    if (tableView.tag == 3) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
        UILabel *label = [[UILabel alloc]init];
        label.bounds = CGRectMake(0, 0, 320, 40);
        label.center = view.center;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"5位普通客户";
        [view addSubview:label];
        view.backgroundColor = [UIColor clearColor];
        return view;
    }
    return nil;
}

#pragma mark-----------------UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag == 1) {
        return;
    }
    if (scrollView.tag == 2) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"ling" object:nil];
        self.one = 0;
    }
    if (scrollView.tag == 3) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"ling4" object:nil];
        self.one = 0;
    }
   
    if (self.isRow != scrollView.tag-4) {
        return;
    }
    CGFloat xS = scrollView.contentOffset.x;
    
    if (xS <= 0) {
        xS = 0;
    }
    if (xS > 165) {
        xS = 165;
    }
    CGFloat x = WIDTH/2;
    x= x - xS+65;
    if (self.scrollView.contentOffset.x == WIDTH)
    {
        CGFloat y = 39.5;
         NSIndexPath *indexPath = [NSIndexPath indexPathForRow:scrollView.tag-4 inSection:0];
        USTableViewCell *cell = [self.tableViewR cellForRowAtIndexPath:indexPath];
        cell.view1.center = CGPointMake(x, y);
    }
    else
    {
        CGFloat y = 45;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:scrollView.tag-4 inSection:1];
        UTFTableViewCell *cell = [self.tableViewL cellForRowAtIndexPath:indexPath];
        cell.view1.center = CGPointMake(x, y);
    }
   
    
    
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (scrollView.tag == 2||scrollView.tag == 3) {
        return;
    }
    if (self.one == 0) {
        self.isRow = scrollView.tag-4;
        self.one ++;
    }
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.tag == 1) {
        CGFloat x = scrollView.contentOffset.x;
        if (x <= WIDTH/2) {
            self.segment.selectedSegmentIndex = 0;
            [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"ling" object:nil];
            self.one = 0;
        }
        else
        {
            self.segment.selectedSegmentIndex = 1;
            [scrollView setContentOffset:CGPointMake(WIDTH, 0) animated:NO];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"ling4" object:nil];
            self.one = 0;
        }
        return;
    }
    if (scrollView.tag == 2||scrollView.tag == 3) {
        return;
    }
    if (self.one == 0) {
        self.isRow = scrollView.tag-4;
        self.one ++;
    }
    if (self.isRow != scrollView.tag-4) {
        return;
    }
    [self setAnimation:scrollView];
//
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (scrollView.tag == 1) {
        CGFloat x = scrollView.contentOffset.x;
        if (x <= WIDTH/2) {
            self.segment.selectedSegmentIndex = 0;
            [scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"ling" object:nil];
            self.one = 0;
        }
        else
        {
            self.segment.selectedSegmentIndex = 1;
            [scrollView setContentOffset:CGPointMake(WIDTH, 0) animated:YES];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"ling4" object:nil];
            self.one = 0;
        }
        return;
    }
    if (scrollView.tag == 2||scrollView.tag == 3) {
        return;
    }
    if (self.one == 0) {
        self.isRow = scrollView.tag-4;
        self.one ++;
    }
    if (self.isRow != scrollView.tag-4) {
        return;
    }
    [self setAnimation:scrollView];
    
}

- (void)setAnimation:(UIScrollView *)scrollView
{
    CGFloat xS = scrollView.contentOffset.x;
    if (xS >= 0&&xS <= 35) {
        [scrollView setContentOffset: CGPointMake(0, 0) animated:YES];
        self.offent = 0;
    }
    
    if (xS >= 115) {
        [scrollView setContentOffset: CGPointMake(165, 0) animated:YES];
        self.offent = 165;
    }
    if (xS <115 && xS >= 35) {
        [scrollView setContentOffset: CGPointMake(65, 0) animated:YES];
        self.offent = 65;
        self.one = 0;
        NSLog(@"444");
        
    }

}
#pragma mark-----------------UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = YES;
    return YES;
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
    self.searchBar.showsCancelButton = NO;
}
#pragma mark---------------按钮点击事件
- (void)btnCell:(Button *)btn
{
     self.scrollView.contentSize = CGSizeMake(2*WIDTH, 100);
        if (btn.indexPath.section != 0) {
            MessViewController *messVC = [MessViewController new];
            self.title = @"生意伙伴客户";
            messVC.titles = @"老英";
            [self.navigationController pushViewController:messVC animated:YES];
        }
    
}
- (void)btnCell1:(Button *)btn
{
    self.scrollView.contentSize = CGSizeMake(2*WIDTH, 100);
    self.title = @"普通客户";
    PTKHViewController *ptkhVC = [PTKHViewController new];
    ptkhVC.titles = @"盐城";
    [self.navigationController pushViewController:ptkhVC animated:YES];
}
//新增普通客户
- (void)btnAddUser:(UIButton *)btn
{
    AddUViewController *addVC = [AddUViewController new];
    self.title = @"普通客户";
    addVC.titles = @"新增普通客户";
    [self.navigationController pushViewController:addVC animated:YES];
}
//通讯录导入
- (void)btnBook:(UIButton *)btn
{
    
}
//供应商信息
- (void)btnCus:(Button *)btn
{
    CusViewController *cusVC = [CusViewController new];
    UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:cusVC];
    cusVC.titles = @"客户信息";
    [self presentViewController:navc animated:YES completion:nil];
}
//销售退货
- (void)btnRet:(Button *)btn
{
    CTViewController *ctVC = [CTViewController new];
    ctVC.titles = @"销售退货单";
    ctVC.filePath = [[NSBundle mainBundle]pathForResource:@"TuiHuoList.plist" ofType:nil];
    UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:ctVC];
    [self presentViewController:navc animated:YES completion:nil];
   
}
//销售出货
- (void)btnSel:(Button *)btn
{
    CTViewController *ctVC = [CTViewController new];
    ctVC.titles = @"销售出货单";
     ctVC.filePath = [[NSBundle mainBundle]pathForResource:@"SellList.plist" ofType:nil];
    UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:ctVC];
    [self presentViewController:navc animated:YES completion:nil];
}
//UISegmentedControl的单击事件
- (void)btnClick:(UISegmentedControl *)segment
{
    [self cancelView];
    if (segment.selectedSegmentIndex == 0) {
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"ling4" object:nil];
        self.one = 0;
        self.navigationItem.rightBarButtonItem = nil;
    }
    if (segment.selectedSegmentIndex == 1) {
        [self.scrollView setContentOffset:CGPointMake(WIDTH, 0) animated:YES];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"ling" object:nil];
        self.one = 0;
        self.navigationItem.rightBarButtonItem = self.buttonItem;
    }
}
//消失添加普通客户
- (void)cancelView
{
    isSelect = NO;
    UIView *view = [self.view viewWithTag:111111];
    if (view != nil) {
        [view removeFromSuperview];
    }
}
//导航条右侧按钮的点击事件
- (void)rightClick
{
    isSelect = !isSelect;
    if (isSelect) {
        [self.view addSubview:backV];
    }
    else
    {
        [backV removeFromSuperview];
    }
    
}
- (CGRect)setFrame:(CGRect)rect1
{
    CGRect rect = rect1;
    rect.size.width = WIDTH;
    return rect;
}
- (void)longGesture:(UILongPressGestureRecognizer *)longGesture
{
    NSLog(@"长安首饰");
    QZJLViewController *qzjlVC = [QZJLViewController new];
    UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:qzjlVC];
    [self presentViewController:navc animated:YES completion:nil];
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
