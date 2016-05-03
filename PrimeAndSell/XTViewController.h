//
//  XTViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/21.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Button.h"
@interface XTViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (copy, nonatomic)NSString *titles,*filePath;
@property (strong, nonatomic)NSMutableArray *dataArray;
@property (strong, nonatomic)NSMutableArray *dataSelect;
@property (assign, nonatomic)NSInteger number,row;
@end
