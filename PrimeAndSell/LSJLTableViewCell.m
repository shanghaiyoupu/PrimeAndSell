//
//  LSJLTableViewCell.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/28.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "LSJLTableViewCell.h"

@implementation LSJLTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.cheXiao.clipsToBounds = YES;
    self.cheXiao.layer.cornerRadius = 3;
    self.cheXiao.layer.borderColor = [UIColor redColor].CGColor;
    self.cheXiao.layer.borderWidth = 2;
    self.cheXiao.transform = CGAffineTransformMakeRotation(0-M_PI/5);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
