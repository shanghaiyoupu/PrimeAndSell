//
//  XSCHViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/26.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XSCHViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UIView *backV,*backVH;
    BOOL isSelect;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *dataName,*dataText,*dataSection2;
@property (assign,nonatomic)BOOL isQueXiao;
- (IBAction)queBtn:(id)sender;

@end
