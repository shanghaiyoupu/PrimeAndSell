//
//  KCGLTableViewCell.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/25.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "KCGLTableViewCell.h"

@implementation KCGLTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 70)];
    self.scrollView.contentSize = CGSizeMake(WIDTH*4, 70);
    self.scrollView.contentOffset = CGPointMake(50, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.scrollView];
    self.button = [Button buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(50, 0, WIDTH, 70);
    [self.scrollView addSubview:self.button];
    self.cusBtn = [Button buttonWithType:UIButtonTypeCustom];
//        self.button.backgroundColor = [UIColor orangeColor];
    self.cusBtn.frame = CGRectMake(0, 0, 50, 70);
//        self.cusBtn.backgroundColor = [UIColor greenColor];
    [self.scrollView addSubview:self.cusBtn];
    self.sellBtn = [Button buttonWithType:UIButtonTypeCustom];
//        self.sellBtn.backgroundColor = [UIColor redColor];
    self.sellBtn.frame = CGRectMake(WIDTH+50, 0, 50, 70);
    [self.scrollView addSubview:self.sellBtn];
    self.panBtn = [Button buttonWithType:UIButtonTypeCustom];
//    self.panBtn.backgroundColor = [UIColor blueColor];
    self.panBtn.frame = CGRectMake(WIDTH+100, 0, 50, 70);
    [self.scrollView addSubview:self.panBtn];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(scrollViewCon) name:@"ling4" object:nil];
}
- (void)scrollViewCon
{
    self.scrollView.contentOffset = CGPointMake(50, 0);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
