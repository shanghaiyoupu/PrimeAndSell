//
//  XIAViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/22.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XIAViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)clearBtn:(id)sender;

@end
