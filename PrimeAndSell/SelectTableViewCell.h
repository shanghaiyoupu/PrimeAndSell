//
//  SelectTableViewCell.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/23.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Button.h"
@interface SelectTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *viewB;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet Button *duiBtn;

@property (strong, nonatomic) Button *deleBtn;
@property (strong, nonatomic) Button *editBtn;
@property (strong, nonatomic)  UIScrollView *scrollView;
@property (strong, nonatomic) Button *selectBtn;

@end
