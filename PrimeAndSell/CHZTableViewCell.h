//
//  CHZTableViewCell.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/20.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHZTableViewCell : UITableViewCell
@property (strong, nonatomic) UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *titles;

@end
