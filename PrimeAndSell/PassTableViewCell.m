//
//  PassTableViewCell.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/22.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "PassTableViewCell.h"

@implementation PassTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.textFiled.secureTextEntry = YES;
    self.textFiled.clearButtonMode = UITextFieldViewModeAlways;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
