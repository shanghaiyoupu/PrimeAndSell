//
//  CHZTableViewCell.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/20.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "CHZTableViewCell.h"

@implementation CHZTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.number = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 18, 21)];
    self.number.backgroundColor = [UIColor redColor];
    self.number.textColor = [UIColor whiteColor];
    self.number.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.number];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
