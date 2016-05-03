//
//  YGXXTableViewCell.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/25.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Button.h"
@interface YGXXTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageL;
@property (weak, nonatomic) IBOutlet Button *imageR;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *number;

@end
