//
//  KSJDViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/27.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSJDViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)NSMutableArray *dataName,*dataText,*dataSection2;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)queBtn:(id)sender;

@end
