//
//  LSCXViewController.h
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/28.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSCXViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource>
@property (strong, nonatomic)NSMutableArray *dataName,*dataText,*dataYear,*dataMouth,*dataDay;
@property (strong,nonatomic)UIView *pickBack;
@property (strong, nonatomic)NSIndexPath *indexPath;
@property (strong, nonatomic)UIPickerView *pickView;
@property (strong, nonatomic)NSDateComponents *dateCompont;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)clearBtn:(id)sender;

@end
