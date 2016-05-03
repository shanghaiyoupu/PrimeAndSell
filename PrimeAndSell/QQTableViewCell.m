//
//  QQTableViewCell.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/21.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "QQTableViewCell.h"

@implementation QQTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.button setBackgroundImage:[UIImage imageNamed:@"add"] forState:UIControlStateSelected];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
