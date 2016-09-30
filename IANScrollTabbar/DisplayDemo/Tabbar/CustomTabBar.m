//
//  CustomTabBar.m
//  DisplayDemo
//
//  Created by ian on 16/9/21.
//  Copyright © 2016年 ian. All rights reserved.
//

#import "CustomTabBar.h"

#define TabBarItem_TAG 1111

@implementation CustomTabBar
{
    UIImageView *_backImageView;
}


#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame items:(NSArray *)items
{
    self = [super initWithFrame:frame];
    if (self) {
        _items = items;
        [self creatView];
    }
    return self;
}


#pragma mark - interface method

- (void)refreshTabBarButton:(NSUInteger)index
{
    for (UIView *subView in _backImageView.subviews) {
        if ([subView isKindOfClass:[TabBarItem class]]) {
            TabBarItem *tabBarItem = (TabBarItem *)subView;
            if (tabBarItem.tag - TabBarItem_TAG == index) {
                tabBarItem.tabbarButton.selected = YES;
            }else{
                tabBarItem.tabbarButton.selected = NO;
            }
        }
    }
    
}


#pragma mark - private method

- (void)creatView
{
    self.backgroundColor = [UIColor whiteColor];
    // 这里是tabbar的背景图片
    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    backImageView.userInteractionEnabled = YES;
    [self addSubview:backImageView];
    _backImageView = backImageView;
    
    for (NSUInteger i = 0; i < _items.count; i ++) {
        TabBarItem *tabBarItem = [[TabBarItem alloc] initWithFrame:CGRectMake(i*(self.bounds.size.width/_items.count), 0, self.bounds.size.width/_items.count, self.bounds.size.height) ItemModel:_items[i] tag:TabBarItem_TAG + i];
        [backImageView addSubview:tabBarItem];
        
        __weak typeof(self) weakSelf = self;
        tabBarItem.tabBarActon = ^(id sender){
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if (strongSelf.tabBarActionBlock) {
                strongSelf.tabBarActionBlock(((UIButton *)sender).tag - TabBarItem_TAG);
            }
            
            [strongSelf refreshTabBarButton:((UIButton *)sender).tag - TabBarItem_TAG];
            
        };
    }
}


@end
