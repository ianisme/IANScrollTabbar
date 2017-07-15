//
//  DisplayViewController.h
//  DisplayDemo
//
//  Created by ian on 16/9/22.
//  Copyright © 2016年 ian. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppMacros.h"

typedef void(^ScrollViewDidEndBlock)(NSUInteger);

@interface DisplayViewController : UIViewController

@property (nonatomic, copy) ScrollViewDidEndBlock scrollViewDidEndBlock;

@property (nonatomic, strong) NSMutableArray *contentControllers;

- (void)createTabbarTitles:(NSArray *)titles images:(NSArray *)images selectedImages:(NSArray *)selectedImages;

- (void)tabBarClick:(NSUInteger)index;

- (UINavigationController *)creatNavController:(UIViewController *)vc;

@end
