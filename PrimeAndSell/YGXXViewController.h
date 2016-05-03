//
//  YGXXViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/25.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGXXViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    BOOL isSelect[7];
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *dataName,*dataText;

@end
