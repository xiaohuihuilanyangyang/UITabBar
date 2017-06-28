//
//  CCHomeViewController.m
//  oupai
//
//  Created by qdms8-PC on 16/7/4.
//  Copyright © 2016年 bo. All rights reserved.
//

#import "CCHomeViewController.h"
#import "CCHomeTabBar.h"
#import "UIView+AutoLayout.h"
#import "ViewController.h"


@interface CCHomeViewController ()<CCHomeTabBarDelegate>

@property (nonatomic, strong) NSArray *items;
@property (nonatomic,weak) CCHomeTabBar *mTabBar;

@end

@implementation CCHomeViewController

+ (instancetype)homeViewControllerWithItems:(NSArray *)items {
    CCHomeViewController *controller = [[CCHomeViewController alloc] init];
    controller.items = items;
    for (CCHomeTabBarItem *item in items) {
        [controller addChildViewController:item.controller];
    }
    return controller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configView];
    
}

- (void)configView {
    CCHomeTabBar *mTabBar = [[CCHomeTabBar alloc] init];
    mTabBar.delegate = self;
    [self setValue:mTabBar forKey:@"tabBar"];
    self.mTabBar = mTabBar;
}
#pragma mark -- CCHomeTabBarDelegate
- (void)homeTabBarLiveButtonDidClicked:(CCHomeTabBar *)tabBar {
    ViewController *loginVC = [[ViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
