//
//  SelecMesViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/25.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^Block)(NSString *name);
@interface SelecMesViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (copy, nonatomic)NSString *titles,*content;
@property (copy, nonatomic)Block chuanZhi;
@end
