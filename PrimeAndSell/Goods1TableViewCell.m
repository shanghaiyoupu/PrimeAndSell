//
//  Goods1TableViewCell.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/22.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "Goods1TableViewCell.h"

@implementation Goods1TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.label.transform = CGAffineTransformMakeRotation((0-M_PI/4)+(M_PI/180*15));
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
