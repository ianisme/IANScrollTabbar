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

    self.scrollViewDidEndBlock = ^(NSUInteger index){
        NSLog(@"滑动到第%ld个Controller",index);
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
    
    background = [@[@"tabbar_home", @"tabbar_inbox", @"tabbar_star", @"tabbar_download", @"tabbar_about"]mutableCopy];
    SelectedBackground = [@[@"tabbar_homeHighLight", @"tabbar_inboxHighLight", @"tabbar_StarHighLight", @"tabbar_downloadHighLight", @"tabbar_aboutHighLight"]mutableCopy];
    tabbarLabelName = [@[@"推荐",@"分类",@"收藏",@"本地",@"设置"]mutableCopy];
    
    [self createTabbarTitles:tabbarLabelName images:background selectedImages:SelectedBackground];
}


@end
