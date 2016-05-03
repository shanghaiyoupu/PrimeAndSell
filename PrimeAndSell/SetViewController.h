//
//  SetViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/21.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableVIew;
@property (strong, nonatomic)NSMutableArray *dataImage,*dataTitle;

@end
