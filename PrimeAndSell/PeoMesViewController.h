//
//  PeoMesViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/22.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeoMesViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *dataArray;
@property (copy, nonatomic)NSString *titles;
@end
