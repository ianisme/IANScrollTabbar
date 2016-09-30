//
//  TabBarItem.h
//  DisplayDemo
//
//  Created by ian on 16/9/21.
//  Copyright © 2016年 ian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TabbarButton.h"
#import "TabbarItemModel.h"

typedef void(^TabBarAction)(id);

@interface TabBarItem : UIView

@property (nonatomic, strong) TabbarItemModel *tabBarItemModel;

@property (nonatomic, strong) TabbarButton *tabbarButton;

@property (nonatomic, copy) TabBarAction tabBarActon;

- (instancetype)initWithFrame:(CGRect)frame
                            ItemModel:(TabbarItemModel *)tabbarItemModel
                                  tag:(NSUInteger)tag;


@end
