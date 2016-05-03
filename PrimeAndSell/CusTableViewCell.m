//
//  CusTableViewCell.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/19.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "CusTableViewCell.h"

@implementation CusTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    CGFloat width = 1/[UIScreen mainScreen].scale;
    CGRect rect = self.view.frame;
    rect.size.width = width;
    self.view.frame = rect;
    self.view1.transform = CGAffineTransformMakeRotation((0-M_PI/4)+(M_PI/180*15));
    self.view1.alpha = 0;
    self.button.alpha = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
