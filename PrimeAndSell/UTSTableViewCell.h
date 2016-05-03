//
//  UTSTableViewCell.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/21.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UTSTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (copy, nonatomic)NSString *name1;
@end
