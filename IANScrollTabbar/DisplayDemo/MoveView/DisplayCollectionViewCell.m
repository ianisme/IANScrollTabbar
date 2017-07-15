//
//  DisplayCollectionViewCell.m
//  DisplayDemo
//
//  Created by ian on 2017/7/15.
//  Copyright © 2017年 ian. All rights reserved.
//

#import "DisplayCollectionViewCell.h"

@implementation DisplayCollectionViewCell

- (void)addViewControllerToParentViewController:(UIViewController *)parentViewController
{
    [parentViewController addChildViewController:self.contentViewController];
    [self.contentViewController didMoveToParentViewController:parentViewController];
    [self.contentView addSubview:self.contentViewController.view];
}

- (void)removeViewControllerFromParentViewController
{
    [self.contentViewController.view removeFromSuperview];
    [self.contentViewController willMoveToParentViewController:nil];
    [self.contentViewController removeFromParentViewController];
}

@end
