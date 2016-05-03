//
//  DJViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/27.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DJViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (copy,nonatomic)NSString *titles;
@property (strong, nonatomic)UITableView *tableViewL,*tableViewR;
@end
