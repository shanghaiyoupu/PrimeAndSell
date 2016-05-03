//
//  AddSTableViewCell.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/21.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "AddSTableViewCell.h"

@implementation AddSTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.acceptBtn.layer.cornerRadius = 2;
    self.acceptBtn.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
