//
//  UTSTableViewCell.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/21.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "UTSTableViewCell.h"

@implementation UTSTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.number.layer.cornerRadius = 8;
    self.number.clipsToBounds = YES;
}
- (void)setName1:(NSString *)name1
{
    _name.text = name1;
    NSLog(@"%@",name1);
    if ([name1 isEqualToString:@"设置"]) {
        self.imageV.image = [UIImage imageNamed:@"set"];
        self.number.alpha = 0;
    }
    else
    {
        self.imageV.image = [UIImage imageNamed:@"liebiao"];
        self.number.alpha = 1;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
