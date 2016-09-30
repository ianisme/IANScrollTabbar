//
//  MainDisplayViewController.m
//  DisplayDemo
//
//  Created by ian on 16/9/22.
//  Copyright © 2016年 ian. All rights reserved.
//

#import "MainDisplayViewController.h"
#import "FullChildViewController.h"
#import "AppMacros.h"

@interface MainDisplayViewController ()

@end

@implementation MainDisplayViewController


#pragma mark - life style

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.view.frame = CGRectMake(0, 0, DisplayScreenW, DisplayScreenH - 49);
    self.scrollViewDidEndBlock = ^(NSUInteger index){
        
    };
    [self configAllViewController];
    [self createTabbar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)configAllViewController
{
    FullChildViewController *vc1 = [[FullChildViewController alloc] init];
    vc1.title = @"测试1";
    vc1.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:vc1];
    
    FullChildViewController *vc2 = [[FullChildViewController alloc] init];
    vc2.title = @"测试1";
    vc2.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:vc2];
    
    FullChildViewController *vc3 = [[FullChildViewController alloc] init];
    vc3.title = @"测试1";
    vc3.view.backgroundColor = [UIColor blackColor];
    [self addChildViewController:vc3];
    
    FullChildViewController *vc4 = [[FullChildViewController alloc] init];
    vc4.title = @"测试1";
    vc4.view.backgroundColor = [UIColor greenColor];
    [self addChildViewController:vc4];
    
    FullChildViewController *vc5 = [[FullChildViewController alloc] init];
    vc5.title = @"测试1";
    vc5.view.backgroundColor = [UIColor purpleColor];
    [self addChildViewController:vc5];
}

- (void)createTabbar
{
    NSMutableArray *background = [@[]mutableCopy];
    NSMutableArray *SelectedBackground = [@[]mutableCopy];
    NSMutableArray *tabbarLabelName = [@[]mutableCopy];
    
    background = [@[@"home_banjia", @"home_duanzu", @"home_hezu", @"home_zhengzu", @"home_ziruyu"]mutableCopy];
    SelectedBackground = [@[@"home_banjia_hight", @"home_duanzu_hight", @"home_hezu_hight", @"home_zhengzu_hight", @"home_ziruyu_hight"]mutableCopy];
    tabbarLabelName = [@[@"推荐",@"分类",@"收藏",@"本地",@"设置"]mutableCopy];
    
    [self createTabbarTitles:tabbarLabelName images:background selectedImages:SelectedBackground];
}


@end
