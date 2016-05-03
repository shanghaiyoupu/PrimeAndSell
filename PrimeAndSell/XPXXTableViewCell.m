//
//  XPXXTableViewCell.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/22.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "XPXXTableViewCell.h"

@implementation XPXXTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.redTitle.clipsToBounds = YES;
    self.redTitle.layer.cornerRadius = 2;
    self.redTitle.layer.borderColor = [UIColor redColor].CGColor;
    self.redTitle.layer.borderWidth = 1;
    self.redTitle.transform = CGAffineTransformMakeRotation(0-M_PI/5);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
