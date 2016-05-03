//
//  SupperViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/18.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SupperViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchDisplayDelegate,UIScrollViewDelegate>
{
    UIView *backV,*backVH;
}
@property (weak, nonatomic) IBOutlet UISearchBar *searchBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic)UIBarButtonItem *buttonItem;
@property (strong,nonatomic)UISegmentedControl *segment;
@property (assign, nonatomic)NSInteger isRow,offent,one,tow;
@property (strong, nonatomic)NSMutableArray *dataArray;
@property (strong, nonatomic)UITableView *tableViewL,*tableViewR;
@end
