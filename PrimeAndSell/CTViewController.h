//
//  CTViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/19.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *btnSell;
@property (weak, nonatomic) IBOutlet UIButton *btnCao;
@property (copy, nonatomic)NSString *titles,*filePath;
- (IBAction)btnCao:(id)sender;
- (IBAction)btnSell:(id)sender;
@property (strong, nonatomic)NSMutableArray *dataArray,*dataArray0,*dataArray1,*dataArray2,*dataArray3;
@end
