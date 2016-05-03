//
//  USTableViewCell.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/18.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "USTableViewCell.h"

@implementation USTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 79)];
    self.scrollView.contentSize = CGSizeMake(WIDTH*4, 79);
    self.scrollView.contentOffset = CGPointMake(65, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.scrollView];
    self.button = [Button buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(65, 0, WIDTH, 79);
    [self.scrollView addSubview:self.button];
    self.cusBtn = [Button buttonWithType:UIButtonTypeCustom];
    //    self.button.backgroundColor = [UIColor orangeColor];
    self.cusBtn.frame = CGRectMake(0, 0, 65, 79);
    //    self.cusBtn.backgroundColor = [UIColor greenColor];
    [self.scrollView addSubview:self.cusBtn];
    self.sellBtn = [Button buttonWithType:UIButtonTypeCustom];
    //    self.sellBtn.backgroundColor = [UIColor redColor];
    self.sellBtn.frame = CGRectMake(WIDTH-100+165, 0, 50, 79);
    [self.scrollView addSubview:self.sellBtn];
    self.retBtn = [Button buttonWithType:UIButtonTypeCustom];
    //    self.retBtn.backgroundColor = [UIColor blueColor];
    self.retBtn.frame = CGRectMake(WIDTH-50+165, 0, 50, 79);
    [self.scrollView addSubview:self.retBtn];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(scrollViewCon) name:@"ling4" object:nil];
}
- (void)scrollViewCon
{
    self.scrollView.contentOffset = CGPointMake(65, 0);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
