//
//  GoodsViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/22.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define www (WIDTH-20-7*4-7*5)/7
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "GoodsViewController.h"
#import "SelectViewController.h"
#import "CusTableViewCell.h"
#import "Goods1TableViewCell.h"
#import "ImageView.h"
#import "Button.h"
@interface GoodsViewController ()

@end

@implementation GoodsViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"商品信息";
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self getChooseImage];
    self.dataBtn = [[NSMutableArray alloc]init];
    self.dataImage = [[NSMutableArray alloc]init];
    self.zhu = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    self.zhu.text = @"主";
    self.zhu.font = [UIFont systemFontOfSize:15];
    self.zhu.textColor = [UIColor blueColor];
    view =  [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 140)];
//    view.backgroundColor = [UIColor grayColor];
    alertBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    alertBtn.frame = CGRectMake(10, 100, WIDTH-20, 40);
    alertBtn.backgroundColor = [UIColor redColor];
    [alertBtn addTarget:self action:@selector(deleteBtn) forControlEvents:UIControlEventTouchUpInside];
    [alertBtn setTitle:@"删除商品" forState:UIControlStateNormal];
    [alertBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    choose = [UIButton buttonWithType:UIButtonTypeSystem];
    choose.frame = CGRectMake(10, 10, www, www);
    [choose addTarget:self action:@selector(addBtn) forControlEvents:UIControlEventTouchUpInside];
    [choose setBackgroundImage:[UIImage imageNamed:@"photo"] forState:UIControlStateNormal];
    [view addSubview:choose];
    alertBtn.layer.cornerRadius = 3;
    alertBtn.clipsToBounds = YES;
    [view addSubview:alertBtn];
    self.dataArray = [[NSMutableArray alloc]init];
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"spxxList.plist" ofType:nil];
    NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:filePath];
    for (int i =0; i < dic.count; i ++) {
        NSArray *array = [dic objectForKey:[NSString stringWithFormat:@"%d",i]];
        [self.dataArray addObject:array];
    }
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtn)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor orangeColor];
    UINib *nibCus = [UINib nibWithNibName:@"CusTableViewCell" bundle:nil];
    [self.tableView registerNib:nibCus forCellReuseIdentifier:@"CusTableViewCell"];
    UINib *nibGoods1 = [UINib nibWithNibName:@"Goods1TableViewCell" bundle:nil];
    [self.tableView registerNib:nibGoods1 forCellReuseIdentifier:@"Goods1TableViewCell"];
    UINib *nibGoods2 = [UINib nibWithNibName:@"Goods2TableViewCell" bundle:nil];
    [self.tableView registerNib:nibGoods2 forCellReuseIdentifier:@"Goods2TableViewCell"];
    self.tableView.separatorInset = UIEdgeInsetsZero;
}
#pragma mark-----------UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count-1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.dataArray[section];
    return array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = self.dataArray[indexPath.section];
        CusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CusTableViewCell" forIndexPath:indexPath];
        cell.view1.alpha = 0;
        cell.button.indexPath = indexPath;
        cell.button.alpha = 0;
        cell.button.enabled = NO;
        cell.view.alpha = 0;
        cell.textFiled.enabled = NO;
        cell.name.text = array[indexPath.row];
        cell.textFiled.textColor = [UIColor blackColor];
        cell.separatorInset = UIEdgeInsetsMake(0, 8, 0, 8);
        cell.accessoryType = UITableViewCellAccessoryNone;
        [cell.button addTarget:self action:@selector(btnSelect:) forControlEvents:UIControlEventTouchUpInside];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if ((indexPath.section == 0&&indexPath.row == 0)||(indexPath.section == 1)) {
            cell.view.alpha = 1;
            cell.textFiled.enabled = YES;
        }
        if ((indexPath.section == 0&&indexPath.row == 2)||(indexPath.section == 2)) {
            cell.button.alpha = 1;
            cell.view1.alpha = 1;
            cell.button.enabled = YES;
            
        }
        return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2) {
            return 140;
        
    }
    return 15;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        if (self.tag >= 5) {
            choose.alpha = 0;
            choose.enabled = NO;
        }
        else
        {
            choose.alpha = 1;
            choose.enabled = YES;
        }
        return view;
    }
    return nil;
}
#pragma mark--------UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    self.tag ++;
    self.number1 ++;
    Button *btn = [[Button alloc]initWithFrame:CGRectMake(10+(self.tag -1)*(www+5), 10, www, www)];
    if (self.cishu == 0) {
        [btn addSubview:self.zhu];
        self.cishu ++;
    }
    choose.frame = CGRectMake(btn.frame.origin.x+www+5, 10, www, www);
    [btn addTarget:self action:@selector(zhuBtn:) forControlEvents:UIControlEventTouchUpInside];
    btn.lie = self.tag;
    [btn setBackgroundImage:[info objectForKey:@"UIImagePickerControllerEditedImage"] forState:UIControlStateNormal];
    [view addSubview:btn];
    Button *button = [Button buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(btn.frame.size.width-20, 0, 20, 20);
    button.lie = self.tag;
    [button setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(imageBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn addSubview:button];
    btn.userInteractionEnabled = YES;
    [self.dataBtn addObject:button];
    [self.dataImage addObject:btn];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationNone];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)btnSelect:(Button *)btn
{
    
    SelectViewController *selectVC = [SelectViewController new];
    UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:selectVC];
    if (btn.indexPath.section == 0&&btn.indexPath.row ==2) {
        selectVC.titles = @"选择品牌";
        selectVC.titlsBtn = @"添加品牌";
    }
    if (btn.indexPath.section == 2&&btn.indexPath.row == 0 ) {
        selectVC.titles = @"选择分类";
        selectVC.titlsBtn = @"添加分类";
    }
    if (btn.indexPath.section == 2&&btn.indexPath.row == 1) {
        selectVC.titles = @"选择单位";
        selectVC.titlsBtn = @"添加单位";
    }
    CusTableViewCell *cell = [self.tableView cellForRowAtIndexPath:btn.indexPath];
   
    selectVC.content = cell.textFiled.text;
    selectVC.shuXing = ^(NSString *name){
        cell.textFiled.text = name;
    };
    [self presentViewController:navc animated:YES completion:nil];
}
- (void)addBtn
{
   
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    [window addSubview:self.viewBack];
    [UIView animateWithDuration:0.4 animations:^{
       
        self.viewWhite.frame = CGRectMake(35, HEIGHT - 90, WIDTH - 70, 70);
    }];
    
}
- (void)zhuBtn:(Button *)btn
{
    [self.zhu removeFromSuperview];
    [btn addSubview:self.zhu];
}
- (void)imageBtn:(Button *)btn
{
    Button *button = (Button *)[self.zhu superview];
    if (button.lie == btn.lie)
    {
        [self.zhu removeFromSuperview];
        if (self.dataImage.count >1) {
            Button *butt = nil;
            if (btn.lie == 1) {
                
                butt = [self.dataImage objectAtIndex:1];
            }
            else
            {
                butt = [self.dataImage objectAtIndex:0];
            }
            self.zhu = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
            self.zhu.text = @"主";
            self.zhu.font = [UIFont systemFontOfSize:15];
            self.zhu.textColor = [UIColor blueColor];
            [butt addSubview:self.zhu];
        }
    }
    _number1 --;
    Button *imageView = [self.dataImage objectAtIndex:btn.lie-1];
    Button *but = self.dataBtn[btn.lie -1];
    for (NSInteger i = btn.lie-1; i < self.dataImage.count-1; i ++) {
        ImageView *image = self.dataImage[i];
        ImageView *image1 = self.dataImage[i +1];
        CGRect rect = image.frame;
        image.frame = image1.frame;
        image1.frame = rect;
        NSInteger tagger = image.lie;
        image.lie = image1.lie;
        image1.lie = tagger;
        [self.dataImage exchangeObjectAtIndex:i withObjectAtIndex:i +1];
    }
    for (NSInteger i = btn.lie - 1; i <self.dataBtn.count-1; i ++) {
        Button *button = self.dataBtn[i];
        Button *button1 = self.dataBtn[i+1];
        NSInteger tagger = button1.lie;
        button1.lie = button.lie;
        button.lie = tagger;
        [self.dataBtn exchangeObjectAtIndex:i withObjectAtIndex:i+1];
    }
    choose.frame = imageView.frame;
    [imageView removeFromSuperview];
    [self.dataImage removeObject:imageView];
    [self.dataBtn removeObject:but];
    if (self.dataImage.count == 0) {
        self.cishu = 0;
    }
    self.tag --;
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationNone];
}
- (void)rightBtn
{
    NSIndexPath *indexPath0 = [NSIndexPath indexPathForRow:0 inSection:0];
    CusTableViewCell *cell0 = [self.tableView cellForRowAtIndexPath:indexPath0];
    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:1 inSection:0];
    CusTableViewCell *cell1 = [self.tableView cellForRowAtIndexPath:indexPath1];
    NSIndexPath *indexPath2 = [NSIndexPath indexPathForRow:2 inSection:0];
    CusTableViewCell *cell2 = [self.tableView cellForRowAtIndexPath:indexPath2];
    NSIndexPath *indexPath3 = [NSIndexPath indexPathForRow:0 inSection:1];
    CusTableViewCell *cell3 = [self.tableView cellForRowAtIndexPath:indexPath3];
    NSIndexPath *indexPath4 = [NSIndexPath indexPathForRow:1 inSection:1];
    CusTableViewCell *cell4 = [self.tableView cellForRowAtIndexPath:indexPath4];
    NSIndexPath *indexPath5 = [NSIndexPath indexPathForRow:2 inSection:1];
    CusTableViewCell *cell5 = [self.tableView cellForRowAtIndexPath:indexPath5];
    NSIndexPath *indexPath6 = [NSIndexPath indexPathForRow:0 inSection:2];
    CusTableViewCell *cell6 = [self.tableView cellForRowAtIndexPath:indexPath6];
    NSIndexPath *indexPath7 = [NSIndexPath indexPathForRow:1 inSection:2];
    CusTableViewCell *cell7 = [self.tableView cellForRowAtIndexPath:indexPath7];
    NSLog(@"%@==%@==%@==%@==%@==%@==%@==%@==",cell0.textFiled.text,cell1.textFiled.text,cell2.textFiled.text,cell3.textFiled.text,cell4.textFiled.text,cell5.textFiled.text,cell6.textFiled.text,cell7.textFiled.text);
}
- (void)getChooseImage
{
    self.viewBack = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
    [self.viewBack addGestureRecognizer:tapGesture];
   
    UIView *viewGray = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    viewGray.backgroundColor = [UIColor grayColor];
    viewGray.alpha = 0.4;
    [self.viewBack addSubview:viewGray];
    self.viewWhite = [[UIView alloc]initWithFrame:CGRectMake(35, HEIGHT, WIDTH - 70, 70)];
    self.viewWhite.clipsToBounds = YES;
    self.viewWhite.layer.cornerRadius = 3;
    self.viewWhite.backgroundColor = [UIColor whiteColor];
    [self.viewBack addSubview:self.viewWhite];
    self.viewXian = [[UIView alloc]initWithFrame:CGRectMake(0, 34, self.viewWhite.frame.size.width, 1)];
    self.viewXian.backgroundColor = [UIColor grayColor];
    [self.viewWhite addSubview:self.viewXian];
    self.imageXJ = [[UIImageView alloc]initWithFrame:CGRectMake(5, 2, 28, 28)];
    self.imageXJ.image = [UIImage imageNamed:@"photo"];
    [self.viewWhite addSubview:self.imageXJ];
    self.imageXC = [[UIImageView alloc]initWithFrame:CGRectMake(5, 70-2-28, 28, 28)];
    self.imageXC.image = [UIImage imageNamed:@"photo13"];
    [self.viewWhite addSubview:self.imageXC];
    self.btnXJ = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btnXJ.frame = CGRectMake(self.imageXJ.frame.size.width+2+10, 2, self.viewWhite.frame.size.width - (self.imageXJ.frame.size.width+2+10), 28);
    [self.btnXJ setTintColor:[UIColor blueColor]];
    self.btnXJ.tag = 1;
    [self.btnXJ setTitle:@"拍照" forState:UIControlStateNormal];
    [self.btnXJ addTarget:self action:@selector(btnXJXC:) forControlEvents:UIControlEventTouchUpInside];
    [self.viewWhite addSubview:self.btnXJ];
    self.btnXC = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btnXC.frame = CGRectMake(self.imageXJ.frame.size.width+2+10, 70-2-28, self.viewWhite.frame.size.width - (self.imageXC.frame.size.width+2+10), 28);
    [self.btnXC setTintColor:[UIColor blueColor]];
    self.btnXC.tag = 2;
    [self.btnXC setTitle:@"从相册中选择" forState:UIControlStateNormal];
    [self.btnXC addTarget:self action:@selector(btnXJXC:) forControlEvents:UIControlEventTouchUpInside];
    [self.viewWhite addSubview:self.btnXC];
}
- (void)tapGesture:(UITapGestureRecognizer *)tapGesture
{
    
    [UIView animateWithDuration:0.4 animations:^{
        self.viewWhite.frame = CGRectMake(35, HEIGHT , WIDTH - 70, 70);
    } completion:^(BOOL finished) {
        [self.viewBack removeFromSuperview];
    }];
}
//选择图片
- (void)btnXJXC:(UIButton *)btn
{
    [UIView animateWithDuration:0.4 animations:^{
        self.viewWhite.frame = CGRectMake(35, HEIGHT , WIDTH - 70, 70);
    } completion:^(BOOL finished) {
        [self.viewBack removeFromSuperview];
        if (btn.tag == 1) {
            NSLog(@"相机");
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
                imagePicker.delegate = self;
                imagePicker.allowsEditing = YES;
                imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self presentViewController:imagePicker animated:YES completion:nil];
            }
            else
            {
                NSLog(@"相机不可用");
            }
            
        }
        if (btn.tag == 2) {
            NSLog(@"从相册中选择");
            [self tapGesture:nil];
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
            imagePicker.delegate = self;
            imagePicker.allowsEditing = YES;
            if ([UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary]) {
                imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            }
            else
            {
                NSLog(@"不可用");
            }
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
    }];
    
}
- (void)deleteBtn
{
    NSLog(@"删除商品");
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
