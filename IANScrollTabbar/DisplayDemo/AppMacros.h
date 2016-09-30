//
//  AppMacros.h
//  DisplayDemo
//
//  Created by ian on 16/9/22.
//  Copyright © 2016年 ian. All rights reserved.
//

#ifndef AppMacros_h
#define AppMacros_h

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define DisplayScreenW [UIScreen mainScreen].bounds.size.width
#define DisplayScreenH [UIScreen mainScreen].bounds.size.height

static NSString * const DisplayViewClickOrScrollDidFinsh = @"DisplayViewClickOrScrollDidFinsh";

#endif /* AppMacros_h */
