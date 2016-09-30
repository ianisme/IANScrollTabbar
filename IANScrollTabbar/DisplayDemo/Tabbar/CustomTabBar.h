//
//  CustomTabBar.h
//  DisplayDemo
//
//  Created by ian on 16/9/21.
//  Copyright © 2016年 ian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarItem.h"

typedef void(^TabBarActionBlock)(NSUInteger);

@interface CustomTabBar : UIView

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, copy) TabBarActionBlock tabBarActionBlock;

- (instancetype)initWithFrame:(CGRect)frame items:(NSArray *)items;

- (void)refreshTabBarButton:(NSUInteger)index;

@end
