//
//  CHViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/20.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    CGPoint startPoint,originPoint;
    BOOL contain;
}
@property (weak, nonatomic) IBOutlet UISearchBar *search;
@property (weak, nonatomic) IBOutlet UITableView *tableViewL;
@property (weak, nonatomic) IBOutlet UITableView *tableViewR;
@property (assign, nonatomic)NSInteger isSelect;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *money;
@property (weak, nonatomic) IBOutlet UIImageView *cart;
@property (weak, nonatomic) IBOutlet UIView *viewM;
@property (weak, nonatomic) IBOutlet UIView *viewX;
@property (strong, nonatomic)NSMutableArray *dataBtn;
- (IBAction)ok:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *ok;

@end
