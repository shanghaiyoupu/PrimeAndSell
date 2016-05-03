//
//  CGJHViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/27.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGJHViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UIView *backV,*backVH;
    BOOL isSelect;
}
@property (strong, nonatomic)NSMutableArray *dataName,*dataText,*dataSection2;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
