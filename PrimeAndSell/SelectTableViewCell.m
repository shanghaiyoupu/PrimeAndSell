//
//  SelectTableViewCell.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/23.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "SelectTableViewCell.h"

@implementation SelectTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH,50)];
    self.scrollView.contentSize = CGSizeMake(WIDTH*4, 50);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.scrollView];
    self.deleBtn = [Button buttonWithType:UIButtonTypeCustom];
    self.deleBtn.frame = CGRectMake(WIDTH +40, 0, 40, 50);
//    self.deleBtn.backgroundColor = [UIColor greenColor];
    [self.scrollView addSubview:self.deleBtn];
    self.editBtn = [Button buttonWithType:UIButtonTypeCustom];
    self.editBtn.frame = CGRectMake(WIDTH, 0, 40, 50);
//    self.editBtn.backgroundColor = [UIColor blackColor];
    [self.scrollView addSubview:self.editBtn];
    self.selectBtn = [Button buttonWithType:UIButtonTypeCustom];
    self.selectBtn.frame = CGRectMake(0, 0, WIDTH, 50);
    [self.scrollView addSubview:self.selectBtn];

   
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(scrollViewCon) name:@"ling1" object:nil];
    self.duiBtn.alpha = 0;
}
- (void)scrollViewCon
{
    self.scrollView.contentOffset = CGPointMake(0, 0);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
