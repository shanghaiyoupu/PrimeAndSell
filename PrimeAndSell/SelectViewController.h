//
//  SelectViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/23.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^Block)(NSString *name);
@interface SelectViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (copy, nonatomic)NSString *titles,*content,*titlsBtn;
@property (assign, nonatomic)NSInteger isRow,offent,one,tow;
@property (strong, nonatomic)NSIndexPath *indexPath;
@property (strong, nonatomic)NSMutableArray *dataArray;
@property (copy, nonatomic)Block shuXing;
@end
