//
//  KCGLTableViewCell.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/25.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Button.h"
@interface KCGLTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic)UIScrollView *scrollView;
@property (strong, nonatomic) Button *button;
@property (weak, nonatomic) IBOutlet UIView *view1;

@property (strong, nonatomic) Button *cusBtn;
@property (strong, nonatomic) Button *panBtn;
@property (strong, nonatomic) Button *sellBtn;
@end
