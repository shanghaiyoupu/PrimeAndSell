//
//  JZViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/22.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (copy, nonatomic)NSString *titles,*filePath;
@property (strong, nonatomic)NSMutableArray *dataArray;
@end
