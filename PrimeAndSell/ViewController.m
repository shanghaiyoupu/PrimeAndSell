//
//  ViewController.m
//  PrimeAndSell
//
//  Created by 上海柚铺 on 16/4/18.
//  Copyright © 2016年 上海柚铺. All rights reserved.
//

#import "ViewController.h"
#import "UsersViewController.h"
#import "HomeViewController.h"
#import "SupperViewController.h"
#import "UserViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self getTabbar];
}
- (void)getTabbar
{
    UsersViewController *usersVC = [UsersViewController new];
    usersVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"客户" image:[UIImage imageNamed:@"users"] tag:1];
    UINavigationController *usersNAVC = [[UINavigationController alloc]initWithRootViewController:usersVC];
    
    HomeViewController *homeVC = [HomeViewController new];
    homeVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"库存" image:[UIImage imageNamed:@"home"] tag:2];
    UINavigationController *homeNAVC = [[UINavigationController alloc]initWithRootViewController:homeVC];
    
    SupperViewController *supperVC = [SupperViewController new];
    supperVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"供应商" image:[UIImage imageNamed:@"track"] tag:3];
    UINavigationController *supperNAVC = [[UINavigationController alloc]initWithRootViewController:supperVC];
    
    UserViewController *userVC = [UserViewController new];
    userVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我" image:[UIImage imageNamed:@"user"] tag:4];
    UINavigationController *userNAVC = [[UINavigationController alloc]initWithRootViewController:userVC];
    
    UITabBarController *tabbar = [UITabBarController new];
    tabbar.viewControllers = @[usersNAVC,homeNAVC,supperNAVC,userNAVC];
    tabbar.tabBar.tintColor = [UIColor orangeColor];
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    window.rootViewController = tabbar;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
