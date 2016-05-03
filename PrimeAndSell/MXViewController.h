//
//  MXViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/18.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MXViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UIView *backV,*backVH;
    BOOL isSelect;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (copy, nonatomic)NSString *titles;
@property (strong, nonatomic)NSMutableArray *dataName;
@end
