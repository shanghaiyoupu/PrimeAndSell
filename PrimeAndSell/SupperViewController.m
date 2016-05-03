//
//  SupperViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/18.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
#define HEIGHT self.scrollView.bounds.size.height
#import "SupperViewController.h"
#import "UFTableViewCell.h"
#import "USTableViewCell.h"
#import "UTFTableViewCell.h"
#import "PTYSViewController.h"
#import "CusViewController.h"
#import "AGYViewController.h"
#import "AddUViewController.h"
#import "PTKHViewController.h"
#import "QZJLViewController.h"
#import "DJViewController.h"
static BOOL isSelect;
@interface SupperViewController ()

@end

@implementation SupperViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.one = 0;
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
    [button1 setTitle:@"新增普通供应商" forState:UIControlStateNormal];
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
    self.scrollView.contentSize = CGSizeMake(2*WIDTH, 110);
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    self.searchBtn.delegate = self;
    [self.scrollView addSubview:self.tableViewL];
    [self.scrollView addSubview:self.tableViewR];
    self.searchBtn.showsCancelButton = NO;
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
    self.segment = [[UISegmentedControl alloc]initWithItems:@[@"生意伙伴供应商",@"普通供应商"]];
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
            cell.name.text = @"添加生意伙伴供应商";
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
                cell.name.text = @"夏岛";
                cell.titles.text = @"欠供应商款:";
                cell.redTitle.text = @"有3张待确认的单据";
                cell.scrollView.tag = indexPath.row+4;
                cell.button.indexPath = indexPath;
                [cell.button addTarget:self action:@selector(btnCell:) forControlEvents:UIControlEventTouchUpInside];
                UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longGesture:)];
                longGesture.minimumPressDuration = 4;
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
        cell.name.text = @"爱等鸟";
        cell.titles.text = @"欠供应商";
        [cell.chuBtn setTitle:@"采购进货" forState:UIControlStateNormal];
        [cell.tuiBtn setTitle:@"采购退货" forState:UIControlStateNormal];
        [cell.gongBtn setTitle:@"供应商信息" forState:UIControlStateNormal];
        cell.scrollView.delegate = self;
        cell.scrollView.tag = indexPath.row+4;
        cell.button.indexPath = indexPath;
        [cell.button addTarget:self action:@selector(btnCell1:) forControlEvents:UIControlEventTouchUpInside];
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
        [cell setLayoutMargins:UIEdgeInsetsZero];
        cell.frame = [self setFrame:cell.frame];
        return cell;
    }
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 2) {
        self.title = @"伙伴供应商";
        AGYViewController *addView = [AGYViewController new];
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
    if (tableView.tag == 1) {
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
            label.text = @"10位生意伙伴供应商";
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
        label.text = @"5位普通供应商";
        [view addSubview:label];
        view.backgroundColor = [UIColor clearColor];
        return view;
    }
    return nil;
}

#pragma mark-----------------UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag == 2) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"ling" object:nil];
        self.one = 0;
        return;
    }
    if (scrollView.tag == 3) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"ling4" object:nil];
        self.one = 0;
        return;
    }
    if (self.isRow != scrollView.tag-4) {
        return;
    }
    CGFloat xS = scrollView.contentOffset.x;
    
    if (xS <= 0) {
        xS = 0;
    }
    CGFloat x = WIDTH/2;
    if (self.scrollView.contentOffset.x == WIDTH)
    {
        if (xS > 165) {
            xS = 165;
        }
         x= x - xS+65;
        CGFloat y = 39.5;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:scrollView.tag-4 inSection:0];
        USTableViewCell *cell = [self.tableViewR cellForRowAtIndexPath:indexPath];
        cell.view1.center = CGPointMake(x, y);
    }
    else
    {
        if (xS > 65) {
            xS = 65;
        }
         x= x - xS+65;
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
    
    if(self.scrollView.contentOffset.x == 0) {
        
        if (xS >= 35) {
            [scrollView setContentOffset: CGPointMake(65, 0) animated:YES];
            self.offent = 65;
            self.one = 0;
        }
    }
    if (self.scrollView.contentOffset.x == WIDTH) {
        if (xS >= 115) {
            [scrollView setContentOffset: CGPointMake(165, 0) animated:YES];
            self.offent = 165;
        }
        if (xS <115 && xS >= 35) {
            [scrollView setContentOffset: CGPointMake(65, 0) animated:YES];
            self.offent = 65;
            self.one = 0;
            
        }
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
    [self.searchBtn resignFirstResponder];
    self.searchBtn.showsCancelButton = NO;
}
#pragma mark---------------按钮点击事件
- (void)btnCell:(Button *)btn
{
    
    if (btn.indexPath.section != 0) {
        DJViewController *djVC = [DJViewController new];
        self.title = @"伙伴供应商";
        djVC.titles = @"夏岛";
        [self.navigationController pushViewController:djVC animated:YES];
    }
    
}
- (void)btnCell1:(Button *)btn
{
    self.title = @"普通供应商";
    PTYSViewController *ptysVC = [PTYSViewController new];
    ptysVC.titles = @"爱等鸟";
    [self.navigationController pushViewController:ptysVC animated:YES];
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
    cusVC.titles = @"供应商信息";
    [self presentViewController:navc animated:YES completion:nil];
}

//UISegmentedControl的单击事件
- (void)btnClick:(UISegmentedControl *)segment
{
    [self cancelView];
    if (segment.selectedSegmentIndex == 0) {
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        self.navigationItem.rightBarButtonItem = nil;
        [[NSNotificationCenter defaultCenter]postNotificationName:@"ling4" object:nil];
        self.one = 0;
    }
    if (segment.selectedSegmentIndex == 1) {
        [self.scrollView setContentOffset:CGPointMake(WIDTH, 0) animated:YES];
        self.navigationItem.rightBarButtonItem = self.buttonItem;
        [[NSNotificationCenter defaultCenter]postNotificationName:@"ling" object:nil];
        self.one = 0;
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
