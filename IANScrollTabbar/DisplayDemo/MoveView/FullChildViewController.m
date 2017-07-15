//
//  FullChildViewController.m
//  DisplayDemo
//
//  Created by ian on 16/9/22.
//  Copyright © 2016年 ian. All rights reserved.

#import "FullChildViewController.h"


@implementation FullChildViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadData) name:DisplayViewClickOrScrollDidFinsh object:self];
    }
    return self;
}


- (void)viewDidLoad
{

    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
    
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
}

- (void)loadData
{
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ : %ld",self.title,indexPath.row];
    
    return cell;
}


@end
