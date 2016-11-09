//
//  TabbarButton.m
//  DisplayDemo
//
//  Created by ian on 16/9/21.
//  Copyright © 2016年 ian. All rights reserved.
//

#import "TabbarButton.h"

@implementation TabbarButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 此处可以微调图片的位置
    CGPoint center = self.imageView.center;
    center.x = self.frame.size.width/2;
    center.y = self.imageView.frame.size.height/2 + 3;
    self.imageView.center = center;
    
    // 此处可以微调文字的位置
    CGRect newFrame = [self titleLabel].frame;
    newFrame.origin.x = 0;
    newFrame.origin.y = self.imageView.frame.size.height + 5;
    newFrame.size.width = self.frame.size.width;
    
    self.titleLabel.frame = newFrame;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
