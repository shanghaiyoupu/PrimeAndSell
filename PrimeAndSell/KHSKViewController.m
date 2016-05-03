//
//  KHSKViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/26.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "KHSKViewController.h"
#import "PassTableViewCell.h"
#import "SFTableViewCell.h"
@interface KHSKViewController ()

@end

@implementation KHSKViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.title  =@"客户收款记账单";
    if (self.isQueXiao) {
        [self.viewQR removeFromSuperview];
        UIButton *cancel = [UIButton buttonWithType:UIButtonTypeSystem];
        [cancel setTintColor:[UIColor redColor]];
        [cancel setTitle:@"已撤消" forState:UIControlStateNormal];
        cancel.frame = CGRectMake(200, 100, 100, 50);
        cancel.clipsToBounds = YES;
        cancel.layer.cornerRadius = 2;
        cancel.layer.borderColor = [UIColor redColor].CGColor;
        cancel.layer.borderWidth = 1;
        cancel.transform = CGAffineTransformMakeRotation(0-M_PI/5);
        [self.tableView addSubview:cancel];
    }
    else
    {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"font"] style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
        
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataName = [[NSMutableArray alloc]initWithObjects:@"客户",@"单号",@"制单人",@"业务日期", nil];
    self.dataText = [[NSMutableArray alloc]initWithObjects:@"小赵",@"DB123456789098765",@"姚明",@"2015-12-23 07:45", nil];
    self.dataSection2 = [[NSMutableArray alloc]initWithObjects:@"本次实收金额",@"客户累计欠款", nil];
    [self setAddView];
    UINib *nibPass = [UINib nibWithNibName:@"PassTableViewCell" bundle:nil];
    [self.tableView registerNib:nibPass forCellReuseIdentifier:@"PassTableViewCell"];
    UINib *nibSFT = [UINib nibWithNibName:@"SFTableViewCell" bundle:nil];
    [self.tableView registerNib:nibSFT forCellReuseIdentifier:@"SFTableViewCell"];
    UINib *nibKCDD = [UINib nibWithNibName:@"KCDDTableViewCell" bundle:nil];
    [self.tableView registerNib:nibKCDD forCellReuseIdentifier:@"KCDDTableViewCell"];
    UINib *nibKCDS = [UINib nibWithNibName:@"KCDSTableViewCell" bundle:nil];
    [self.tableView registerNib:nibKCDS forCellReuseIdentifier:@"KCDSTableViewCell"];
    UINib *nibLD = [UINib nibWithNibName:@"LDTableViewCell" bundle:nil];
    [self.tableView registerNib:nibLD forCellReuseIdentifier:@"LDTableViewCell"];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.rowHeight = 40;
}
#pragma mark---------UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView

{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 4;
    }
    if (section == 1) {
        return 2;
    }
    if (section == 2) {
        return 1;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        PassTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PassTableViewCell" forIndexPath:indexPath];
        cell.name.text = self.dataName[indexPath.row];
        cell.textFiled.text = self.dataText[indexPath.row];
        cell.textFiled.clearButtonMode = UITextFieldViewModeNever;
        cell.textFiled.enabled  = NO;
        cell.textFiled.secureTextEntry = NO;
        cell.separatorInset = UIEdgeInsetsMake(0, 8, 0, 8);
        return cell;
    }
    if (indexPath.section == 1||indexPath.section == 2) {
        SFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SFTableViewCell" forIndexPath:indexPath];
        cell.money.alpha = 0;
        if (indexPath.section == 2) {
            cell.name.text = @" 备注";
        }
        else
        {
            cell.money.alpha = 1;
            cell.name.text = self.dataSection2[indexPath.row];
            cell.name.font = [UIFont systemFontOfSize:15];
            cell.money.text  = @"32000.00元";
            cell.money.font = [UIFont systemFontOfSize:15];
            cell.money.textColor = [UIColor blackColor];
            cell.separatorInset = UIEdgeInsetsMake(0, 8, 0, 8);
        }
        return cell;
    }
        return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15;
}
- (void)addBtn
{
    
}
- (void)setAddView
{
    backV = [[UIView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64)];
    backV.tag = 111111;
    //backV.backgroundColor = [UIColor redColor];
    backVH = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64)];
    backVH.backgroundColor = [UIColor grayColor];
    backVH.alpha = 0.3;
    [backV addSubview:backVH];
    UIView *backT = [[UIView alloc]initWithFrame:CGRectMake(WIDTH-35, 4, 22, 22)];
    backT.backgroundColor = [UIColor whiteColor];
    backT.transform = CGAffineTransformMakeRotation(M_PI/4);
    backT.layer.borderWidth = 0.5;
    backT.layer.borderColor = [UIColor grayColor].CGColor;
    [backV addSubview:backT];
    UIView *viewB = [[UIView alloc]initWithFrame:CGRectMake(WIDTH-134, 13, 130, 123)];
    viewB.backgroundColor = [UIColor whiteColor];
    [backV addSubview:viewB];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(0, 0, viewB.frame.size.width, 40);
    [button1 addTarget:self action:@selector(shareBtn:) forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitle:@"微信分享" forState:UIControlStateNormal];
    //button1.backgroundColor = [UIColor orangeColor];
    [viewB addSubview:button1];
    UIView *viewX = [[UIView alloc]initWithFrame:CGRectMake(0, 40, viewB.frame.size.width, 0.5)];
    viewX.backgroundColor = [UIColor grayColor];
    [viewB addSubview:viewX];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(0, button1.frame.size.height+1, viewB.frame.size.width, 40);
    [button2 addTarget:self action:@selector(toothBtn:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"蓝牙打印" forState:UIControlStateNormal];
    //button2.backgroundColor = [UIColor orangeColor];
    [viewB addSubview:button2];
    viewB.layer.borderColor = [UIColor grayColor].CGColor;
    viewB.layer.borderWidth = 0.5;
    viewB.layer.cornerRadius = 5;
    viewB.clipsToBounds = YES;
    UIView *viewY = [[UIView alloc]initWithFrame:CGRectMake(0, 80, viewB.frame.size.width, 0.5)];
    viewY.backgroundColor = [UIColor grayColor];
    [viewB addSubview:viewY];
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeSystem];
    button3.frame = CGRectMake(0, button2.frame.size.height+1+40, viewB.frame.size.width, 40);
    [button3 addTarget:self action:@selector(cancelBtn:) forControlEvents:UIControlEventTouchUpInside];
    [button3 setTitle:@"撤销" forState:UIControlStateNormal];
    //button1.backgroundColor = [UIColor orangeColor];
    [viewB addSubview:button3];
}
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
- (void)toothBtn:(UIButton *)btn
{
    NSLog(@"蓝牙打印");
}
- (void)shareBtn:(UIButton *)btn
{
    NSLog(@"微信分享");
}
- (void)cancelBtn:(UIButton *)btn
{
    NSLog(@"撤销");
}
- (IBAction)queBtn:(id)sender {
    NSLog(@"提醒客户确认");
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
