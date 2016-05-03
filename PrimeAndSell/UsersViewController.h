//
//  UsersViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/18.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsersViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchDisplayDelegate,UIScrollViewDelegate>
{
    UIView *backV,*backVH;
}
@property (strong, nonatomic)UIBarButtonItem *buttonItem;
@property (strong,nonatomic)UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (assign, nonatomic)NSInteger isRow,offent,one,one1,tow1,tow;
@property (strong, nonatomic)NSMutableArray *dataArray;
@property (strong, nonatomic)UITableView *tableViewL,*tableViewR;
@end
