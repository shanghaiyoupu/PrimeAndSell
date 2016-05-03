//
//  UTFTableViewCell.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/19.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Button.h"
@interface UTFTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic)UIScrollView *scrollView;
@property (strong, nonatomic) Button *button;

@property (strong, nonatomic) Button *cusBtn;
@property (strong, nonatomic) Button *retBtn;
@property (strong, nonatomic) Button *sellBtn;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *redTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageBtn;
@property (weak, nonatomic) IBOutlet UILabel *titles;
@property (weak, nonatomic) IBOutlet UILabel *money;


@end
