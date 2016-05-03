//
//  CGTHViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/27.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "CGTHViewController.h"
#import "KCDDTableViewCell.h"
#import "KCDSTableViewCell.h"
#import "PassTableViewCell.h"
#import "SFTableViewCell.h"
#import "LDTableViewCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
@interface CGTHViewController ()

@end

@implementation CGTHViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.title  =@"采购退货明细";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"font"] style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setAddView];
    self.dataName = [[NSMutableArray alloc]initWithObjects:@"供应商",@"单号",@"制单人",@"退货仓库",@"业务日期", nil];
    self.dataText = [[NSMutableArray alloc]initWithObjects:@"DB123456789098765",@"小赵",@"总店门店",@"6楼仓库",@"2015-12-23 07:45", nil];
    self.dataSection2 = [[NSMutableArray alloc]initWithObjects:@"本次实付金额",@"本次应付款金额",@"累计欠供应商款", nil];
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
}
#pragma mark---------UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView

{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 5;
    }
    if (section == 1) {
        return 4;
    }
    if (section == 2) {
        return 3;
    }
    if (section == 3) {
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
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            LDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LDTableViewCell" forIndexPath:indexPath];
            [cell setLayoutMargins:UIEdgeInsetsZero];
            cell.name.text = @"采购进货明细";
            cell.jiSuan.text = @"总数:40 本次应收金额:-13200元";
            cell.jiSuan.font = [UIFont systemFontOfSize:13];
            return cell;
        }
        
        else if (indexPath.row == 1) {
            KCDDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KCDDTableViewCell" forIndexPath:indexPath];
            cell.huo.text = @"货号";
            cell.pin.text = @"品名";
            cell.numberQ.text = @"数量";
            cell.numberQ.font = [UIFont systemFontOfSize:19];
            cell.numberH.text = @"单价";
            cell.numberH.font = [UIFont systemFontOfSize:19];
            cell.number.text = @"金额";
            cell.number.font = [UIFont systemFontOfSize:19];
            [cell setLayoutMargins:UIEdgeInsetsZero];
            return cell;
        }
        else
        {
            KCDSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KCDSTableViewCell" forIndexPath:indexPath];
            [cell setLayoutMargins:UIEdgeInsetsZero];
            cell.huo.text = @"1530";
            cell.pin.text = @"微红盛龙夹克";
            cell.numberQ.text = @"10";
            cell.numberH.text = @"300";
            cell.number.text = @"3000";
            return cell;
        }
    }
    if (indexPath.section == 2||indexPath.section == 3) {
        SFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SFTableViewCell" forIndexPath:indexPath];
        cell.money.alpha = 0;
        if (indexPath.section == 3) {
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1&&indexPath.row != 0) {
        if (indexPath.row == 1) {
            return [tableView fd_heightForCellWithIdentifier:@"KCDDTableViewCell" configuration:^(KCDDTableViewCell *cell) {
                
            }];
        }
        else
        {
            return [tableView fd_heightForCellWithIdentifier:@"KCDSTableViewCell" configuration:^(KCDSTableViewCell *cell) {
                cell.huo.text = @"1530";
                cell.pin.text = @"微红盛龙夹克";
                cell.numberQ.text = @"8";
                cell.numberH.text = @"0";
                cell.number.text = @"8";
            }];
        }
        
    }
    return 40;
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
    UIView *viewB = [[UIView alloc]initWithFrame:CGRectMake(WIDTH-134, 13, 130, 82)];
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
- (void)shareBtn:(UIButton *)btn
{
    NSLog(@"微信分享");
}
- (void)toothBtn:(UIButton *)btn
{
    NSLog(@"蓝牙");
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
