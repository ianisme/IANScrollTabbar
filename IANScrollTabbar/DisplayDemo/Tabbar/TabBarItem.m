//
//  TabBarItem.m
//  DisplayDemo
//
//  Created by ian on 16/9/21.
//  Copyright © 2016年 ian. All rights reserved.
//

#import "TabBarItem.h"

@implementation TabBarItem


#pragma mark - init

- (nonnull instancetype)initWithFrame:(CGRect)frame
                            ItemModel:(nullable TabbarItemModel *)tabbarItemModel
                                  tag:(NSUInteger)tag
{
    if (self = [super initWithFrame:frame]) {
        self.tag = tag;
        _tabBarItemModel = tabbarItemModel;
        [self creatView];
    }
    return self;
}


#pragma mark - private method

- (void)creatView
{
    TabbarButton *button = [TabbarButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:button];
    button.tag = self.tag;
    button.frame = CGRectMake(3, 3, self.bounds.size.width - 6, self.bounds.size.height - 6);
    
    button.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [button setTitleColor:_tabBarItemModel.titleColor forState:UIControlStateNormal];
    [button setTitleColor:_tabBarItemModel.selectedTitleColor forState:UIControlStateSelected];

    
    [button setTitle:_tabBarItemModel.title forState:UIControlStateNormal];
    [button setImage:_tabBarItemModel.image forState:UIControlStateNormal];
    [button setImage:_tabBarItemModel.selectedImage forState:UIControlStateSelected];
    
    [button addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    _tabbarButton = button;
}


#pragma action method

- (void)Click:(id)sender
{
    if (self.tabBarActon) {
        self.tabBarActon(sender);
    }
}

@end
