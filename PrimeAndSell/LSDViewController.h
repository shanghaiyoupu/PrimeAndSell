//
//  LSDViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/28.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSDViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UIView *backV,*backVH;
    BOOL isSelect;
}
@property (strong, nonatomic)NSMutableArray *dataName,*dataText,*dataSection2;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
