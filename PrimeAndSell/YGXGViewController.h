//
//  YGXGViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/25.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGXGViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableVIew;
@property (copy, nonatomic)NSString *titles;
@end
