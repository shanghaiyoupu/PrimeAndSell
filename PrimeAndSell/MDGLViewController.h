//
//  MDGLViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/26.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDGLViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableViewL;
@property (weak, nonatomic) IBOutlet UITableView *tableViewR;
@property (copy, nonatomic)NSString *titles;
@property (assign, nonatomic)NSInteger isSelect;
@end
