//
//  AppDelegate.h
//  tabbar
//
//  Created by 程辉 on 2017/6/28.
//  Copyright © 2017年 SYJM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCHomeTabBarItem.h"
#import "CCHomeViewController.h"
#import "CCNavigationController.h"
#import "CCFristViewController.h"
#import "CCSenondViewController.h"
#import "CCThereViewController.h"
#import "CCMineViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, weak) CCHomeViewController *homeVC;


@end

