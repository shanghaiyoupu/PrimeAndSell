//
//  MSTableViewCell.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/18.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "MSTableViewCell.h"

@implementation MSTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.cancel.clipsToBounds = YES;
    self.cancel.layer.cornerRadius = 2;
    self.cancel.layer.borderColor = [UIColor redColor].CGColor;
    self.cancel.layer.borderWidth = 1;
    self.cancel.transform = CGAffineTransformMakeRotation(0-M_PI/5);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
