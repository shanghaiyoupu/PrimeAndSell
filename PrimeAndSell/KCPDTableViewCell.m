//
//  KCPDTableViewCell.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/26.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "KCPDTableViewCell.h"

@implementation KCPDTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    NSInteger width = 1/[UIScreen mainScreen].scale;
    CGRect rect = self.view1.frame;
    rect.size.width = width;
    self.view1.frame = rect;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
