//
//  KCMXViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/26.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCMXViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *dataName,*dataText;
@end
