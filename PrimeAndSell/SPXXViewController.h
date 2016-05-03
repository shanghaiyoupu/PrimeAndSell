//
//  SPXXViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/22.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPXXViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    CGPoint startPoint,originPoint;
    BOOL contain;
}
@property (assign, nonatomic)NSInteger isSelect;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableViewS;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITableView *tableViewL;
@property (weak, nonatomic) IBOutlet UITableView *tableViewR;
@property (copy, nonatomic)NSString *titles;
@property (strong, nonatomic)NSMutableArray *dataBtn;
@end
