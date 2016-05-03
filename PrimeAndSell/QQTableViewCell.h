//
//  QQTableViewCell.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/21.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Button.h"
@interface QQTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet Button *button;

@end
