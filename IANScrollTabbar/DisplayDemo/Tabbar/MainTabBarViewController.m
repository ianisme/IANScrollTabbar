//
//  MainTabBarViewController.m
//  DisplayDemo
//
//  Created by ian on 16/9/21.
//  Copyright © 2016年 ian. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "TabbarItemModel.h"
#import "CustomTabBar.h"
#import "AppMacros.h"

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController


#pragma mark - life style

- (void)viewDidLoad {
    [super viewDidLoad];
     self.tabBar.hidden = YES;
   // [self createView];
    [self createTabbar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - private method

- (void)createView
{
    UIViewController *vc1 = [[UIViewController alloc] init];
    UIViewController *vc2 = [[UIViewController alloc] init];
    UIViewController *vc3 = [[UIViewController alloc] init];
    UIViewController *vc4 = [[UIViewController alloc] init];
    UIViewController *vc5 = [[UIViewController alloc] init];
    
    NSMutableArray *views =[@[vc1, vc2, vc3, vc4, vc5] mutableCopy];
    
    NSMutableArray *viewControllers1 = [NSMutableArray arrayWithCapacity:5];
    for (UIViewController *viewController in views)
    {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
        [viewControllers1 addObject:nav];
    }
    self.viewControllers = viewControllers1;
}

- (void)createTabbar
{
    NSMutableArray *background = [@[]mutableCopy];
    NSMutableArray *SelectedBackground = [@[]mutableCopy];
    NSMutableArray *tabbarLabelName = [@[]mutableCopy];

    background = [@[@"home_banjia", @"home_duanzu", @"home_hezu", @"home_zhengzu", @"home_ziruyu"]mutableCopy];
    SelectedBackground = [@[@"home_banjia_hight", @"home_duanzu_hight", @"home_hezu_hight", @"home_zhengzu_hight", @"home_ziruyu_hight"]mutableCopy];
    tabbarLabelName = [@[@"推荐",@"分类",@"收藏",@"本地",@"设置"]mutableCopy];

    
    NSMutableArray *items = [@[] mutableCopy];
    for(NSUInteger i = 0; i < background.count; i ++) {
        TabbarItemModel *item = [[TabbarItemModel alloc] init];
        item.title = tabbarLabelName[i];
        item.titleColor = UIColorFromRGB(0x0000f8);
        item.selectedTitleColor = UIColorFromRGB(0x000000);
        item.image = [UIImage imageNamed:background[i]];
        item.selectedImage = [UIImage imageNamed:SelectedBackground[i]];
        [items addObject:item];
    }
    CustomTabBar *tabBar = [[CustomTabBar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 49, self.view.bounds.size.width, 49) items:items];
    [self.view addSubview:tabBar];
    
    tabBar.tabBarActionBlock = ^(NSUInteger index){
        NSLog(@"%ld",index);
    };
}
@end
