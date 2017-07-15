//
//  DisplayViewController.m
//  DisplayDemo
//
//  Created by ian on 16/9/22.
//  Copyright © 2016年 ian. All rights reserved.
//

#import "DisplayViewController.h"
#import "DisplayLayout.h"
#import "TabbarItemModel.h"
#import "CustomTabBar.h"
#import "DisplayCollectionViewCell.h"

static NSString * const ReuseIdentifier = @"ReuseIdentifier";

@interface DisplayViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) UICollectionView *contentScrollView;

@property (nonatomic, assign) BOOL isInitial;

@property (nonatomic, weak) CustomTabBar *tabBar;

@end

@implementation DisplayViewController


#pragma mark - life style

- (void)viewDidLoad
{
    [super viewDidLoad];
    _contentControllers = [@[] mutableCopy];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.contentScrollView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_isInitial == NO) {
        
        _isInitial = YES;

        [self.contentScrollView registerClass:[DisplayCollectionViewCell class] forCellWithReuseIdentifier:ReuseIdentifier];
        self.contentScrollView.backgroundColor = self.view.backgroundColor;

        NSUInteger count = self.contentControllers.count;
        self.contentScrollView.contentSize = CGSizeMake(count * self.view.bounds.size.width, 0);
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


#pragma mark - interface method

- (void)tabBarClick:(NSUInteger)index
{
    CGFloat offsetX = index * DisplayScreenW;
    [self.contentScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    if (self.scrollViewDidEndBlock) {
        self.scrollViewDidEndBlock(index);
    }
     UIViewController *vc = self.contentControllers[index];
    if (vc.view) {
        double delayInSeconds = 0.2;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [[NSNotificationCenter defaultCenter] postNotificationName:DisplayViewClickOrScrollDidFinsh  object:vc.childViewControllers.firstObject];
        });
    }
}

- (void)createTabbarTitles:(NSArray *)titles images:(NSArray *)images selectedImages:(NSArray *)selectedImages
{
    NSMutableArray *items = [@[] mutableCopy];
    for(NSUInteger i = 0; i < titles.count; i ++) {
        TabbarItemModel *item = [[TabbarItemModel alloc] init];
        item.title = titles[i];
        item.titleColor = UIColorFromRGB(0x0000f8);
        item.selectedTitleColor = UIColorFromRGB(0x000000);
        item.image = [UIImage imageNamed:images[i]];
        item.selectedImage = [UIImage imageNamed:selectedImages[i]];
        [items addObject:item];
    }
    CustomTabBar *tabBar = [[CustomTabBar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 49, self.view.bounds.size.width, 49) items:items];
    [self.view addSubview:tabBar];
    _tabBar = tabBar;
    
    __weak typeof(self) weakSelf = self;
    tabBar.tabBarActionBlock = ^(NSUInteger index){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf tabBarClick:index];
    };
    [_tabBar refreshTabBarButton:0];
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.contentControllers.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DisplayCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ReuseIdentifier forIndexPath:indexPath];
    
    UIViewController *vc = self.contentControllers[indexPath.row];
    cell.contentViewController = vc;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    DisplayCollectionViewCell *dislayCell = (DisplayCollectionViewCell *)cell;
    [dislayCell addViewControllerToParentViewController:self];
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    DisplayCollectionViewCell *dislayCell = (DisplayCollectionViewCell *)cell;
    [dislayCell removeViewControllerFromParentViewController];
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger offsetXInt = offsetX;
    NSInteger screenWInt = self.view.bounds.size.width;
    NSInteger i = offsetXInt / screenWInt;

    UIViewController *vc = self.childViewControllers[i];
    [[NSNotificationCenter defaultCenter] postNotificationName:DisplayViewClickOrScrollDidFinsh object:vc];

    if (self.scrollViewDidEndBlock) {
        self.scrollViewDidEndBlock(i);
    }
    
    [_tabBar refreshTabBarButton:i];
}


#pragma mark - private method

- (UINavigationController *)creatNavController:(UIViewController *)vc
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    return nav;
}

#pragma mark - getter and setter

- (UIScrollView *)contentScrollView
{
    if (_contentScrollView == nil) {
        
        DisplayLayout *layout = [[DisplayLayout alloc] init];
        UICollectionView *contentScrollView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _contentScrollView = contentScrollView;
        _contentScrollView.pagingEnabled = YES;
        _contentScrollView.showsHorizontalScrollIndicator = NO;
        _contentScrollView.bounces = NO;
        _contentScrollView.delegate = self;
        _contentScrollView.dataSource = self;
        [self.view addSubview:contentScrollView];
        
    }
    
    return _contentScrollView;
}


@end
