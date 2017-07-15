//
//  DisplayCollectionViewCell.h
//  DisplayDemo
//
//  Created by ian on 2017/7/15.
//  Copyright © 2017年 ian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIViewController *contentViewController;

- (void)addViewControllerToParentViewController:(UIViewController *)parentViewController;

- (void)removeViewControllerFromParentViewController;


@end
