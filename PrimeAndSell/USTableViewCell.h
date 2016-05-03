//
//  USTableViewCell.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/18.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Button.h"
@interface USTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *money;
@property (weak, nonatomic) IBOutlet UILabel *titles;
@property (strong, nonatomic)UIScrollView *scrollView;
@property (strong, nonatomic) Button *button;

@property (strong, nonatomic) Button *cusBtn;
@property (strong, nonatomic) Button *retBtn;
@property (strong, nonatomic) Button *sellBtn;
@property (weak, nonatomic) IBOutlet UIButton *tuiBtn;
@property (weak, nonatomic) IBOutlet UIButton *chuBtn;
@property (weak, nonatomic) IBOutlet UIButton *gongBtn;
@end
