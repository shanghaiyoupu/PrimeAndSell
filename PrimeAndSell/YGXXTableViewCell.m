//
//  YGXXTableViewCell.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/25.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "YGXXTableViewCell.h"

@implementation YGXXTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.number.alpha = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
