//
//  MFTableViewCell.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/18.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *yMoney;
@property (weak, nonatomic) IBOutlet UILabel *sMoney;
@property (weak, nonatomic) IBOutlet UILabel *kMoney;

@end
