//
//  YGXGTableViewCell.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/25.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGXGTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *viewZ;
@property (weak, nonatomic) IBOutlet UIView *viewR;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *dress;
@property (weak, nonatomic) IBOutlet UILabel *isUse;
@property (weak, nonatomic) IBOutlet UILabel *lastName;
@property (weak, nonatomic) IBOutlet UILabel *firstName;

@end
