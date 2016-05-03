//
//  UFTableViewCell.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/18.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "UFTableViewCell.h"

@implementation UFTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.number.layer.cornerRadius = 9;
    self.number.clipsToBounds = YES;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
