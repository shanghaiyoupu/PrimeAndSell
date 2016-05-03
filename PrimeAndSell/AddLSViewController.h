//
//  AddLSViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/28.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddLSViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic)NSMutableArray *dataArray,*dataArray0,*dataArray1,*dataArray2,*dataArray3;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)jieZhang:(id)sender;

@end
