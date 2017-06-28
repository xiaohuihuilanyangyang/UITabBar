//
//  CCHomeTabBarItem.m
//  oupai
//
//  Created by qdms8-PC on 16/7/4.
//  Copyright © 2016年 bo. All rights reserved.
//

#import "CCHomeTabBarItem.h"
#import "CCFristViewController.h"
#import "CCSenondViewController.h"
#import "CCThereViewController.h"
#import "CCMineViewController.h"
#import "CCNavigationController.h"

#define kFocusCircleControllerImage @"home_tabbar_icon_guangchang"
#define kSqureViewControllerImage @"home_tabbar_icon_guangchang"
#define kNotifyViewControllerImage @"home_tabbar_icon_guangchang"
#define kMineViewControllerImage @"home_tabbar_icon_guangchang"

#define kHomeTabEmail @"home_tab_email"
#define kHomeTabFollowCircle @"home_tab_follow_circle"
#define kHomeTabMine @"home_tab_my"
#define kHomeTabStar @"home_tab_plaza"

#define kDemandCenterControllerTitle @"发现"
#define kSqureViewControllerTitle @"广场"
#define kNotifyViewControllerTitle @"消息"
#define kMineViewControllerTitle @"我的"
#define kDiscoverViewControllerTitle @"圈子"

@implementation CCHomeTabBarItem

- (instancetype)initWithController:(UIViewController *)controller {
    if ( self = [super init] ) {
        self.controller = controller;
        NSString *norImageName = nil;
        NSString *selectImageName = nil;
        
        if ( [controller isKindOfClass:[CCNavigationController class]] ) {
            CCNavigationController *nav = (CCNavigationController *)controller;
            controller = nav.topViewController;
        }
        
        if ( [controller isKindOfClass:[CCFristViewController class]] ) {
                self.title = kDemandCenterControllerTitle;
            controller.title = kDemandCenterControllerTitle;
                norImageName = [NSString stringWithFormat:@"%@_nor",kHomeTabFollowCircle];
                selectImageName = [NSString stringWithFormat:@"%@_select",kHomeTabFollowCircle];
            
        } else if ([controller isKindOfClass:[CCSenondViewController class]]) {
            self.title = kDiscoverViewControllerTitle;
            controller.title = kDiscoverViewControllerTitle;
            norImageName = [NSString stringWithFormat:@"%@_nor",kHomeTabStar];
            selectImageName = [NSString stringWithFormat:@"%@_select",kHomeTabStar];
        }else if ( [controller isKindOfClass:[CCThereViewController class]] ) {
            self.title = kNotifyViewControllerTitle;
            controller.title = kNotifyViewControllerTitle;
            norImageName = [NSString stringWithFormat:@"%@_nor",kHomeTabEmail];
            selectImageName = [NSString stringWithFormat:@"%@_select",kHomeTabEmail];
        } else if ( [controller isKindOfClass:[CCMineViewController class]] ) {
            self.title = kMineViewControllerTitle;
            controller.title = kMineViewControllerTitle;
            norImageName = [NSString stringWithFormat:@"%@_nor",kHomeTabMine];
            selectImageName = [NSString stringWithFormat:@"%@_select",kHomeTabMine];
        }
        
        self.image = [UIImage imageNamed:norImageName];
        self.selectedImage = [UIImage imageNamed:selectImageName];
        controller.tabBarItem = self;
        
        
        
        
        
    }
    return self;
}

+ (instancetype)homeTabBarItemWithController:(UIViewController *)controller{
    return [[self alloc] initWithController:controller];
}

@end
