//
//  GoodsViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/22.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface GoodsViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIView * view;
    UIButton *alertBtn,*choose;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *dataArray,*dataBtn,*dataImage;

@property (strong, nonatomic)UIView *viewBack,*viewWhite,*viewXian;
@property (assign, nonatomic)NSInteger number1,tag,cishu;
@property (strong, nonatomic)UILabel *zhu;
@property (strong,nonatomic)UIImageView *imageXJ,*imageXC;
@property (strong,nonatomic)UIButton *btnXJ,*btnXC;
@end
