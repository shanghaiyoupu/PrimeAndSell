//
//  KCCXViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/26.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCCXViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *dataName,*dataText,*dataYear,*dataMouth,*dataDay;
@property (strong,nonatomic)UIView *pickBack;
@property (strong, nonatomic)NSIndexPath *indexPath;
@property (strong, nonatomic)UIPickerView *pickView;
@property (strong, nonatomic)NSDateComponents *dateCompont;
- (IBAction)clearBtn:(id)sender;


@end
